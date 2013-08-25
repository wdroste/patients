import org.apache.shiro.crypto.hash.Sha256Hash
import org.sacredheart.User

class BootStrap {

    def patientService

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
        try {
            new File("/tmp/data.csv").withReader { rdr ->
                patientService.importCSVData(rdr)
            }
        } catch (IOException ex) {
            log.warn("Failed to load initialization data.")
        }
    }

    def destroy = {
    }
}
