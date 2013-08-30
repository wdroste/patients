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
}
