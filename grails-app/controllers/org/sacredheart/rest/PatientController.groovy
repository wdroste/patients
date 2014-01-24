package org.sacredheart.rest

import grails.rest.RestfulController
import org.sacredheart.Patient

class PatientController extends RestfulController<Patient> {
    static namespace = 'v1'
    static responseFormats = ['json']

    PatientController() {
        super(Patient)
    }

    /**
     * Lists all resources up to the given maximum
     *
     * @param max The maximum
     * @return A list of resources
     */
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.offset = params.int('offset') ?: 0

        def results, total
        if (params?.q) {
            // because search needs a query..
            def search = Patient.search(params.q, params)
            results = search.results
            total = search.total
        } else {
            results = listAllResources(params)
            total = countResources()
        }

        respond results, model: ['total': total]
    }
}
