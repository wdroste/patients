package org.sacredheart

import static org.apache.commons.lang.time.DateUtils.truncate

class AppTagLib {
    static namespace = "ui"
    static defaultEncodeAs = 'raw'

    def grailsApplication

    def appHome = { attrs, body ->
        def ytd = truncate(new Date(), Calendar.YEAR)

        // total visits for the year..
        def c = PatientVisit.createCriteria()
        def visits = c.count {
            ge('dateOfVisit', ytd)
            not { inList('typeOfVisit', ['Cancelled', 'NoShow']) }
        }

        // new patients for the year..
        c = Patient.createCriteria()
        def newPatientCountYtd = c.get {
            projections {
                count('id')
            }
            ge('dateCreated', ytd)
        }

        // number of patients that have visited the client this year
        c = PatientVisit.createCriteria()
        def distinctPatientsYtd = c.get{
            projections {
                countDistinct('patient')
            }
            ge('dateOfVisit', ytd)
            not { inList('typeOfVisit', ['Cancelled', 'NoShow']) }
        }

        // define the model
        def model = [
                'patientCount': Patient.count(),
                'ytdVisits': visits,
                'newPatientCountYtd': newPatientCountYtd,
                'distinctPatientsYtd': distinctPatientsYtd
        ]
        def appName = grailsApplication.config.app.homeTemplate ?: '/shcc'
        out << g.render('template': appName, 'model': model)
    }
}
