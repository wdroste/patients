package org.sacredheart

class PatientVisit {

    VisitType typeOfVisit
    Date dateOfVisit = new Date()

    static belongsTo = [patient: Patient]

    static constraints = {

    }
}
