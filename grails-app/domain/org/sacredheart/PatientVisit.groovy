package org.sacredheart

class PatientVisit {

    Date dateOfVisit
    String typeOfVisit
    String screeningResults

    static belongsTo = [patient: Patient]

    static constraints = {

    }
}
