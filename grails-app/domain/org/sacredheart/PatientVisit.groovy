package org.sacredheart

class PatientVisit implements Serializable {

    VisitType typeOfVisit
    Date dateOfVisit = new Date()

    static belongsTo = [patient: Patient]
}
