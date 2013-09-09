<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="visitReport.run.label"/></title>
</head>

<body>
<div class="row-fluid">

    <div class="span3 no-print">
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
            <h1><g:message code="visitReport.run.label"
                           args="${[visitReportInstance.name, startDate, endDate]}"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        Count: ${reportInstanceList.size()}
        <table class="table table-striped">
            <thead>
            <tr>
                <th class="header"><g:message code="patientVisit.dateOfVisit.label"/></th>
                <th class="header"><g:message code="patientVisit.typeOfVisit.label"/></th>
                <th class="header"><g:message code="patient.fullName.label"/></th>
                <th></th>
            </tr>
            </thead>
            <tbody>

            <g:each in="${reportInstanceList}" var="reportInstance">
                <tr>
                    <td><g:formatDate type="date" dateStyle="SHORT" date="${reportInstance[0]}"/></td>
                    <td><g:message code="${'patientVisit.visitType.select.' + reportInstance[1]}"/></td>
                    <td>
                        <%=reportInstance[2]%>,<%=reportInstance[3]%>
                    </td>
                </tr>
            </g:each>
            <tr class="success">
                <td>Total:</td>
                <td colspan="2">${reportInstanceList.size()}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
