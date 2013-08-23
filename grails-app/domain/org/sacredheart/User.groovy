package org.sacredheart

class User {
    String email
    String fullName
    String passwordHash
    
    static hasMany = [ roles: Role, permissions: String ]

    static constraints = {
        email(nullable: false, blank: false, unique: true)
    }
}
