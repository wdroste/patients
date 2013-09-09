package org.sacredheart

class Patient implements Serializable {
    static GENDER = ['Male', 'Female']

    static LANGUAGE = ['English', 'Spanish', 'Other']

    static RACE = ['White', 'Hispanic', 'Black', 'Asian', 'Other']

    static EDUCATION = [
            'None', 'GradeSchool', 'SomeHighSchool' ,'GED', 'HighSchoolDegree',
            'SomeCollege', 'CollegeDegree', 'SomePostGrad', 'PostGradDegree']

    static MARITIALSTATUS = [
        'ChildUnder5yrs', 'Student', 'Single', 'Married', 'Separated', 'Divorced', 'Widowed' ]

    String patientId
    String firstName
    String middleName
    String lastName

    Date dateOfBirth
    String zipcode
    String county
    YesNo citizen
    YesNo veteran

    Integer yearlyFamilyIncome
    Integer numberOfFamily

    // List objects
    String race
    String gender
    String language
    String education
    String maritalStatus

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

    static mapping = {
        lastName index: 'last_name_idx'
        firstName index: 'first_name_idx'
        patientId index: 'patient_id_idx'
        dateOfBirth index: 'date_of_birth_idx'
    }
}
