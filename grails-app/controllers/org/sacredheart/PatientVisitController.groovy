package org.sacredheart

import grails.converters.JSON

class PatientVisitController {
    static scaffold = true

    def patientVisitService

    def index() { redirect(action:'list') }

    def list() {
        patientVisitService.list(params)
    }

    def uploadProgress() {
        String transactionId = params.get('id')
        def results = patientVisitService.progress(transactionId).collect { map ->
            def msg = (map.success) ?
                g.message(code:'patientVisit.upload.success', args:[map.patientId] as Object[]) :
                g.message(code:'patientVisit.upload.failure', args:[map.patientId, map.message] as Object[])
            ['success':map.success, 'message':msg]
        }
        render (results as JSON)
    }

    def upload() {
        switch (request.method) {
            case 'POST':
                // check the parameter
                def f = request.getFile('upload_csv')
                if (f.empty) {
                    flash.message = 'File cannot be empty'
                    return [:]
                }

                // upload the file..
                def tmpFile = File.createTempFile("patient_visit_upload_csv-", ".csv")
                f.transferTo(tmpFile)
                try {
                    // send back a transaction ID for progress reports..
                    ['transactionId': patientVisitService.processFile(tmpFile)]
                } catch (ex) {
                    flash.message = ex.message
                }
                break
            default:
                [:]
                break
        }
    }
}
