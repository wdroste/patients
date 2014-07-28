package org.sacredheart.report

import java.text.SimpleDateFormat

class VisitReportController {

    static scaffold = true

    def ftpService
    def exportService
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
        def model = patientService.run(runCommand.id, runCommand.start, runCommand.end)
        model['ftpSupport'] = ftpService.enabled
        return model
    }

    /**
     * Export the report as CSV.
     */
    def exportCSV(RunCommandTime cmd) {
        // create the export file..
        def f = exportService.exportCSV(cmd.id, '.txt', new Date(cmd.start), new Date(cmd.end))

        // set the response headers..
        response.setContentType('text/csv')
        response.setHeader('Content-disposition', "attachment; filename=\"${f.name}\"")

        // send the file to the client..
        f.withInputStream { ins ->
            response.outputStream << ins
        }

    }
}
@grails.validation.Validateable
class RunCommandTime {
    long id
    long start
    long end
    static constraints = {
        id nullable: false
        start nullable: false
        end nullable: false
    }
}

@grails.validation.Validateable
class RunCommand {
    def dateFormat = new SimpleDateFormat("yy-MM-dd")

    Long id
    String start_submit
    String end_submit

    Date getStart() {
        dateFormat.parse(start_submit)
    }

    Date getEnd() {
        dateFormat.parse(end_submit)
    }

    static constraints = {
        id blank: false
        start_submit blank: false
        end_submit blank: false
    }
}
