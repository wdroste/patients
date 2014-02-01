package org.sacredheart

import org.compass.annotations.Searchable
import org.compass.annotations.SearchableId
import org.compass.annotations.SearchableProperty

@Searchable
class Provider {

    @SearchableId
    Long id
    @SearchableProperty
    String license
    @SearchableProperty
    String title
    @SearchableProperty
    String lastName
    @SearchableProperty
    String firstName
    @SearchableProperty
    String middleName

    static constraints = {
        title blank: false
        license blank: false
        lastName blank: false
        firstName blank: false
        middleName nullable: true
    }

}
