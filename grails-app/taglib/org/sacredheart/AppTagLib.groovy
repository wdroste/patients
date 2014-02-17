package org.sacredheart

import static org.apache.commons.lang.time.DateUtils.truncate

class AppTagLib {
    static namespace = "ui"
    static defaultEncodeAs = 'raw'

    def grailsApplication

    def appHome = { attrs, body ->
        def c = PatientVisit.createCriteria()

        // total patient count..
        def count = Patient.count()

        // total visits for the year..
        def visits = c.count {
            ge('dateOfVisit', truncate(new Date(), Calendar.YEAR))
            not { inList('typeOfVisit', ['Cancelled', 'NoShow']) }
        }

        def appName = grailsApplication.config.app.homeTemplate ?: '/shcc'
        out << g.render(template:appName, model:['patientCount':count, 'ytdVisits':visits])
    }
}
