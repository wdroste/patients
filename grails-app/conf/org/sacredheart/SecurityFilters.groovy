package org.sacredheart

/**
 * Generated by the Shiro plugin. This filters class protects all URLs
 * via access control by convention.
 */
class SecurityFilters {
    def filters = {
        all(uri: "/**") {
            before = {
                // make sure the admin controller is only accessible from localhost
                String ipAddress = request.remoteAddr
                if ('admin'.equals(controllerName) && '127.0.0.1'.equals(ipAddress)) {
                    return true
                }
                // Ignore direct views (e.g. the default main index page).
                if (!controllerName) return true

                // Access control by convention.
                accessControl()
            }
        }
    }
}
