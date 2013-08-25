package org.sacredheart

import org.sacredheart.medkind.MedkindPatientParser
import org.springframework.transaction.annotation.Propagation
import org.springframework.transaction.annotation.Transactional

class PatientService {
    static transactional = true

    def sessionFactory

    def importCSVData(Reader reader) {
        int success = 0, failed = 0;
        def failedPatientIds = [] as List<String>
        new MedkindPatientParser().parse(reader) { Patient p ->
            Patient old = Patient.findByPatientId(p.patientId)
            if (old) {
                // overwrite existing properties
                old.properties = p.properties
            } else {
                old = p
            }
            try {
                old.save(failOnError: true)
                success++
            } catch (Exception ex) {
                failed++
                failedPatientIds.add(p.patientId)
            }
        }
        log.error("Import of patients success = ${success} failed = ${failed}")
        failedPatientIds
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    def list(params) {

        def ignoreCaseLike = [
            lastName: params.lastName?.replace('*', '%'),
            patientId: params.patientId?.replace('*', '%')
        ]

        def c = Patient.createCriteria()
        def results = c {
            ignoreCaseLike.each { k, v ->
                if (v) {
                    ilike(k, v)
                }
            }
            maxResults(params.max)
            firstResult(params.offset)
            order("lastName")
        }

        c = Patient.createCriteria()
        def count = c {
            projections {
                rowCount()
            }
            ignoreCaseLike.each { k, v ->
                if (v) {
                    ilike(k, v)
                }
            }
        }

        [patientInstanceList: results, patientInstanceTotal: count[0]]

    }
}
