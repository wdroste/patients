package org.sacredheart

class Patient {

    String patientId
    String firstName
    String middleName
    String lastName

    Date dateOfBirth
    String zipcode
    String county
    YesNo citizen
    YesNo veteran
    Gender gender
    Race race
    Language language

    Integer yearlyFamilyIncome
    Integer numberOfFamily

    Education education
    MaritalStatus maritalStatus

    String getFullName() { "${lastName}, ${firstName}"}

    static transients = ['fullName']

    static hasMany = [visits: PatientVisit]

    static constraints = {
        patientId unique: true, blank: false, index: 'IDX_PATIENT_PATIENTID'
        firstName blank: false
        lastName blank: false, index: 'IDX_PATIENT_LASTNAME'
        middleName nullable: true
        yearlyFamilyIncome nullable: true
        gender nullable: true
        county nullable: true
        race nullable: true
        language nullable: true
        maritalStatus nullable: true
        education nullable: true
        dateOfBirth nullable: true
        zipcode nullable: true
        citizen nullable: true
        veteran nullable: true
    }
}
