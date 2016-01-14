package org.sacredheart

import org.sacredheart.report.VisitReport
import org.springframework.context.NoSuchMessageException
import org.supercsv.cellprocessor.FmtDate
import org.supercsv.cellprocessor.Optional
import org.supercsv.cellprocessor.ift.CellProcessor
import org.supercsv.io.CsvListWriter
import org.supercsv.io.ICsvListWriter
import org.supercsv.prefs.CsvPreference

import static org.apache.commons.lang.StringUtils.defaultIfBlank
import static org.apache.commons.lang.StringUtils.isNotBlank

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
            'Type of Visit',
            'Yearly Family Income'
    ] as String[]


    /**
     * Exports the report data to a file to be used for transfer.
     */
    File exportCSV(long id, String prefix, Date start, Date end) {
        // run the query
        ICsvListWriter writer = null
        try {
            def report = VisitReport.get(id)
            def data = patientService.query(report, start, end, {})
            File f = File.createTempFile(report.name + "-", prefix)

            CsvPreference pref = new CsvPreference.Builder(CsvPreference.TAB_PREFERENCE)
                    .surroundingSpacesNeedQuotes(true)
                    .build()
            writer = new CsvListWriter(new FileWriter(f), pref)

            // write the header
            writer.writeHeader(headers)

            // write the customer maps
            CellProcessor[] processors = buildProcessors()
            for (PatientVisit pv : data) {
                writer.write(toList(pv), processors)
            }

            // return the file for download
            return f
        } catch (IOException ioe) {
            throw new IllegalStateException(ioe)
        } finally {
            writer?.flush()
            writer?.close()
        }
    }

    List<String> toList(PatientVisit visit) {
        Patient patient = visit.patient
        Provider provider = visit.provider
        return [
            // Patients
            patient.patientId
            ,patient.lastName
            ,firstAndMiddle(patient)
            ,patient.dateOfBirth
            ,patient.gender
            ,patient.race
            ,patient.streetAddress
            ,patient.city
            ,fixNull(patient.state)
            ,patient.zipcode
            ,patient.county
            ,patient.homePhoneNumber
            ,patient.emailAddress
            ,patient.mobilePhoneNumber
            ,patient.language
            ,patient.maritalStatus
            ,patient.ssn
            ,getMessage("patient.ethnicity.${patient.ethnicity}")
            ,patient.citizen
            ,patient.veteran
            // Next of Kin
            ,patient.nextOfKinLastName
            ,patient.nextOfKinFirstName
            ,patient.nextOfKinRelationshipCode
            ,patient.nextOfKinPhoneNumber
            // provider
            ,provider?.license
            ,provider?.lastName
            ,provider?.firstName
            // Visit Details
            ,visit.dateOfVisit
            ,''
            ,patient.screeningResult
            ,visit.diagnosisCode
            ,''
            ,''
            ,''
            ,visit.typeOfVisit
            ,patient.yearlyFamilyIncome
        ]
    }

    String fixNull(String val, String dflt = '') {
        ('null'.equals(val)) ? dflt : defaultIfBlank(val, dflt)
    }

    String firstAndMiddle(Patient p) {
        if (isNotBlank(p.middleName)) {
            return "${p.firstName} ${p.middleName}"
        }
        return defaultIfBlank(p.firstName, '')
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
                new Optional(), //'Unique Patient ID',
                new Optional(), //'Last Name',
                new Optional(), //'First Name & Middle Name',
                new Optional(new FmtDate('MM-dd-yy')), //'Date of Birth',
                new Optional(), //'Gender Code',
                new Optional(), //'Race Code',
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
                new Optional(), //'Screening Results',
                new Optional(), //'Primary Diagnosis Code',
                new Optional(), //'Primary Diagnosis Description',
                new Optional(), //'Secondary Diagnosis Code',
                new Optional(), //'Secondary Diagnosis Description',
                new Optional(), //'Type of Visit'
                new Optional() // Income
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