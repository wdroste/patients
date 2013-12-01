package org.sacredheart

import com.google.common.cache.CacheBuilder
import com.google.common.cache.CacheLoader
import com.google.common.cache.LoadingCache
import org.apache.commons.lang.StringUtils
import org.sacredheart.medkind.MedkindPatientParser
import org.sacredheart.report.VisitReport

import java.util.concurrent.ArrayBlockingQueue
import java.util.concurrent.BlockingQueue
import java.util.concurrent.TimeUnit

class PatientService {
    static transactional = true

    /**
     * Import CSV data from Medkind.
     */
    def importCSVData(Reader reader, Closure monitor) {
        new MedkindPatientParser().parse(reader) { Patient p ->
            // load any exist patient data
            Patient patient = Patient.findByPatientId(p.patientId)
            if (patient) {
                // overwrite existing properties
                patient.properties = p.properties
            } else {
                patient = p
            }

            // attempt to update the patient object..
            try {
                patient.save(failOnError: true)
                monitor(true, p.patientId, null)
            } catch (Exception ex) {
                monitor(false, p.patientId, ex.message)
            }
        }
    }

    def list(params) {
        def ignoreCaseLike = [
            lastName: params.lastName,
            patientId: params.patientId
        ]
        def c = Patient.createCriteria()
        def results = c.list(max: params.max, offset: params.offset) {
            ignoreCaseLike.each { k, v ->
                if (StringUtils.isNotBlank(v)) {
                    ilike(k, "%${v}%")
                }
            }
            order(params.sort ?: 'lastName', params.order ?: 'asc')
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
        def list = query(vp, start, end) {
            projections {
                property('dateOfVisit', 'dateOfVisit')
                property('typeOfVisit', 'typeOfVisit')
                patient {
                    property('lastName', 'lastName')
                    property('firstName', 'firstName')
                }
            }
        }
        ['reportInstanceList':list, 'visitReportInstance': vp, startDate: start, endDate: end]
    }

    def query(VisitReport vp, Date start, Date end, Closure theProjections) {
        return PatientVisit.withCriteria() {
            // add any projections..
            theProjections.delegate = delegate
            theProjections()

            between('dateOfVisit', start, end)
            // determine ordering..
            order('dateOfVisit')
            // only visits of these types
            if (vp.visitTypes) {
                inList('typeOfVisit', vp.visitTypes)
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

                if (vp.zipCodes) {
                    inList('zipcode', vp.zipCodes)
                }

                if (vp.citizen) {
                    eq('citizen', vp.citizen)
                }

                if (vp.veteran) {
                    eq('veteran', vp.veteran)
                }

                if (vp.genders) {
                    eq('gender', vp.genders)
                }

                if (vp.races.size()) {
                    'in'('race', vp.races)
                }

                if (vp.languages.size()) {
                    'in'('language', vp.languages)
                }

                if (vp.maritalStatuses.size()) {
                    'in'('maritalStatus', vp.maritalStatuses)
                }

                if (vp.screeningResults.size()) {
                    'in'('screeningResult', vp.screeningResults)
                }

                if (vp.educations.size()) {
                    'in'('education', vp.educations)
                }

                if (vp.ageRange?.start != null && vp.ageRange?.end != null) {
                    Calendar startCalendar = Calendar.getInstance()
                    startCalendar.add(Calendar.YEAR, (-1) * vp.ageRange.end)
                    Calendar endCalendar = Calendar.getInstance()
                    endCalendar.add(Calendar.YEAR, (-1) * vp.ageRange.start)
                    between('dateOfBirth', startCalendar.time, endCalendar.time)
                }

                if (vp.numberOfFamilyRange?.start != null
                        && vp.numberOfFamilyRange?.end != null) {
                    between('numberOfFamily',
                            vp.numberOfFamilyRange.start,
                            vp.numberOfFamilyRange.end)

                }
            }
        }
    }

    LoadingCache<String, BlockingQueue<?>> messageQueue = CacheBuilder.newBuilder()
            .maximumSize(200)
            .expireAfterWrite(10, TimeUnit.MINUTES)
            .build(
            new CacheLoader<String, BlockingQueue<?>>() {
                public BlockingQueue<?> load(String key) {
                    return new ArrayBlockingQueue<?>(20000)
                }
            }
    )

    def processFile(File tmpFile) {
        def tx = UUID.randomUUID().toString()
        // asynchronous do not expect may calls..
        Thread.start {
            // make sure to close the reader
            tmpFile.withReader { rdr ->
                // provide a transaction
                Patient.withTransaction {
                    // send the CSV file through the processor
                    importCSVData(rdr) { success, patientId, message ->
                        Queue<?> queue = messageQueue.get(tx)
                        queue.add(['success': success, 'patientId':patientId, 'message':message])
                    }
                }
            }
            // if there's no problems delete the file..
            tmpFile.delete()
        }
        tx
    }

    def progress(String tx) {
        def ret = []
        def q = messageQueue.get(tx)
        if (q) {
            q.drainTo(ret, 10000)
        }
        ret
    }
}
