package org.sacredheart

class PatientVisit {

    Date dateOfVisit
    VisitType typeOfVisit
    String screeningResults

    static belongsTo = [patient: Patient]

    static constraints = {

    }
}
