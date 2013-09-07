import org.apache.shiro.crypto.hash.Sha256Hash
import org.sacredheart.User

class BootStrap {

    def patientService
    def patientVisitService
    def sessionFactory

    def init = { servletContext ->
        def password = 'heart'
        def email = 'super@shcc.org'
        def fullName = 'Super User'

        if (User.findByEmail(email)) {
            // exit bootstrap has already ran..
            return;
        } else {
            def ph = new Sha256Hash(password).toHex()
            def u = new User('email': email, 'passwordHash': ph, 'fullName': fullName)
            u.addToPermissions("*:*")
            u.save(failOnError: true)
            println "Created user: ${u.email}, ${password}"
        }

        // load sacred heart data..
        Thread.start {
            try {
                new File("/tmp/patients.csv").withReader { rdr ->
                    patientService.importCSVData(rdr) { success, patientId, message ->
                        if (!success) {
                            log.error("Failed to process patient ${patientId}: ${message}")
                        }
                    }
                }

                new File("/tmp/patient_visits.csv").withReader { rdr ->
                    patientVisitService.importCSVData(rdr) { success, patientId, message ->
                        if (!success) {
                            log.error("Failed to import patient visits.")
                        }
                    }
                }
            } catch (IOException ex) {
                log.error("Failed to load initialization data.")
            }
        }
    }

    def destroy = {
    }
}
