package org.sacredheart

import org.apache.commons.lang.StringUtils
import org.sacredheart.medkind.MedkindPatientParser
import org.sacredheart.report.VisitReport

class PatientService {
    static transactional = true

    def importCSVData(Reader reader) {
        int success = 0, failed = 0;
        def failedPatientIds = [] as List<String>
        new MedkindPatientParser().parse(reader) { Patient p ->
            Patient old = Patient.findByPatientId(p.patientId)
            if (old) {
                // overwrite existing properties
                old.properties = p.properties
            } else {
                old = p
            }
            try {
                old.save(failOnError: true)
                success++
            } catch (Exception ex) {
                failed++
                failedPatientIds.add(p.patientId)
            }
        }
        log.error("Import of patients success = ${success} failed = ${failed}")
        failedPatientIds
    }

    def list(params) {
        def ignoreCaseLike = [
            lastName: params.lastName?.replace('*', '%'),
            patientId: params.patientId?.replace('*', '%')
        ]
        def c = Patient.createCriteria()
        def results = c.list(max: params.max, offset: params.offset) {
            cache(true)
            ignoreCaseLike.each { k, v ->
                if (v) {
                    ilike(k, v)
                }
            }
            order("lastName")
        }
        [patientInstanceList: results.list, patientInstanceTotal: results.totalCount]
    }

    List<?> getAllZipCodes() {
        findAllByPropertyName('zipcode')
    }

    List<?> getAllCounties() {
        findAllByPropertyName('county')
    }

    List<?> findAllByPropertyName(String prop) {
        Patient.withCriteria() {
            projections {
                distinct(prop)
            }
            isNotNull(prop)
        }
    }

    def run(long vpId, Date start, Date end) {
        VisitReport vp = VisitReport.get(vpId)
        PatientVisit.withCriteria() {

            projections {
                property('dateOfVisit', 'dateOfVisit')
                property('typeOfVisit', 'typeOfVisit')
                patient {
                    property('lastName', 'lastName')
                    property('firstName', 'firstName')
                }
            }

            between('dateOfVisit', start, end)

            // determine ordering..
            order('dateOfVisit')

            // only visits of these types
            if (vp.visitTypes) {
                inList('visitType', vp.visitTypes)
            }

            // all the patient criteria
            patient {
                if (StringUtils.isNotBlank(vp.patientIdPattern)) {
                    def propValue = vp.patientIdPattern.replace('*', '%')
                    ilike('patientId', propValue)
                }
                if (StringUtils.isNotBlank(vp.firstNamePattern)) {
                    def propValue = vp.firstNamePattern.replace('*', '%')
                    ilike('firstName', propValue)
                }
                if (StringUtils.isNotBlank(vp.middleNamePattern)) {
                    def propValue = vp.middleNamePattern.replace('*', '%')
                    ilike('middleName', propValue)
                }
                if (StringUtils.isNotBlank(vp.lastNamePattern)) {
                    def propValue = vp.lastNamePattern.replace('*', '%')
                    ilike('lastName', propValue)
                }

                if (vp.counties) {
                    inList('county', vp.counties)
                }

                if (vp.zipCodes) {
                    inList('zipcode', vp.zipCodes)
                }

                if (vp.ageRange?.start != null && vp.ageRange?.end != null) {
                    Calendar startCalendar = Calendar.getInstance()
                    startCalendar.add(Calendar.YEAR, (-1) * vp.ageRange.end)
                    Calendar endCalendar = Calendar.getInstance()
                    endCalendar.add(Calendar.YEAR, (-1) * vp.ageRange.start)
                    between('dateOfBirth', startCalendar.getTime(), endCalendar.getTime())
                }

                if (vp.citizen) {
                    eq('citizen', vp.citizen)
                }

                if (vp.veteran) {
                    eq('veteran', vp.veteran)
                }

                if (vp.gender) {
                    eq('gender', vp.gender)
                }

                if (vp.races) {
                    inList('race', vp.races)
                }

                if (vp.languages) {
                    inList('language', vp.languages)
                }

                if (vp.maritalStatuses) {
                    inList('maritalStatus', vp.maritalStatuses)
                }

                if (vp.educations) {
                    inList('education', vp.educations)
                }

                if (vp.numberOfFamilyRange?.start != null
                        && vp.numberOfFamilyRange?.end != null) {
                    between('numberOfFamily',
                            vp.numberOfFamilyRange.start,
                            vp.numberOfFamilyRange.end)

                }

//                Integer yearlyFamilyIncome
//                IncomeRange familyIncomeRange

            }
        }
    }
}
