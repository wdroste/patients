package org.sacredheart.report

import org.sacredheart.Patient
import org.sacredheart.PatientVisit
import org.sacredheart.Provider
import org.sacredheart.YesNo
import grails.converters.JSON

import java.text.SimpleDateFormat

/**
 * Used for static based reports.
 */
class ReportController {

    def grailsApplication
    def patientVisitService

    def index() {
        [
                reports: [
                        'visitReport',
                        'screeningResultsReport',
                        'establishedReport',
                        'visitsByProviderReport',
                        'transportationReport',
                        'a2cReport',
                        'unitedWayReport'
                ]
        ]
    }

    def run(ReportRunCommand cmd) {
        if (cmd.start > cmd.end) {
            throw new IllegalStateException('End date is before start date.')
        }
        // internally forward to the proper report action..
        forward(action: cmd.reportId, params: params)
    }

    def establishedReport(ReportRunCommand cmd) {
        def map = patientVisitService.establishedPatientVisitReport(cmd.start, cmd.end)
        return map
    }

    /**
     * Determine the total number of visits between start/end date. Determine the distinct patients.
     */
    def visitReport(ReportRunCommand cmd) {
        def map = [:]
        grailsApplication.config.app.visitTypes.each { visitType ->
            map[visitType] = PatientVisit.countByTypeOfVisitAndDateOfVisitBetween(visitType, cmd.start, cmd.end)
        }
        [
                'startDate'           : cmd.start,
                'endDate'             : cmd.end,
                'totalVisits'         : totalPatientVisits(cmd),
                'distinctPatientCount': distinctPatientCount(cmd),
                'results'             : map,
                'resultsJson'         : map as JSON
        ]
    }

    /**
     * Determine the count for each screening result.
     */
    def screeningResultsReport(ReportRunCommand cmd) {
        def map = [:]
        Patient.SCREENING_RESULTS.each { result ->
            map[result] = PatientVisit.withCriteria {
                projections {
                    countDistinct('patient')
                }
                patient {
                    eq('screeningResult', result)
                }
                between('dateOfVisit', cmd.start, cmd.end)
            }[0]
        }
        [
                'startDate'           : cmd.start,
                'endDate'             : cmd.end,
                'totalVisits'         : totalPatientVisits(cmd),
                'distinctPatientCount': distinctPatientCount(cmd),
                'results'             : map,
                'resultsJson'         : map as JSON
        ]
    }

    def distinctPatientCount(ReportRunCommand cmd) {
        PatientVisit.withCriteria {
            projections {
                countDistinct('patient')
            }
            between('dateOfVisit', cmd.start, cmd.end)
        }[0]
    }

    def totalPatientVisits(ReportRunCommand cmd) {
        PatientVisit.countByDateOfVisitBetween(cmd.start, cmd.end)
    }

    /**
     * Determine the count for each screening result.
     */
    def visitsByProviderReport(ReportRunCommand cmd) {
        def map = [:]
        Provider.list().each { theProvider ->
            if (null == theProvider || theProvider.license == 'NA') {
                return
            }
            def count = PatientVisit.withCriteria {
                projections {
                    countDistinct('patient')
                }
                provider {
                    idEq(theProvider.id)
                }
                between('dateOfVisit', cmd.start, cmd.end)
            }[0]
            // only those providers w/ visits..
            if (count > 0) {
                map[theProvider.title] = count;
            }
        }
        def sorted = map.sort{ a, b -> -1 * (a.value <=> b.value) }
        def providers = sorted.collect({ k,v -> k}) as JSON
        def patientVisitCounts = sorted.collect({ k,v -> v}) as JSON
        [
                'startDate'           : cmd.start,
                'endDate'             : cmd.end,
                'totalVisits'         : totalPatientVisits(cmd),
                'distinctPatientCount': distinctPatientCount(cmd),
                'results'             : map.sort() { !it.value },
                'providers'           : providers,
                'patientVisitCounts'  : patientVisitCounts
        ]
    }

    def transportationReport(ReportRunCommand cmd) {
        def q = { yesOrNo ->
            between('dateOfVisit', cmd.start, cmd.end)
            patient {
                eq('transportation', yesOrNo)
            }
            projections {
                distinct('patient')
            }
        }
        def yesResult = PatientVisit.createCriteria().count(q.curry(YesNo.Yes))
        def noResult = PatientVisit.createCriteria().count(q.curry(YesNo.No))
        ['startDate': cmd.start, 'endDate': cmd.end, 'yes': yesResult, 'no': noResult]
    }

    def a2cReport(ReportRunCommand cmd) {
        def results = PatientVisit.withCriteria {
            projections {
                patient {
                    property('patientId')
                    property('lastName')
                    property('firstName')
                    property('dateOfBirth')
                }
                property('dateOfVisit')
                property('diagnosisCode')
            }
            between('dateOfVisit', cmd.start, cmd.end)
        }
        
        [visits: results.collect({ 
            [
                patientId      : it[0],
                lastName       : it[1],
                firstName      : it[2],
                dateOfBirth    : it[3],
                dateOfVisit    : it[4],
                diagnosisCode  : it[5]
            ]
        })]
    }

    def calculateDate(subYears) {
        def cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(java.util.Calendar.YEAR, -1 * subYears);
        cal.getTime()
    }

    def unitedWayReport(ReportRunCommand cmd) {
        // distinct query by property, for a range of visits
        def c = { f ->
            between('dateOfVisit', cmd.start, cmd.end)
            projections {
                patient {
                    groupProperty(f)
                    countDistinct('id')
                }
            }
        }
        // by zipcode
        def zipCodeData = PatientVisit.withCriteria(c.curry('zipcode'))
        // by gender
        def genderData = PatientVisit.withCriteria(c.curry('gender'))
        // by ethnicity
        def ethnicityData = PatientVisit.withCriteria(c.curry('race'))

        // distinct query by property, for a range of visits
        def dateRanges = [
          [0, 5],
          [6,18],
          [19,54],
          [55,200]
        ]

        def ageRangeData = dateRanges.collect { r ->
            def start = calculateDate(r[1])
            def end = calculateDate(r[0])
            println("Start Date: $start -> $end")
            def results = PatientVisit.withCriteria {
                between('dateOfVisit', cmd.start, cmd.end)
                projections {
                    patient {
                        countDistinct('id')
                    }
                }
                patient {
                    between('dateOfBirth', start, end)
                }
            }
            ["${r[0]}-${r[1]}", results[0]]
        }

        [
            'startDate': cmd.start,
            'endDate': cmd.end,
            'zipCodeData': zipCodeData,
            'genderData' : genderData,
            'ethnicityData': ethnicityData,
            'ageRangeData': ageRangeData
        ]
    }
}

@grails.validation.Validateable
class ReportRunCommand {
    def dateFormat = new SimpleDateFormat("yy-MM-dd")

    String reportId
    String start_submit
    String end_submit

    Date getStart() {
        dateFormat.parse(start_submit)
    }

    Date getEnd() {
        dateFormat.parse(end_submit)
    }

    static constraints = {
        reportId blank: false
        start_submit blank: false
        end_submit blank: false
    }
}
