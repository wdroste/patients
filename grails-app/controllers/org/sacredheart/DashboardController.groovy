package org.sacredheart
/**
 * Dashboard data controller.
 */
class DashboardController {

    def raceChart() {
        def ret = [:]
        ret.data = chartData('race', Patient.RACE)
        ret.typeDisplay = 'Race'
        ret.titleDisplay = 'Population Race'
        render(view:"piechart", model:ret)
    }

    def languageChart() {
        def ret = [:]
        ret.data = chartData('language', Patient.LANGUAGE)
        ret.typeDisplay = 'Language'
        ret.titleDisplay = 'Population Language'
        render(view:"piechart", model:ret)
    }

    def genderChart() {
        def ret = [:]
        ret.data = chartData('gender', Patient.GENDER)
        ret.typeDisplay = 'Gender'
        ret.titleDisplay = 'Population Gender'
        render(view:"piechart", model:ret)
    }

    def citizenChart() {
        def ret = [:]
        ret.data = chartData('citizen')
        ret.typeDisplay = 'Citizen'
        ret.titleDisplay = 'Population Citizenship'
        render(view:"piechart", model:ret)
    }

    private List chartData(String countBy) {
        def ret = []
        ret << ['Yes', Patient.countByCitizen(YesNo.Yes)]
        ret << ['No', Patient.countByCitizen(YesNo.No)]
    }

    private List chartData(String countBy, List<String> types) {
        types.collect { type ->
            def details = []
            details << g.message(code:"patient.${countBy}.select.${type}")
            details << Patient."countBy${countBy.capitalize()}"(type)
        }
    }
}
