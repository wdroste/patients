package org.sacredheart

import com.google.common.cache.CacheBuilder
import com.google.common.cache.CacheLoader
import com.google.common.cache.LoadingCache
import org.sacredheart.medkind.MedkindPatientVisitParser

import java.util.concurrent.ArrayBlockingQueue
import java.util.concurrent.BlockingQueue
import java.util.concurrent.TimeUnit

class PatientVisitService {

    static transactional = true

    def establishedPatientVisitReport(Date start, Date end) {
        // all the patients for the month..
        def patients = Patient.withCriteria {
            projections {
                distinct()
            }
            visits {
                between('dateOfVisit', start, end)
            }
        }

        // determine the established patients..
        def estPatients = PatientVisit.withCriteria {
            projections {
                distinct('patient')
            }
            lt('dateOfVisit', start)
            inList('patient', patients)
        }

        // determine the new patients..
        def newPatients = PatientVisit.withCriteria {
            projections {
                distinct('patient')
            }
            not {
                lt('dateOfVisit', start)
                inList('patient', estPatients)
            }
        }

        // determine the number of visits by est
        def estVisits = PatientVisit.withCriteria {
            projections {
                count()
            }
            inList('patient', estPatients)
            between('dateOfVisit', start, end)
        }

        def newVisits = PatientVisit.withCriteria {
            projections {
                count()
            }
            inList('patient', newPatients)
            between('dateOfVisit', start, end)
        }

        [
                'startDate':start,
                'endDate':end,
                'patients':patients,
                'estPatients':estPatients,
                'newPatients':newPatients,
                'estVisits':estVisits[0],
                'newVisits':newVisits[0]
        ]
    }

    /**
     * Import CSV data from Medkind.
     */
    def importCSVData(Reader reader, Closure monitor) {
        // attempt to find other patient visits by the data..
        new MedkindPatientVisitParser().parse(reader) { PatientVisit vp ->
            // attempt to update the patient object..
            PatientVisit old = PatientVisit.findWhere(
                    'patient':vp.patient,
                    'typeOfVisit':vp.typeOfVisit,
                    'dateOfVisit':vp.dateOfVisit)
            if (!old) {
                if (vp.save()) {
                    monitor(true, vp.patient.patientId, null)
                } else {
                    monitor(false, vp.patient.patientId, null)
                }
            } else {
                log.info("Found duplicate record: ${old}")
            }
        }
    }

    LoadingCache<String, BlockingQueue<?>> messageQueue = CacheBuilder.newBuilder()
            .maximumSize(200)
            .expireAfterWrite(10, TimeUnit.MINUTES)
            .build(
            new CacheLoader<String, BlockingQueue<?>>() {
                public BlockingQueue<?> load(String key) {
                    return new ArrayBlockingQueue<?>(20000)
                }
            }
    )

    def processFile(File tmpFile) {
        def tx = UUID.randomUUID().toString()
        // asynchronous do not expect may calls..
        Thread.start {
            // make sure to close the reader
            tmpFile.withReader { rdr ->
                // provide a transaction
                PatientVisit.withTransaction {
                    // send the CSV file through the processor
                    importCSVData(rdr) { success, patientId, message ->
                        Queue<?> queue = messageQueue.get(tx)
                        queue.add(['success': success, 'patientId':patientId, 'message':message])
                    }
                }
            }
            // if there's no problems delete the file..
            tmpFile.delete()
        }
        tx
    }

    def progress(String tx) {
        def ret = []
        def q = messageQueue.get(tx)
        if (q) {
            q.drainTo(ret, 1000)
        }
        ret
    }

    def list(Map params) {
        params.offset = params.int('offset') ?: 0
        params.max = Math.min(params.max ? params.int('max') : 25, 1000)
        def results, total
        if (params?.q) {
            // because search needs a query..
            def search = PatientVisit.search(params.q, params)
            total = search.total
            // transform the results..
            results = search.results.collect {
                [
                        id:it.id,
                        typeOfVisit: it.typeOfVisit,
                        dateOfVisit : it.dateOfVisit,
                        diagnosisCode : it.diagnosisCode,
                        provider : it.provider.title,
                        fullName: it.patient.fullName
                ]
            }
        } else {
            def c = PatientVisit.createCriteria()
            def list = c.list(max: params.max, offset: params.offset) {
                projections {
                    property('id')
                    property('typeOfVisit')
                    property('dateOfVisit')
                    property('diagnosisCode')
                    provider {
                        property('title')
                    }
                    patient {
                        property('lastName')
                        property('firstName')
                    }
                }
                order(params.sort ?: 'dateOfVisit', params.order ?: 'desc')
            }
            // transform the results..
            results = list.collect {
                [
                        id:it[0],
                        typeOfVisit: it[1],
                        dateOfVisit : it[2],
                        diagnosisCode : it[3],
                        provider : it[4],
                        fullName: [it[5], it[6]].join(', ')
                ]
            }
            total = Patient.count()
        }

        [patientVisitInstanceList: results, patientVisitInstanceTotal: total]
    }
}
