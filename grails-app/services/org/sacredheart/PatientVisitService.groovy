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
}
