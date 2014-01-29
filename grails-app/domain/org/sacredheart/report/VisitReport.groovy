package org.sacredheart.report

import org.sacredheart.Provider
import org.sacredheart.YesNo

/**
 * Represents a saved report.
 */
class VisitReport {

    static TYPES = ['Simple', 'PIE']

    String name
    String description

    String patientIdPattern
    String firstNamePattern
    String middleNamePattern
    String lastNamePattern

    AgeRange ageRange

    YesNo citizen
    YesNo veteran

    SizeRange numberOfFamilyRange
    IncomeRange familyIncomeRange

    Date lastUpdated

    static hasMany = [
            races: String,
            genders: String,
            countries:String,
            zipCodes: String,
            languages: String,
            visitTypes: String,
            educations: String,
            maritalStatuses: String,
            screeningResults: String,
            providers: Provider
    ]

    static constraints = {
        name unique: true, blank: false
        description maxSize: 1024, widget:'textarea'
        patientIdPattern nullable: true
        firstNamePattern nullable: true
        middleNamePattern nullable: true
        lastNamePattern  nullable: true

        citizen nullable: true
        veteran nullable: true
        ageRange nullable: true
        familyIncomeRange nullable: true
        numberOfFamilyRange nullable: true
    }

    static embedded = ['ageRange', 'numberOfFamilyRange', 'familyIncomeRange']

    static mapping = {
        races lazy: false
        genders lazy: false
        countries lazy: false
        zipCodes lazy: false
        languages lazy: false
        visitTypes lazy: false
        educations lazy: false
        maritalStatuses lazy: false
        screeningResults lazy: false

    }
}

class AgeRange {
    Integer start
    Integer end

    static constraints = {
        start nullable: true
        end nullable: true
    }
}

class IncomeRange {
    Integer start
    Integer end

    static constraints = {
        start nullable: true
        end nullable: true
    }
}

class SizeRange {
    Integer start
    Integer end

    static constraints = {
        start nullable: true
        end nullable: true
    }
}
