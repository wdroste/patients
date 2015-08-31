<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="visitReport.setup.label" args="[visitReportInstance.name]"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav"/>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="visitReport.setup.label" args="[visitReportInstance.name]"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>
        <g:form action="run" class="form-horizontal" method="GET">
            <g:hiddenField name="id" value="${visitReportInstance.id}"/>
            <div class="control-group ">
                <label class="control-label" for="start">
                    <g:message code="visitReport.setup.startDate"/>
                </label>
                <div class="controls">
                    <input id="start" name="start" class="datepicker"
                           data-value="${(new Date() -14).format("yyyy-MM-dd")}"/>
                </div>
            </div>
            <div class="control-group ">
                <label class="control-label" for="end">
                    <g:message code="visitReport.setup.endDate"/>
                </label>
                <div class="controls">
                    <input id="end" name="end" class="datepicker" data-value="${new Date()}"/>
                </div>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="icon-ok icon-white"></i>
                    <g:message code="default.button.run.label"/>
                </button>
                <g:link class="btn" action="list">
                    <g:message code="default.button.cancel.label"/>
                </g:link>
            </div>
        </g:form>
    </div>
</div>
<script>
    $('.datepicker').pickadate({
        editable: true,
        max: true,
        formatSubmit:'yyyy-mm-dd'
    });
</script>
</body>
</html>
