modules = {
    scaffolding {
        dependsOn 'bootstrap'
        resource url: 'css/scaffolding.css'
        resource url: 'css/datepicker.css'
        resource url: 'css/bootstrap-duallistbox.css'
        resource url: 'css/bootstrap-rowlink.min.css'
        resource url: 'js/bootstrap-duallistbox.js'
        resource url: 'js/bootstrap-datepicker.js'
        resource url: 'js/knockout-2.3.0.js'
        resource url: 'js/bootstrap-rowlink.min.js'

        // ember JS
        resource url: 'js/handlebars-1.1.2.js'
        resource url: 'js/ember-1.3.1.js'

        // bootstrap helper
        resource url: 'js/bootstrap-formhelpers.js'
        resource url: 'css/bootstrap-formhelpers.css'
    }
}
