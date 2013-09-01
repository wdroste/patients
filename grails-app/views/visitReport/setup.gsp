<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="visitReport.setup.label"/></title>
</head>

<body>
<div class="row-fluid">

    <div class="span3">
        <div class="well">
            <ul class="nav nav-list">
                <li class="nav-header">${entityName}</li>
                <li class="active">
                    <g:link class="list" action="list">
                        <i class="icon-list icon-white"></i>
                        <g:message code="visitReport.list.label"/>
                    </g:link>
                </li>
                <li>
                    <g:link class="create" action="create">
                        <i class="icon-plus"></i>
                        <g:message code="visitReport.create.label"/>
                    </g:link>
                </li>
            </ul>
        </div>
    </div>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="visitReport.setup.label"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>
        <g:form action="run" class="form-horizontal">
            <g:hiddenField name="id" value="${visitReportInstance.id}"/>

            <div class="control-group ">
                <label class="control-label" for="start" >
                    <g:message code="visitReport.setup.startDate"/>
                </label>
                <div class="controls">
                    <g:datePicker id="start" name="start"  value="${new Date() - 14}" precision="day"/>
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
                    <g:message code="default.button.cancel.label" default="Run" />
                </button>
                <button type="submit" class="btn">
                    <g:message code="default.button.run.label" default="Cancel" />
                </button>
            </div>

        </g:form>
    </div>
</div>
</body>
</html>
