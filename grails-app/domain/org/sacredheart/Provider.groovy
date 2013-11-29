package org.sacredheart

class Provider {

    String license
    String title
    String lastName
    String firstName
    String middleName

    String prefix
    String suffix

    static constraints = {
        title blank: false
        license blank: false
        lastName blank: false
        firstName blank: false
        middleName nullable: true

        prefix nullable: true
        suffix nullable: true
    }

}
