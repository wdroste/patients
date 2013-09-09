package org.sacredheart

import org.sacredheart.report.VisitReport

class VisitReportTests extends GroovyTestCase {
    void testSomething() {
        log.info "Starting tests"

        // create a visit report
        def vp = new VisitReport()
        vp.name = "test report"
        vp.description = "some description"
        vp.zipCodes = ['2322', '32323']
        vp.educations = ['GED', 'CollegeDegree']

        vp = vp.save(failOnError: true, flush: true)

        // read back the visit report
        vp = VisitReport.get(vp.id)

        assertEquals(2, vp.educations.size())

        // query the visit report..

    }

}
