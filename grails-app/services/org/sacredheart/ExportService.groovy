package org.sacredheart

import org.sacredheart.report.VisitReport
import org.springframework.context.NoSuchMessageException
import org.supercsv.cellprocessor.FmtDate
import org.supercsv.cellprocessor.Optional
import org.supercsv.cellprocessor.constraint.NotNull
import org.supercsv.cellprocessor.ift.CellProcessor
import org.supercsv.io.CsvMapWriter
import org.supercsv.io.ICsvMapWriter
import org.supercsv.prefs.CsvPreference
import org.supercsv.quote.QuoteMode

class ExportService {

    def messageSource
    def patientService


    String[] headers = [
            'Unique Patient ID',
            'Last Name',
            'First Name & Middle Name',
            'Date of Birth',
            'Gender Code',
            'Race Code',
            'Street Address',
            'City',
            'State Abbrev',
            'Zip',
            'County',
            'Home Phone Number',
            'Email address',
            'Cell Phone Number',
            'Primary Language Code',
            'Marital Status Code',
            'SSN',
            'Ethnic Group Code',
            'Citizenship',
            'Veteran',
            'Last Name',
            'First Name',
            'Relationship Code',
            'Phone Number',
            'Clinician NPI or ID',
            'Clinician Last Name',
            'Clinician First Name',
            'Visit Date/Time',
            'FPL',
            'Screening Results',
            'Primary Diagnosis Code',
            'Primary Diagnosis Description',
            'Secondary Diagnosis Code',
            'Secondary Diagnosis Description',
            'Type of Visit'] as String[]


    /**
     * Exports the report data to a file to be used for transfer.
     */
    File exportCSV(long id, Date start, Date end) {
        // run the query
        ICsvMapWriter writer = null
        try {
            def report = VisitReport.get(id)
            def data = patientService.query(report, start, end, {})
            File f = File.createTempFile(report.name + "-", ".csv")

            CsvPreference pref = new CsvPreference.Builder(CsvPreference.TAB_PREFERENCE).surroundingSpacesNeedQuotes(true).build()
            writer = new CsvMapWriter(new FileWriter(f), pref)

            // write the header
            writer.writeHeader(headers)

            // write the customer maps
            CellProcessor[] processors = buildProcessors()
            for (PatientVisit pv : data) {
                writer.write(toMap(pv), headers, processors)
            }

            // return the file for download
            return f
        } catch (IOException ioe) {
            throw new IllegalStateException(ioe)
        } finally {
            writer?.close()
        }
    }

    Map toMap(PatientVisit visit) {
        Patient patient = visit.patient
        Provider provider = visit.provider

        def map = [:]
        map['Unique Patient ID'] = patient.patientId
        map['Last Name' ] = patient.lastName
        map['First Name & Middle Name'] = "${patient.firstName} ${patient.middleName}"
        map['Date of Birth'] = patient.dateOfBirth
        map['Gender Code'] = patient.gender
        map['Race Code'] = patient.race
        map['Street Address'] = patient.streetAddress
        map['City'] = patient.city
        map['State Abbrev'] = patient.state
        map['Zip'] = patient.zipcode
        map['County'] = patient.county
        map['Home Phone Number'] = patient.homePhoneNumber
        map['Email address'] = patient.emailAddress
        map['Cell Phone Number'] = patient.mobilePhoneNumber
        map['Primary Language Code'] = patient.language
        map['Marital Status Code'] = patient.maritalStatus
        map['SSN'] = patient.ssn
        map['Ethnic Group Code'] = getMessage("patient.ethnicity.${patient.ethnicity}")
        map['Citizenship'] = patient.citizen
        map['Veteran'] = patient.veteran
        // Next of Kin
        map['Last Name'] = patient.nextOfKinLastName
        map['First Name'] = patient.nextOfKinFirstName
        map['Relationship Code'] = patient.nextOfKinRelationshipCode
        map['Phone Number'] = patient.nextOfKinPhoneNumber
        // provider
        map['Clinician NPI or ID'] = provider?.license
        map['Clinician Last Name'] = provider?.lastName
        map['Clinician First Name'] = provider?.firstName
        // Visit Details
        map['Visit Date/Time'] = visit.dateOfVisit
        map['FPL'] = ""
        map['Screening Results'] = patient.screeningResult
        map['Primary Diagnosis Code'] = visit.diagnosisCode
        map['Primary Diagnosis Description'] = ""
        map['Secondary Diagnosis Code'] = ""
        map['Secondary Diagnosis Description'] = ""
        map['Type of Visit'] = visit.typeOfVisit

        return map
    }

