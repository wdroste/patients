package org.sacredheart

import org.compass.annotations.Searchable
import org.compass.annotations.SearchableComponent
import org.compass.annotations.SearchableId
import org.compass.annotations.SearchableProperty

@Searchable
class PatientVisit implements Serializable {

    @SearchableId
    Long id

    @SearchableComponent(prefix = "provider_")
    Provider provider

    @SearchableProperty
    String typeOfVisit

    @SearchableProperty
    String diagnosisCode

    @SearchableProperty
    Date dateOfVisit = new Date()

    @SearchableComponent(prefix = "patient_")
    Patient patient

    // auto-timestamped
    @SearchableProperty
    Date dateCreated
    Date lastUpdated

    static belongsTo = [patient: Patient]

    static mapping = {
        sort 'dateOfVisit':'desc'
    }

    static constraints = {
        provider nullable: true
        typeOfVisit blank: false
        diagnosisCode nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }
}
