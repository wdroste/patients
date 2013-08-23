import org.sacredheart.User
import org.apache.shiro.crypto.hash.Sha256Hash

class BootStrap {

    def init = { servletContext ->
        def password = 'heart'
        def email = 'super@shcc.org'
        def fullName = 'Super User'

        if (!User.findByEmail(email)) {
            def ph = new Sha256Hash(password).toHex()
            def u = new User('email': email, 'passwordHash': ph, 'fullName':fullName)
            u.addToPermissions("*:*")
            u.save(failOnError:true)
            println "Created user: ${u.email}, ${password}"
        }
    }

    def destroy = {
    }
}
