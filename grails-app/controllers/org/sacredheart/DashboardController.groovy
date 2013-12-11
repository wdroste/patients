package org.sacredheart

import grails.converters.JSON

/**
 * Dashboard data controller.
 */
class DashboardController {

    /**
     * Get the language data for all the patients.
     */
    def languageData() {
        render Patient.LANGUAGE.collect { lang ->
            def count = Patient.countByLanguage(lang)
            def display = message(code:"patient.language.select.${lang}")
            [display, count]
        } as JSON
    }
}
