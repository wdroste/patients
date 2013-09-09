<%@ page import="org.sacredheart.PatientVisit" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patientVisit.label', default: 'Patient Visits')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">
    <g:render template="nav"/>

    <div class="span9">
        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <table class="table table-striped">
            <thead>
            <tr>
                <g:sortableColumn property="dateOfVisit" title="${message(code: 'patientVisit.dateOfVisit.label')}"/>
                <g:sortableColumn property="patient.lastName" title="${message(code: 'patient.fullName.label')}"/>
                <g:sortableColumn property="typeOfVisit" title="${message(code: 'patientVisit.typeOfVisit.label')}"/>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${patientVisitInstanceList}" var="patientVisitInstance">
                <tr>
                    <td><g:formatDate type="date" style="MEDIUM" date="${patientVisitInstance.dateOfVisit}"/></td>
                    <td><f:display bean="${patientVisitInstance.patient}" property="fullName"/></td>
                    <td><f:display bean="${patientVisitInstance}" property="typeOfVisit"/></td>
                    <td class="link">
                        <g:link action="edit" id="${patientVisitInstance.id}" class="btn btn-small">
                            <i class="icon-edit"></i>
                            <g:message code="default.action.edit.label"/>
                        </g:link>
                        <g:link action="delete" id="${patientVisitInstance.id}" class="btn btn-small btn-danger"
                                onclick="window.confirm('${g.message(code: 'default.confirmation')}')">
                            <i class="icon-trash icon-white"></i>
                            <g:message code="default.action.delete.label"/>
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <bootstrap:paginate total="${patientVisitInstanceTotal}"/>
        </div>
    </div>

</div>
</body>
</html>
