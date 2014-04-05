package org.sacredheart

class BackupService {

    def jdbcTemplate

    /**
     * Default backup method.
     */
    boolean backup() {
        try {
            backup('backup.zip')
            return true
        } catch (Exception ex) {
            log.error("Failed to backup.", ex)
        }
        return false
    }

    /**
     * Backup the database to a file that can be sent to S3.
     */
    boolean backup(String fileName) {
        log.debug("Starting backup..")
        jdbcTemplate.execute("BACKUP TO \'${fileName}\'")
        log.debug("Finished backup..")
    }
}
