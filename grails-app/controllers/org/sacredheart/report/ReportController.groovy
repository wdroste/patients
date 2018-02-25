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
                        'a2cReport'
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
        [
                'startDate'           : cmd.start,
                'endDate'             : cmd.end,
                'totalVisits'         : totalPatientVisits(cmd),
                'distinctPatientCount': distinctPatientCount(cmd),
                'results'             : map.sort() { !it.value },
                'resultsJson'         : map as JSON
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
