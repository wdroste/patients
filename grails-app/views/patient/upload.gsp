<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patient.label')}"/>
    <title><g:message code="patients.upload.label"/></title>
</head>

<body>
<div class="row-fluid">
    <g:render template="nav"/>
    <div class="span9">
        <div class="page-header">
            <h1><g:message code="patients.upload.label"/></h1>
        </div>
        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <g:if test="${transactionId}">
            <table class="table" id="progressTable">
                <tbody>
                <tr class="info"><td>Uploading patients..</td></tr>
                </tbody>
            </table>
        </g:if>
        <g:else>
            <g:uploadForm action="upload" class="form-search">
                <p>Please only select CSV export files from Medkind.</p>
                <input type="file" name="upload_csv"/>
                <button type="submit" class="btn btn-primary">
                    <i class="icon-file icon-white"></i>
                    <g:message code="default.button.upload.label"/>
                </button>
            </g:uploadForm>
        </g:else>
    </div>
</div>

<g:if test="${transactionId}">
    <script>

function refreshUploadStatus() {
    $.ajax({
        url:"${g.createLink(action: 'uploadProgress', id: transactionId)}",
        success:function(results) {
            for (var i in results) {
                var result = results[i]
                var msg = result.message
                var elm = $('#progressTable tr:last')

                // create table row..
                if (result.success == true) {
                    elm.after('<tr class="success"><td>' + msg + '</td></tr>');
                } else {
                    elm.after('<tr class="error"><td>' + msg + '</td></tr>');
                }
            }
            // check if there's more data..
            if (results.length > 0) {
                setTimeout(refreshUploadStatus, 5000);
            } else {
                $('#progressTable tr:last').after('<tr class="info"><td>Complete</td></tr>');
            }
        }
    });
}
setTimeout(refreshUploadStatus, 100);
    </script>
</g:if>

</body>
</html>
