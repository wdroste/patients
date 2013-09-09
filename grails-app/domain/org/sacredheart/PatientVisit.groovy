package org.sacredheart

class PatientVisit implements Serializable {
    static VISITTYPE = [
        'WalkIn', 'ChronicCare', 'CancerScreening', 'Lab', 'NursesVisit', 'DrPhoneConsult',
        'DiabeticEducation', 'RegistrationScreening', 'OtherEducation', 'Other', 'FluShot',
        'NoShow', 'Cancelled'
    ]

    String typeOfVisit
    Date dateOfVisit = new Date()

    static belongsTo = [patient: Patient]
}
