package org.sacredheart.rest

import grails.rest.RestfulController
import org.sacredheart.Patient

class PatientController extends RestfulController<Patient> {
    static namespace = 'v1'
    static responseFormats = ['json', 'xml']

    PatientController() {
        super(Patient)
    }

    def total() {
        response resource.count()
    }
}
