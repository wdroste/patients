<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="report.setup.label"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav"/>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="report.setup.label"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>
        <g:form action="run" class="form-horizontal" method="GET">
            <div class="control-group">
                <label class="control-label" for="${property}">
                    <g:message code="report.index.label"/>
                </label>
                <div class="controls">
                    <g:select
                            required=""
                            name="reportId"
                            valueMessagePrefix="report.static.select"
                            from="${reports}"/>
                </div>
            </div>


            <div class="control-group ">
                <label class="control-label" for="start">
                    <g:message code="visitReport.setup.startDate"/>
                </label>
                <div class="controls">
                    <g:datePicker id="start" name="start" value="${new Date() - 14}" precision="day"/>
                </div>
            </div>

            <div class="control-group ">
                <label class="control-label" for="end">
                    <g:message code="visitReport.setup.endDate"/>
                </label>
                <div class="controls">
                    <g:datePicker id="end" name="end" value="${new Date()}" precision="day"/>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="icon-ok icon-white"></i>
                    <g:message code="default.button.run.label"/>
                </button>
                <g:actionSubmit class="btn" value="${g.message(code: 'default.button.cancel.label')}" action="list"/>
            </div>

        </g:form>
    </div>
</div>
</body>
</html>
