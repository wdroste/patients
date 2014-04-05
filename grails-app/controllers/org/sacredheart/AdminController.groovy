package org.sacredheart

import static org.apache.commons.lang.StringUtils.defaultIfBlank

/**
 * Admin operations.
 */
class AdminController {

    def backupService

    def index() {}

    def backup() {
        def fileName = defaultIfBlank(params.get('filename'), 'backup.zip')
        backupService.backup(fileName)
        render "Backup complete for: $fileName"
    }
}