    String getMessage(String code) {
        try {
            messageSource.getMessage(code, [] as Object[], Locale.getDefault())
        } catch (NoSuchMessageException ex) {
            return ''
        }
    }

    CellProcessor[] buildProcessors() {
        [
                new NotNull(), //'Unique Patient ID',
                new NotNull(), //'Last Name',
                new NotNull(), //'First Name & Middle Name',
                new FmtDate('dd-MMM-yy'), //'Date of Birth',
                new NotNull(), //'Gender Code',
                new NotNull(), //'Race Code',
                new Optional(), //'Street Address',
                new Optional(), //'City',
                new Optional(), //'State Abbrev',
                new Optional(), //'Zip',
                new Optional(), //'County',
                new Optional(), //'Home Phone Number',
                new Optional(), //'Email address',
                new Optional(), //'Cell Phone Number',
                new Optional(), //'Primary Language Code',
                new Optional(), //'Marital Status Code',
                new Optional(), //'SSN',
                new Optional(), //'Ethnic Group Code',
                new Optional(), //'Citizenship',
                new Optional(), //'Veteran',
                // Next of Kin
                new Optional(), //'Last Name',
                new Optional(), //'First Name',
                new Optional(), //'Relationship Code',
                new Optional(), //'Phone Number',
                // Provider
                new Optional(), //'Clinician NPI or ID',
                new Optional(), //'Clinician Last Name',
                new Optional(), //'Clinician First Name',
                new Optional(), //'Visit Date/Time',
                // Funding
                new Optional(), //'FPL',
                new NotNull(), //'Screening Results',
                new Optional(), //'Primary Diagnosis Code',
                new Optional(), //'Primary Diagnosis Description',
                new Optional(), //'Secondary Diagnosis Code',
                new Optional(), //'Secondary Diagnosis Description',
                new NotNull(), //'Type of Visit'
        ] as CellProcessor[]
    }

}

/*
1x	Unique Patient ID	MedKind (RM1000nnnnnn) or Practice Fusion MRN
2x	Last Name
3x	First Name & Middle Name
4x	Date of Birth
5x	Gender Code
6x	Race Code
7x	Street Address
8x	City
9x	State Abbrev
10x	Zip
11x	County
12x	Home Phone Number
13x	Email address
14x	Cell Phone Number
15x	Primary Language Code
16x	Marital Status Code
17x	SSN
18x	Ethnic Group Code
19x	Citizenship
20x	Veteran
	Next of Kin
21x	Last Name
22x	First Name
23x	Relationship Code
24x	Phone Number
	Visit/Event Information
25x	Clinician NPI or ID	Confirm ID is available
26x	Clinician Last Name
27x	Clinician First Name
	Unique Visit Number	Will be derived from Date&MRN
28x	Visit Date/Time
	Funding
29?	FPIL	To be loaded into Subject Type
30	Screening Results
 	Diagnosis
31x	Primary Diagnosis Code
32x	Primary Diagnosis Description
33x	Secondary Diagnosis Code	Depends on what Liz can enter
34x	Secondary Diagnosis Description
	Procedures
35x	Type of Visit	CPT will be derived from Type of Visit value
*/