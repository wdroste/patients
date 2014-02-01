package org.sacredheart

import org.compass.annotations.Searchable
import org.compass.annotations.SearchableComponent
import org.compass.annotations.SearchableId
import org.compass.annotations.SearchableProperty

@Searchable
class PatientVisit implements Serializable {

    static VISITTYPE = [
        'WalkIn', 'ChronicCare', 'CancerScreening', 'Lab', 'NursesVisit', 'DrPhoneConsult',
        'DiabeticEducation', 'RegistrationScreening', 'OtherEducation', 'Other', 'FluShot',
        'NoShow', 'Cancelled', 'Dentist'
    ]

    @SearchableId
    Long id

    @SearchableComponent
    Provider provider

    @SearchableProperty
    String typeOfVisit

    @SearchableProperty
    String diagnosisCode

    @SearchableProperty
    Date dateOfVisit = new Date()

    @SearchableComponent
    Patient patient

    static belongsTo = [patient: Patient]

    static mapping = {
        sort 'dateOfVisit':'desc'
    }

    static constraints = {
        provider nullable: true
        typeOfVisit blank: false
        diagnosisCode nullable: true
    }
}
