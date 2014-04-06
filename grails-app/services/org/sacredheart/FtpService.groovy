package org.sacredheart

import org.apache.commons.net.ftp.FTPClient
import org.apache.commons.net.ftp.FTPReply
import org.apache.commons.net.ftp.FTPSClient

class FtpService {
    static transactional = false

    def grailsApplication

    /**
     * Upload the specified file to the ftp server.
     */
    def upload(File file) {
        // create an FTP client to use..
        withFTPClient({ FTPClient ftp ->
            // send file to client..
            file.withInputStream { ins ->
                if (!ftp.storeFile(file.getName(), ins)) {
                    throw new IOException('Failed to store file.')
                }
            }
        })
    }

    void withFTPClient(Closure<FTPClient> callback) {
        int reply
        // grab the FTP configuration information..
        def cfg = grailsApplication.config.app.ftp
        FTPClient ftp = cfg.ssl ? new FTPSClient() : new FTPClient()

        // connect to the host..
        ftp.connect(cfg.host, cfg.port)
        reply = ftp.getReplyCode()
        if (!FTPReply.isPositiveCompletion(reply)) {
            ftp.disconnect()
            throw new IOException("FTP server refused connection.")
        }

        // login into the host
        ftp.login((String)cfg.username, (String)cfg.password)
        reply = ftp.getReplyCode()
        if (!FTPReply.isPositiveCompletion(reply)) {
            ftp.disconnect()
            throw new IOException("Login failed.")
        }

        // Use passive mode as default because most of us are
        // behind firewalls these days.
        if (cfg.active) {
            ftp.enterLocalActiveMode()
        } else {
            ftp.enterLocalPassiveMode()
        }

        // use the client in a callback..
        try {
            callback.call(ftp)
        }
        finally {
            // close after use..
            ftp.disconnect()
        }
    }
}
