package org.sacredheart.report

import org.sacredheart.Education
import org.sacredheart.Gender
import org.sacredheart.Language
import org.sacredheart.MaritalStatus
import org.sacredheart.Race
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

    List<String> counties = []
    List<String> zipCodes = []

    YesNo citizen
    YesNo veteran
    Gender gender

    Race race
    Language language

    SizeRange numberOfFamilyRange
    IncomeRange familyIncomeRange

    Education education
    MaritalStatus maritalStatus

    Date dateCreated
    Date lastUpdated

    static constraints = {
        patientIdPattern nullable: true
        firstNamePattern nullable: true
        middleNamePattern nullable: true
        lastNamePattern  nullable: true

        citizen nullable: true
        veteran nullable: true
        gender nullable: true

        race nullable: true
        language nullable: true

        education nullable: true
        maritalStatus nullable: true
    }

    static embedded = ['ageRange', 'numberOfFamilyRange', 'familyIncomeRange']
}
