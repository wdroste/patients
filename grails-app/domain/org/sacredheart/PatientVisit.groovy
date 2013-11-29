package org.sacredheart

class PatientVisit implements Serializable {
    static VISITTYPE = [
        'WalkIn', 'ChronicCare', 'CancerScreening', 'Lab', 'NursesVisit', 'DrPhoneConsult',
        'DiabeticEducation', 'RegistrationScreening', 'OtherEducation', 'Other', 'FluShot',
        'NoShow', 'Cancelled'
    ]

    String typeOfVisit
    Provider provider
    Date dateOfVisit = new Date()

    String diagnosisCode


    static mappedBy = [provider: 'none']
    static belongsTo = [patient: Patient]

    static constraints = {
        provider nullable: true
        typeOfVisit blank: false
        diagnosisCode nullable: true
    }
}
