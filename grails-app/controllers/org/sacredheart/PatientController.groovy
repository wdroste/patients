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

    /**
     * TODO:
     */
    def patientIdLookup() {
        println "Parameters: ${params}"
        withFormat {
            json {
                def data = ['A', 'B', 'C'] as JSON
                render data
            }
        }
    }

}
