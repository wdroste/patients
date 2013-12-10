package org.sacredheart.report

import org.sacredheart.Patient
import org.sacredheart.PatientVisit

/**
 * Used for static based reports.
 */
class ReportController {

    def patientVisitService

    def index() {
        [reports: ['visitReport', 'screeningResultsReport', 'establishedReport']]
    }

    def run(ReportRunCommand cmd) {
        if (cmd.start > cmd.end) {
            throw new IllegalStateException('End date is before start date.')
        }
        // internally forward to the proper report action..
        forward(action:cmd.reportId, params:params)
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
        PatientVisit.VISITTYPE.each { visitType ->
            map[visitType] = PatientVisit.countByTypeOfVisitAndDateOfVisitBetween(visitType, cmd.start, cmd.end)
        }
        [
            'startDate': cmd.start,
            'endDate': cmd.end,
            'totalVisits':totalPatientVisits(cmd),
            'distinctPatientCount':distinctPatientCount(cmd),
            'results':map
        ]
    }

    /**
     * Determine the count for each screening result.
     */
    def screeningResultsReport(ReportRunCommand cmd) {
        def map = [:]

        // make a map of patients that are before and after start date..
        def visits = PatientVisit.withCriteria {



        }

        [
            'startDate': cmd.start,
            'endDate': cmd.end,
            'totalVisits':totalPatientVisits(cmd),
            'distinctPatientCount':distinctPatientCount(cmd),
            'results':map
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
