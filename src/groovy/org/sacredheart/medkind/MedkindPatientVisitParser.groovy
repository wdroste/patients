package org.sacredheart.medkind

import org.sacredheart.Patient
import org.sacredheart.PatientVisit
import org.sacredheart.VisitType
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
                String patientId = list.get(0)
                PatientVisit patientVisit = new PatientVisit()
                patientVisit.patient = Patient.findByPatientId(patientId)
                patientVisit.dateOfVisit = list.get(4)

                // work the type of visit..
                patientVisit.typeOfVisit = list.get(5)

                // check to make services..
                c.call(patientVisit)
            }
        }
        finally {
            if (listReader != null) {
                listReader.close();
            }
        }
    }

    def getProcessors() {
        [
            new NotNull(), // 0 PatientID
            new NotNull(), // 1 lastName
            new NotNull(), // 2 firstName
            new Optional(), // 3 middleName
            new Optional(new ParseDate("yyyy/MM/dd")), // 4 visit date
            new NotNull(), // 5 category
            new Optional(), // 6 reason
            new Optional(), // 7 service
        ] as CellProcessor[]
    }

    static class ParseTypeOfVisit implements CellProcessor {
        Object execute(Object value, CsvContext context) {
            switch (value.toString().toUpperCase()) {
                case 'WOMEN CANCER SCREENING':
                    return VisitType.CancerScreening
                case 'CHRONIC CARE CLINIC':
                    return VisitType.ChronicCare
                case '':
                    return VisitType.DiabeticEducation
                case 'PHONE CONSULT WITH MD':
                    return VisitType.DrPhoneConsult
                case 'LAB ONLY':
                    return VisitType.Lab
                case 'NURSE CONSULT':
                    return VisitType.NursesVisit
                case '':
                    return VisitType.Other
                case '':
                    return VisitType.OtherEducation
                case '':
                    return VisitType.RegistrationScreening
                case '':
                    return VisitType.WalkIn
            }
            throw new IllegalArgumentException("Unknown value ${value}")
        }
    }
}
