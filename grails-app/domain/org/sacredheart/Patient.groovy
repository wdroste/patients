package org.sacredheart

class Patient implements Serializable {
    static searchable = true

    static GENDER = ['Male', 'Female']

    static LANGUAGE = ['English', 'Spanish', 'Other']

    static RACE = ['White', 'Hispanic', 'Black', 'Asian', 'Other']

    static EDUCATION = [
        'None', 'GradeSchool', 'SomeHighSchool' ,'GED', 'HighSchoolDegree',
        'SomeCollege', 'CollegeDegree', 'SomePostGrad', 'PostGradDegree']

    static SCREENING_RESULTS = [
            'A2C', 'CCS', 'PHC', 'WILCO', 'MCHILD', 'MCAREGIVERS', 'MEDICARE', 'MDSSI', 'A2C-CC', 'OTHER'
    ]

    static MARITIALSTATUS = [
        'ChildUnder5yrs', 'Student', 'Single', 'Married', 'Separated', 'Divorced', 'Widowed'
    ]

    static REFERENCE = [
        'Friend', 'StWilliamsChruch', 'LocalChurch', 'School', 'Website', 'Flier',
        'SHCCVolunteer', 'SHCCPatient', 'RoundRockServingCenter', 'StVincentdePaul',
        'WILCO', 'LoneStarCircleofCare', 'SetonHospital', 'RoundRockHospital',
        'Operator211', 'Other'
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
    String reference
    String education
    String maritalStatus
    String screeningResult


    //
    String ssn
    String streetAddress
    String city
    String state

    String homePhoneNumber
    String mobilePhoneNumber
    String emailAddress

    YesNo ethnicity

    YesNo transportation

    String nextOfKinLastName
    String nextOfKinFirstName
    String nextOfKinRelationshipCode
    String nextOfKinPhoneNumber


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
        reference nullable: true, inList: REFERENCE
        federalPoverty nullable: true


        ssn nullable: true, matches: "^(\\d{3}-?\\d{2}-?\\d{4}|XXX-XX-XXXX)\$"
        streetAddress blank: false, nullable: true
        city blank: false, nullable: true
        state blank: false, nullable: true

        homePhoneNumber blank: false, nullable: true
        mobilePhoneNumber blank: true, nullable: true
        emailAddress email: true, nullable: true

        ethnicity nullable: true
        transportation nullable: true

        nextOfKinLastName nullable: true
        nextOfKinFirstName nullable: true
        nextOfKinRelationshipCode nullable: true
        nextOfKinPhoneNumber nullable: true

    }

    static mapping = {
        lastName index: 'last_name_idx'
        firstName index: 'first_name_idx'
        patientId index: 'patient_id_idx'
        dateOfBirth index: 'date_of_birth_idx'
        screeningResult index: 'screening_result_idx'
    }
}
