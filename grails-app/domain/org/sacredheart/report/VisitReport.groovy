package org.sacredheart.report

import org.sacredheart.Education
import org.sacredheart.Gender
import org.sacredheart.Language
import org.sacredheart.MaritalStatus
import org.sacredheart.Race
import org.sacredheart.VisitType
import org.sacredheart.YesNo

/**
 * Represents a saved report.
 */
class VisitReport {

    String name
    String description

    String patientIdPattern
    String firstNamePattern
    String middleNamePattern
    String lastNamePattern

    AgeRange ageRange

    YesNo citizen
    YesNo veteran
    Gender gender


    SizeRange numberOfFamilyRange
    IncomeRange familyIncomeRange

    Date lastUpdated

    static hasMany = [
            races: String,
            countries:String,
            zipCodes: String,
            languages: String,
            visitTypes: String,
            educations: String,
            maritalStatuses: String
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
        gender nullable: true
        ageRange nullable: true
        familyIncomeRange nullable: true
        numberOfFamilyRange nullable: true
    }

    static embedded = ['ageRange', 'numberOfFamilyRange', 'familyIncomeRange']
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