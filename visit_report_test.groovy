import org.sacredheart.*
import org.sacredheart.report.*

def patientService = ctx.patientService

//def visitReport = new VisitReport()
//visitReport.name = "test visit report"
//visitReport.description = "some description"
//visitReport.save(failOnError:true)
def visitReport = VisitReport.findByName("test visit report")

patientService.run(visitReport, new Date() - 120, new Date())