package org.sacredheart

class Role {
    String name

    static hasMany = [ users: User, permissions: String ]
    static belongsTo = User

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }

    static mapping = {
        name index: 'IDX_ROLE_NAME'
    }

}
