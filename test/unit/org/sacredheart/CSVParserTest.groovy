package org.sacredheart

import org.sacredheart.medkind.MedkindPatientParser

class CSVParserTest {

    /**
     * Load the test CSV into patients..
     */
    void testMedKindFileParsing() {
        def f = new File("/tmp/data.csv")
        new MedkindPatientParser().parse(new FileReader(f)) { Patient p ->
            println "Patient: ${p.patientId}"
        }

    }
}
