package org.sacredheart.report



import org.junit.*
import grails.test.mixin.*

@TestFor(VisitReportController)
@Mock(VisitReport)
class VisitReportControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/visitReport/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.visitReportInstanceList.size() == 0
        assert model.visitReportInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.visitReportInstance != null
    }

    void testSave() {
        controller.save()

        assert model.visitReportInstance != null
        assert view == '/visitReport/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/visitReport/show/1'
        assert controller.flash.message != null
        assert VisitReport.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/visitReport/list'

        populateValidParams(params)
        def visitReport = new VisitReport(params)

        assert visitReport.save() != null

        params.id = visitReport.id

        def model = controller.show()

        assert model.visitReportInstance == visitReport
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/visitReport/list'

        populateValidParams(params)
        def visitReport = new VisitReport(params)

        assert visitReport.save() != null

        params.id = visitReport.id

        def model = controller.edit()

        assert model.visitReportInstance == visitReport
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/visitReport/list'

        response.reset()

        populateValidParams(params)
        def visitReport = new VisitReport(params)

        assert visitReport.save() != null

        // test invalid parameters in update
        params.id = visitReport.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/visitReport/edit"
        assert model.visitReportInstance != null

        visitReport.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/visitReport/show/$visitReport.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        visitReport.clearErrors()

        populateValidParams(params)
        params.id = visitReport.id
        params.version = -1
        controller.update()

        assert view == "/visitReport/edit"
        assert model.visitReportInstance != null
        assert model.visitReportInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/visitReport/list'

        response.reset()

        populateValidParams(params)
        def visitReport = new VisitReport(params)

        assert visitReport.save() != null
        assert VisitReport.count() == 1

        params.id = visitReport.id

        controller.delete()

        assert VisitReport.count() == 0
        assert VisitReport.get(visitReport.id) == null
        assert response.redirectedUrl == '/visitReport/list'
    }
}
