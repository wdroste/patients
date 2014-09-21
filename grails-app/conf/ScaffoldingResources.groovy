modules = {
    scaffolding {
        dependsOn 'bootstrap'
        resource url: 'css/scaffolding.css'
        resource url: 'css/datepicker.css'
        resource url: 'css/bootstrap-duallistbox.css'
        resource url: 'css/bootstrap-rowlink.min.css'
        resource url: 'js/bootstrap-duallistbox.js'
        resource url: 'js/bootstrap-datepicker.js'

        // pick a date
        resource url: 'js/picker.js'
        resource url: 'js/picker.date.js'

        resource url: 'css/themes/default.css'
        resource url: 'css/themes/default.date.css'

        resource url: 'js/knockout-3.0.0.debug.js'
        resource url: 'js/knockout.simpleGrid.3.0.js'

        resource url: 'js/moment-with-langs.js'

        resource url: 'js/bootstrap-rowlink.min.js'

        // bootstrap helper
        resource url: 'js/bootstrap-formhelpers.js'
        resource url: 'css/bootstrap-formhelpers.css'

        // use for scrolling
        resource url: 'js/ng-infinite-scoll.min.js'
        resource url: 'js/angular.min.js'
    }
}
