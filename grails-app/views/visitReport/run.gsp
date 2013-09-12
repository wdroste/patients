<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <g:set var="startDateLabel"><g:formatDate date="${startDate}" style="SHORT" type="date"/></g:set>
    <g:set var="endDateLabel"><g:formatDate date="${endDate}" style="SHORT" type="date"/></g:set>
    <meta name="layout" content="bootstrap">
    <title><g:message code="visitReport.run.label"
           args="${[visitReportInstance.name, startDateLabel, endDateLabel]}"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav"/>

    <div class="span9">
        <div class="page-header">
            <h1><g:message code="visitReport.run.label"
               args="${[visitReportInstance.name, startDateLabel, endDateLabel]}"/></h1>
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
