package org.sacredheart

class Provider {

    String license
    String title
    String lastName
    String firstName
    String middleName

    static constraints = {
        title blank: false
        license blank: false
        lastName blank: false
        firstName blank: false
        middleName nullable: true
    }

}
