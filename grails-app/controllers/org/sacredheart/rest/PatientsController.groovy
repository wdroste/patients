package org.sacredheart.rest

import grails.rest.RestfulController
import org.sacredheart.Patient

class PatientsController extends RestfulController<Patient> {
    static namespace = 'v1'

    PatientsController() {
        super(Patient)
    }
}
