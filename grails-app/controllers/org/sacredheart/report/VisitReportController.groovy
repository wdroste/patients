package org.sacredheart.report

class VisitReportController {

    static scaffold = true

    def patientService

    def create() {
        switch (request.method) {
            case 'GET':
                [
                        visitReportInstance: new VisitReport(params),
                        zipcodes: patientService.allZipCodes,
                        countries: patientService.allCounties
                ]
                break
            case 'POST':
                def visitReportInstance = new VisitReport(params)
                if (!visitReportInstance.save(flush: true)) {
                    render view: 'create', model: [visitReportInstance: visitReportInstance]
                    return
                }

                flash.message = message(
                        code: 'default.created.message',
                        args: [message(code: 'visitReport.label'), visitReportInstance.id])
                redirect action: 'show', id: visitReportInstance.id
                break
        }
    }

    /**
     * Setup the dialog.
     */
    def setup() {
        def inst = VisitReport.get(params.id)
        [visitReportInstance: inst]
    }

    /**
     * Run the report.
     */
    def run(RunCommand runCommand) {
        [reportInstanceList: patientService.run(runCommand.id, runCommand.start, runCommand.end)]
    }
}


@grails.validation.Validateable
class RunCommand {
    long id
    Date start
    Date end
    static constraints = {
        id nullable: false
        start nullable: false
        end nullable: false
    }
}