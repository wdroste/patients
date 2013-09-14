package org.sacredheart

class Patient implements Serializable {
    static GENDER = ['Male', 'Female']

    static LANGUAGE = ['English', 'Spanish', 'Other']

    static RACE = ['White', 'Hispanic', 'Black', 'Asian', 'Other']

    static EDUCATION = [
        'None', 'GradeSchool', 'SomeHighSchool' ,'GED', 'HighSchoolDegree',
        'SomeCollege', 'CollegeDegree', 'SomePostGrad', 'PostGradDegree']

    static SCREENING_RESULTS = [
            'CCS', 'PHC', 'WILCO', 'MCHILD', 'MCAREGIVERS', 'MEDICARE', 'OTHER'
    ]

    static MARITIALSTATUS = [
        'ChildUnder5yrs', 'Student', 'Single', 'Married', 'Separated', 'Divorced', 'Widowed'
    ]

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
    Integer federalPoverty

    // List objects
    String race
    String gender
    String language
    String education
    String maritalStatus
    String screeningResult

    String getFullName() { "${lastName}, ${firstName}"}

    static transients = ['fullName']

    static hasMany = [visits: PatientVisit]

    static constraints = {
        patientId unique: true, blank: false, index: 'IDX_PATIENT_PATIENTID'
        firstName blank: false
        lastName blank: false, index: 'IDX_PATIENT_LASTNAME'
        middleName nullable: true
        yearlyFamilyIncome nullable: true
        gender nullable: true, inList: GENDER
        county nullable: true
        race nullable: true, inList: RACE
        language nullable: true, inList: LANGUAGE
        maritalStatus nullable: true, inList: MARITIALSTATUS
        education nullable: true, inList: EDUCATION
        dateOfBirth nullable: true
        zipcode nullable: true
        citizen nullable: true
        veteran nullable: true
        screeningResult nullable: true, inList: SCREENING_RESULTS
        federalPoverty nullable: true
    }

    static mapping = {
        lastName index: 'last_name_idx'
        firstName index: 'first_name_idx'
        patientId index: 'patient_id_idx'
        dateOfBirth index: 'date_of_birth_idx'
        screeningResult column: 'screeningResults'
    }
}
