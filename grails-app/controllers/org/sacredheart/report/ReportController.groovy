package org.sacredheart.report

import org.sacredheart.Patient
import org.sacredheart.PatientVisit
import org.sacredheart.Provider

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
                        'visitsByProviderReport'
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
                'startDate': cmd.start,
                'endDate': cmd.end,
                'totalVisits': totalPatientVisits(cmd),
                'distinctPatientCount': distinctPatientCount(cmd),
                'results': map
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
                'startDate': cmd.start,
                'endDate': cmd.end,
                'totalVisits': totalPatientVisits(cmd),
                'distinctPatientCount': distinctPatientCount(cmd),
                'results': map
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
                return;
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
                'startDate': cmd.start,
                'endDate': cmd.end,
                'totalVisits': totalPatientVisits(cmd),
                'distinctPatientCount': distinctPatientCount(cmd),
                'results': map.sort() { !it.value }
        ]
    }

}

@grails.validation.Validateable
class ReportRunCommand {
    String reportId
    Date start
    Date end
    static constraints = {
        reportId blank: false
        start nullable: false
        end nullable: false
    }
}
