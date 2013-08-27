package org.sacredheart.medkind

import org.apache.commons.lang.BooleanUtils
import org.sacredheart.Education
import org.sacredheart.Gender
import org.sacredheart.Language
import org.sacredheart.Patient
import org.sacredheart.Race
import org.sacredheart.YesNo
import org.supercsv.cellprocessor.ConvertNullTo
import org.supercsv.cellprocessor.Optional
import org.supercsv.cellprocessor.ParseDate
import org.supercsv.cellprocessor.ParseInt
import org.supercsv.cellprocessor.ParseLong
import org.supercsv.cellprocessor.constraint.NotNull
import org.supercsv.cellprocessor.ift.CellProcessor
import org.supercsv.io.CsvListReader
import org.supercsv.io.ICsvListReader
import org.supercsv.prefs.CsvPreference
import org.supercsv.util.CsvContext

class MedkindPatientParser {

    /**
     * Reader each of the lines and send out patients..
     */
    def parse(Reader reader, Closure<Patient> c) {

        ICsvListReader listReader = null
        try {
            listReader = new CsvListReader(reader, CsvPreference.STANDARD_PREFERENCE);

            String[] headers = listReader.getHeader(true)
            CellProcessor[] processors = getProcessors()

            List<String> list;
            while ((list = listReader.read(processors)) != null) {
                Patient p = new Patient()
                p.patientId = list.get(0)
                p.lastName = list.get(1)
                p.firstName = list.get(2)
                p.middleName = list.get(3)
                p.dateOfBirth = list.get(5)
                p.zipcode = list.get(12)
                p.county = list.get(11)
                p.citizen = list.get(16)
                p.veteran = list.get(17)
                p.gender = list.get(6)
                p.race = list.get(7)
                p.language = list.get(20)
                // calculate
                //p.yearlyFamilyIncome = list.get("")
                p.numberOfFamily = list.get(15)
                p.maritalStatus = list.get(18)
                p.education = list.get(19)
                c.call(p)
            }

        }
        finally {
            if (listReader != null) {
                listReader.close();
            }
        }

    }

    static class ParseYesNo implements CellProcessor {
        Object execute(Object value, CsvContext context) {
            BooleanUtils.toBoolean(value) ? YesNo.Yes : YesNo.No
        }
    }

    static class ParseGender implements CellProcessor {
        Object execute(Object value, CsvContext context) {
            Gender.valueOf(value)
        }
    }

    static class ParseRace implements CellProcessor {
        Object execute(Object value, CsvContext context) {
            switch (value.toString().toUpperCase()) {
                case 'WHITE':
                    return Race.White
                case 'BLACK':
                    return Race.Black
                case 'ASIAN':
                    return Race.Asian
                case 'HISPANIC':
                    return Race.Hispanic
            }
            Race.Other
        }
    }

    static class ParseLanguage implements CellProcessor {
        Object execute(Object value, CsvContext context) {
            switch (value.toString().toUpperCase()) {
                case 'ENGLISH':
                    return Language.English
                case 'SPANISH':
                    return Language.Spanish
            }
            Language.Other
        }
    }

    static class ParseEducation implements CellProcessor {
        Object execute(Object value, CsvContext context) {
            switch (value.toString()) {
                case 'None':
                    return Education.None
                case 'Grade School':
                    return Education.GradeSchool
                case 'Some High School':
                    return Education.SomeHighSchool
                case 'GED':
                    return Education.GED
                case 'High School':
                    return Education.HighSchoolDegree
                case 'Some College':
                    return Education.SomeCollege
                case 'College Degree':
                    return Education.CollegeDegree
                case 'Some Post Graduate':
                    return Education.SomePostGrad
                case 'Graduate Degree':
                    return Education.PostGradDegree
            }
            throw new IllegalArgumentException("Unknown value ${value}")
        }
    }

    def getProcessors() {
        [
                new NotNull(), // 0 PatientID (must be unique)
                new NotNull(), // 1 lastName
                new NotNull(), // 2 firstName
                new Optional(), // 3 middleName
                new Optional(), // 4 SSN
                new Optional(new ParseDate("yyyy/MM/dd")), // 5 birthDate
                new Optional(new ParseGender()), // 6 Gender
                new Optional(new ParseRace()), // 7 Race
                new Optional(), // 8 Address
                new Optional(), // 9 City
                new Optional(), // 10 State
                new Optional(), // 11 County
                new Optional(), // 12 ZipCode
                new Optional(), // 13 Telephone
                new Optional(), // 14 Housing
                new ConvertNullTo(1, new ParseInt()), // 15 Household
                new Optional(new ParseYesNo()), // 16 Citizen
                new Optional(new ParseYesNo()), // 17 Veteran
                new Optional(), // 18 Marital Status
                new Optional(new ParseEducation()), // 19 Education
                new Optional(new ParseLanguage()), // 20 Language
                new Optional(new ParseLong()), // 21 Income
                new Optional(), // 22 Employer
                new Optional(), // 23 Industry
                new Optional(), // 24 Employment
                new Optional(), // 25 Poverty
                new Optional(), // 26 Proof1
                new Optional(), // 27 Proof2
                new Optional(), // 28 Proof3
                new Optional(), // 29 Proof4
                new Optional(), // 30 Proof5
                new Optional(), // 31 Education
                new Optional(), // 32 LastWorkDate
                new Optional(), // 33 Referral
                new Optional(), // 34 EmFirstName
                new Optional(), // 35 EmLastName
                new Optional(), // 36 EmPhone
                new Optional(), // 37 EmRelation
                new Optional(), // 38 GuardianFirstName
                new Optional(), // 39 GuardianLastName
                new Optional(), // 40 GuardianIncome
                new Optional(), // 41 SpouseFirstName
                new Optional(), // 42 SpouseLastName
                new Optional(), // 43 SpouseIncome
                new Optional(), // 44 LastUpdateDate
        ] as CellProcessor[]
    }
}
