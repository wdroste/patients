package org.sacredheart

import static org.apache.commons.lang.time.DateUtils.truncate

class AppTagLib {
    static namespace = "ui"
    static defaultEncodeAs = 'raw'

    def grailsApplication

    def appHome = { attrs, body ->
        // total patient count..
        def count = Patient.count()

        // total visits for the year..
        def c = PatientVisit.createCriteria()
        def visits = c.count {
            ge('dateOfVisit', truncate(new Date(), Calendar.YEAR))
            not { inList('typeOfVisit', ['Cancelled', 'NoShow']) }
        }

        // distinct patients for the year..
        c = PatientVisit.createCriteria()
        def distinctPatientsYtd = c.get{
            projections {
                countDistinct('patient')
            }
            ge('dateOfVisit', truncate(new Date(), Calendar.YEAR))
            not { inList('typeOfVisit', ['Cancelled', 'NoShow']) }
        }

        // define the model
        def model = [
            'patientCount':count,
            'ytdVisits':visits,
            'distinctPatientsYtd': distinctPatientsYtd
        ]
        def appName = grailsApplication.config.app.homeTemplate ?: '/shcc'
        out << g.render('template':appName, 'model':model)
    }
}
