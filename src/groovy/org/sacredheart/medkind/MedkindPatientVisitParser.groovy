package org.sacredheart.medkind

import org.apache.commons.lang.StringUtils
import org.sacredheart.Patient
import org.sacredheart.PatientVisit

import org.supercsv.cellprocessor.Optional
import org.supercsv.cellprocessor.ParseDate
import org.supercsv.cellprocessor.constraint.NotNull
import org.supercsv.cellprocessor.ift.CellProcessor
import org.supercsv.io.CsvListReader
import org.supercsv.io.ICsvListReader
import org.supercsv.prefs.CsvPreference
import org.supercsv.util.CsvContext

class MedkindPatientVisitParser {

    /**
     * Reader each of the lines and send out patients..
     */
    def parse(Reader reader, Closure<PatientVisit> c) {
        ICsvListReader listReader = null
        try {
            listReader = new CsvListReader(reader, CsvPreference.STANDARD_PREFERENCE);

            listReader.getHeader(true)
            CellProcessor[] processors = getProcessors()

            List<String> list;
            while ((list = listReader.read(processors)) != null) {
                // create a new patient visit..
                PatientVisit patientVisit = new PatientVisit()
                patientVisit.dateOfVisit = list.get(4)

                // find the patient
                String patientId = list.get(0)
                if (StringUtils.isNotBlank(patientId)) {
                    patientVisit.patient = Patient.findByPatientId(patientId)
                    if (patientVisit.patient) {
                        // work the type of visit..
                        patientVisit.typeOfVisit = list.get(5)
                        c.call(patientVisit)
                    } else {
                        println "Invalid Patient ID: ${listReader.lineNumber}"
                    }
                } else {
                    println "Found error: ${listReader.lineNumber}"
                }
            }
            println "Missing Visit Types: ${ParseTypeOfVisit.missing}"
        }
        finally {
            listReader?.close();
        }
    }

    def getProcessors() {
        // PatientID,LastName,FirstName,MiddleName,VisitDate,Category,
        [
            new NotNull(), // 0 PatientID
            new NotNull(), // 1 lastName
            new NotNull(), // 2 firstName
            new Optional(), // 3 middleName
            new Optional(new ParseDate("MM/dd/yyyy")), // 4 visit date
            new ParseTypeOfVisit(), // 5 category
            new Optional()
        ] as CellProcessor[]
    }

    static class ParseTypeOfVisit implements CellProcessor {
        static Set<String> missing = [] as Set
        Object execute(Object value, CsvContext context) {
            switch (value.toString().toUpperCase().replace(' ','')) {
                case 'WOMENCANCERSCREENING':
                    return 'CancerScreening'
                case 'CHRONICCARECLINIC':
                case 'CHRONICCARECLINC':
                case "CHRONICCARE/NP":
                    return 'ChronicCare'
                case 'DMEDUCATIONWORKSHOP':
                    return 'DiabeticEducation'
                case 'PHONECONSULTWITHMD':
                    return 'DrPhoneConsult'
                case 'LABONLY':
                    return 'Lab'
                case 'NURSECONSULT':
                    return 'NursesVisit'
                case 'WALKINCLINIC':
                case 'SIMPLE':
                    return 'WalkIn'
                case 'FLUSHOT':
                    return 'FluShot'
                case 'OTHER':
                    return 'Other'
                case '':
                    return 'OtherEducation'
                case '':
                    return 'RegistrationScreening'
                default:
                    missing.add(value)
                    return 'Other'
            }
        }
    }
}
