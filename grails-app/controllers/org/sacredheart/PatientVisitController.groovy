package org.sacredheart

class PatientVisitController {
    static scaffold = true

    def upload() {
        switch (request.method) {
            case 'POST':
                // check the parameter
                def f = request.getFile('upload_csv')
                if (f.empty) {
                    flash.message = 'File cannot be empty'
                    return [:]
                }

                // upload the file..
                def tmpFile = File.createTempFile("patient_visit_upload_csv-", ".csv")
                f.transferTo(tmpFile)
                try {
                    // send back a transaction ID for progress reports..
                    ['transactionId': patientService.processFile(tmpFile)]
                } catch (ex) {
                    flash.message = ex.message
                }
                break
            default:
                [:]
                break
        }

    }

}
