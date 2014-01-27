package org.sacredheart

class PatientVisit implements Serializable {
    static VISITTYPE = [
        'WalkIn', 'ChronicCare', 'CancerScreening', 'Lab', 'NursesVisit', 'DrPhoneConsult',
        'DiabeticEducation', 'RegistrationScreening', 'OtherEducation', 'Other', 'FluShot',
        'NoShow', 'Cancelled', 'Dentist'
    ]

    String typeOfVisit
    Provider provider
    Date dateOfVisit = new Date()

    String diagnosisCode

    static mapping = {
        provider ignoreNotFound: true
        sort 'dateOfVisit':'desc'
    }

    static belongsTo = [patient: Patient]

    static constraints = {
        provider nullable: true
        typeOfVisit blank: false
        diagnosisCode nullable: true
    }
}
