package org.sacredheart.medkind

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.junit.Before
import org.junit.Test
import org.sacredheart.Patient


@Mock(Patient)
class MedkindPatientVisitParserTests {

    def data = '''PatientID,LastName,FirstName,MiddleName,VisitDate,Category,
RM1000248968,EWALD,ERIC,,1/3/2013,Walk In Clinic,
RM1000195441,CAMACHO-MUNOZ,GRACIELA,HIGINIA,1/3/2013,Walk In Clinic,
RM1000248963,RUSH,NORMA,KAY,1/3/2013,Walk In Clinic,
RM1000230365,VAHORA,FARIDABEN,M,1/3/2013,Walk In Clinic,
RM1000248964,SANCHEZ-VILLA,MARISELA,,1/3/2013,Walk In Clinic,
RM1000145361,CENTENO NIETO,JUAN,JOSE,1/3/2013,Walk In Clinic,
RM1000248966,SEGURA,MARIA,CASTRO,1/3/2013,Walk In Clinic,
RM1000229133,KIESS,CATHERINE,FABREZ,1/3/2013,Walk In Clinic,
RM1000172789,SMITH,ALVIN,DENOIS,1/3/2013,Walk In Clinic,
RM1000248970,VASQUEZ,DEVAN,NICOLE,1/3/2013,Walk In Clinic,
RM1000248967,MERINO MORALES,BONIFACIO,,1/3/2013,Walk In Clinic,
RM1000245600,CLAY,ZANDRA,JO,1/3/2013,Walk In Clinic,
RM1000248969,HERNANDEZ,VICTOR,HERNAN,1/3/2013,Walk In Clinic,
RM1000242745,SANCHEZ-MENDIETA,BEATRIZ,,1/3/2013,LAB ONLY,
RM1000248989,SUROVEY,CHELSEA,AILENE,1/3/2013,Walk In Clinic,
RM1000145366,RIVERA-GALVAN,FANNY,ALMEYDI,1/3/2013,LAB ONLY,
RM1000177492,RODRIGUEZ,LAURA,ESTHELA,1/3/2013,Other,
'''

    void setUp() {
        new Patient(patientId:'RM1000248968', lastName:'EWALD', firstName:'ERIC', numberOfFamily: 1)
                .save(failOnError: true, flush: true)
    }

    void testParser() {
        def parser = new MedkindPatientVisitParser()
        parser.parse(new StringReader(data)) { pv ->
            println "Patient Visit: ${pv}"
        }
    }
}
