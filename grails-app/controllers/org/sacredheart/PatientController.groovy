package org.sacredheart

class PatientController {
    static scaffold = true

    def patientService

    def list() {
        params.offset = params.int('offset') ?: 0
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        patientService.list(params)
    }

}
