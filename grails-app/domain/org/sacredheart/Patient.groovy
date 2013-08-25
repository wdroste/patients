package org.sacredheart

class Patient {

    String patientId
    String firstName
    String middleName
    String lastName

    Date dateOfBirth
    String zipcode
    String county
    Boolean citizen
    Boolean veteran
    Gender gender
    Race race
    Language language

    Integer yearlyFamilyIncome
    Integer numberOfFamily = 1

    Education education
    MaritalStatus maritalStatus

    static hasMany = [visits: PatientVisit]

    static constraints = {
        patientId unique: true, blank: false
        firstName blank: false
        lastName blank: false
        middleName nullable: true
        yearlyFamilyIncome nullable: true
        gender nullable: true
    }
}
