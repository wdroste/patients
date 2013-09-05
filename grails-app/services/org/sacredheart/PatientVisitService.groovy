package org.sacredheart

import org.sacredheart.medkind.MedkindPatientParser

class PatientVisitService {

    static transactional = true

    /**
     * Import CSV data from Medkind.
     */
    def importCSVData(Reader reader, Closure monitor) {
        new MedkindPatientParser().parse(reader) { Patient p ->
            // load any exist patient data
            Patient patient = Patient.findByPatientId(p.patientId)
            if (patient) {
                // overwrite existing properties
                patient.properties = p.properties
            } else {
                patient = p
            }

            // attempt to update the patient object..
            try {
                patient.save(failOnError: true)
                monitor(true, p.patientId, null)
            } catch (Exception ex) {
                monitor(false, p.patientId, ex.message)
            }
        }
    }

}
