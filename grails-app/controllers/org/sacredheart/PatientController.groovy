package org.sacredheart

import grails.converters.JSON

class PatientController {

    static scaffold = true

    def patientService

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        forward(action: 'list', params: params)
    }

    private getPatients() {
        params.offset = params.int('offset') ?: 0
        params.max = Math.min(params.max ? params.int('max') : 25, 1000)

        // clear flash message
        flash.message = ''
        def results, total
        if (params?.q) {
            // because search needs a query..
            try {
                def search = Patient.search(params.q, params)
                results = search.results
            } catch (Exception ex) {
                log.error('Failed to execute query: ' + ex.message)
                flash.message = ex.localizedMessage.replaceAll(/.*ParseException: /, '')
                results = []
            }
        } else {
            results = Patient.list(params)
        }
        results
    }

    def list() {
        [patientInstanceList: getPatients()]
    }

    def infiniteList() {
        [patientInstanceList: getPatients()]
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
