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

    def edit() {
        switch (request.method) {
            case 'GET':
                def visitReportInstance = VisitReport.get(params.id)
                if (!visitReportInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'visitReport.label'), params.id])
                    redirect action: 'list'
                    return
                }

                [
                        visitReportInstance: visitReportInstance,
                        zipcodes: patientService.allZipCodes,
                        countries: patientService.allCounties
                ]
                break
            case 'POST':
                def visitReportInstance = VisitReport.get(params.id)
                if (!visitReportInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'visitReport.label'), params.id])
                    redirect action: 'list'
                    return
                }

                if (params.version) {
                    def version = params.version.toLong()
                    if (visitReportInstance.version > version) {
                        visitReportInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
                                [message(code: 'visitReport.label', default: 'VisitReport')] as Object[],
                                "Another user has updated this VisitReport while you were editing")
                        render view: 'edit', model: [visitReportInstance: visitReportInstance]
                        return
                    }
                }

                visitReportInstance.properties = params

                if (!visitReportInstance.save(flush: true)) {
                    render view: 'edit', model: [visitReportInstance: visitReportInstance]
                    return
                }

                flash.message = message(code: 'default.updated.message', args: [message(code: 'visitReport.label', default: 'VisitReport'), visitReportInstance.id])
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
        patientService.run(runCommand.id, runCommand.start, runCommand.end)
    }
}


@grails.validation.Validateable
class RunCommand {
    long id
    Date start
    Date end
    static constraints = {
        id nullablTPatiente: false
        start nullable: false
        end nullable: false
    }
}