package org.sacredheart

import org.compass.annotations.Searchable
import org.compass.annotations.SearchableId
import org.compass.annotations.SearchableProperty
import grails.rest.*

@Searchable
@Resource(uri='/books')
class Patient implements Serializable {

    static GENDER = ['Male', 'Female']

    static LANGUAGE = ['English', 'Spanish', 'Other']

    static RACE = ['White', 'Hispanic', 'Black', 'Asian', 'Other']

    static EDUCATION = [
        'None', 'GradeSchool', 'SomeHighSchool' ,'GED', 'HighSchoolDegree',
        'SomeCollege', 'CollegeDegree', 'SomePostGrad', 'PostGradDegree']

    static SCREENING_RESULTS = [
            'A2C', 'CCS', 'PHC', 'WILCO', 'MCHILD', 'MCAREGIVERS', 'MEDICARE', 'MDSSI', 'A2C-CC', 'A2C-1x', 'A2C-T', 'OTHER'
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

    @SearchableId
    Long id

//    static searchable = [only: ['lastName', 'firstName', 'patientId', 'dateOfBirth',
//            'ssn', 'homePhoneNumber', 'mobilePhoneNumber', 'emailAddress']]

    @SearchableProperty
    String patientId
    @SearchableProperty
    String firstName
    @SearchableProperty
    String middleName
    @SearchableProperty
    String lastName

    @SearchableProperty
    Date dateOfBirth
    @SearchableProperty
    String zipcode
    @SearchableProperty
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
    @SearchableProperty
    String screeningResult


    //
    @SearchableProperty
    String ssn
    @SearchableProperty
    String streetAddress
    @SearchableProperty
    String city
    @SearchableProperty
    String state

    @SearchableProperty
    String homePhoneNumber
    @SearchableProperty
    String mobilePhoneNumber
    @SearchableProperty
    String emailAddress

    YesNo ethnicity

    YesNo transportation

    String nextOfKinLastName
    String nextOfKinFirstName
    String nextOfKinRelationshipCode
    String nextOfKinPhoneNumber

    // auto-timestamped
    @SearchableProperty
    Date dateCreated
    Date lastUpdated

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

        dateCreated nullable:true
        lastUpdated nullable: true
    }

    static mapping = {
        dateCreated index: 'date_created_idx'
        lastName index: 'last_name_idx'
        firstName index: 'first_name_idx'
        patientId index: 'patient_id_idx'
        dateOfBirth index: 'date_of_birth_idx'
        screeningResult index: 'screening_result_idx'
    }
}
