package org.sacredheart

import org.compass.annotations.Searchable
import org.compass.annotations.SearchableId
import org.compass.annotations.SearchableProperty

@Searchable
class User {
    @SearchableId
    String email
    @SearchableProperty
    String fullName
    String passwordHash
    
    static hasMany = [
        roles: Role,
        permissions: String
    ]

    static constraints = {
        email(nullable: false, blank: false, unique: true)
    }

    static mapping = {
        email index: 'IDX_USER_EMAIL'
    }
}
