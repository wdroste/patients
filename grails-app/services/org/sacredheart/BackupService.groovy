package org.sacredheart

class BackupService {

    def jdbcTemplate

    def backup() {
        try {
            log.debug("Starting backup..")
            //jdbcTemplate.execute('BACKUP TO \'backup.zip\'')
            log.debug("Finished backup..")
        } catch (Exception ex) {
            log.error("Failed to backup.", ex)
        }
    }
}
