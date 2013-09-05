package org.sacredheart

import grails.converters.JSON

class PatientController {
    static scaffold = true

    def patientService

    def list() {
        params.offset = params.int('offset') ?: 0
        params.max = Math.min(params.max ? params.int('max') : 10, 1000)
        patientService.list(params)
    }

    def visit() {
        def patientVisit = new PatientVisit()
        patientVisit.patient = Patient.get(params.id)
        ['patientVisitInstance': patientVisit]

    }

    def addVisit() {
        switch (request.method) {
            case 'GET':
                [patientVisitInstance: new PatientVisit(params)]
                break
            case 'POST':
                def patientVisitInstance = new PatientVisit(params)
                if (!patientVisitInstance.save(flush: true)) {
                    render view: 'visit', model: [patientVisitInstance: patientVisitInstance]
                    return
                }

                def args = [message(code: 'patientVisit.label'), patientVisitInstance.id]
                flash.message = message('code': 'default.created.message', 'args':args)
                redirect action: 'list'
                break
        }
    }

    def uploadProgress() {
        String transactionId = params.get('id')
        def results = patientService.progress(transactionId).collect { map ->
            def msg = (map.success) ?
                g.message(code:'patient.upload.success', args:[map.patientId] as Object[]) :
                g.message(code:'patient.upload.failure', args:[map.patientId, map.message] as Object[])
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
                def tmpFile = File.createTempFile("patient_upload_csv-", ".csv")
                f.transferTo(tmpFile)
                try {
                    // send back a transaction ID for progress reports..
                    ['transactionId': patientService.processFile(tmpFile)]
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
