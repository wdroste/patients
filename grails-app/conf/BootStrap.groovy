import org.apache.shiro.crypto.hash.Sha256Hash
import org.sacredheart.Provider
import org.sacredheart.User

import java.util.concurrent.Executors
import java.util.concurrent.ScheduledExecutorService
import java.util.concurrent.TimeUnit

class BootStrap {

    def backupService
    def patientService
    def patientVisitService

    ScheduledExecutorService scheduledExecutorService = Executors.newSingleThreadScheduledExecutor()

    def init = { servletContext ->
        def password = 'heart'
        def email = 'super@shcc.org'
        def fullName = 'Super User'

        // setup the backup runner..
        scheduledExecutorService.scheduleAtFixedRate({ backupService.backup() } as Runnable, 10, 10, TimeUnit.SECONDS)

        if (User.findByEmail(email)) {
            // exit bootstrap has already ran..
            return;
        }

        def ph = new Sha256Hash(password).toHex()
        def u = new User('email': email, 'passwordHash': ph, 'fullName': fullName)
        u.addToPermissions("*:*")
        u.save(failOnError: true)
        println "Created user: ${u.email}, ${password}"

        // create NA provider..
        Provider na = new Provider()
        na.title = "NA"
        na.license = "NA"
        na.lastName = "NA"
        na.firstName = "NA"
        na.middleName = "NA"
        na.save(failOnError: true)

        // load sacred heart data..
        Thread.start {
            try {
                def f = new File("/tmp/patients.csv")
                if (!f.isFile()) {
                    log.debug("No patient bootstrap files found.")
                    return
                }
                f.withReader { rdr ->
                    patientService.importCSVData(rdr) { success, patientId, message ->
                        if (!success) {
                            log.error("Failed to process patient ${patientId}: ${message}")
                        }
                    }
                }

                f = new File("/tmp/patient_visits.csv")
                f.withReader { rdr ->
                    patientVisitService.importCSVData(rdr) { success, patientId, message ->
                        if (!success) {
                            log.error("Failed to import patient visits.")
                        }
                    }
                }
            } catch (IOException ex) {
                log.error("Failed to load initialization data.", ex)
            }
        }
    }

    def destroy = {
        scheduledExecutorService.shutdown()
    }
}
