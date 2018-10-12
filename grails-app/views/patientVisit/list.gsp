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

        <g:form useToken="true" method="get" action="list" class="form-inline">
            <input name="q" class="span5" type="text" placeholder="Search" value="${params.q}">
            <button type="submit" class="btn btn-primary"><i class="icon-search icon-white"></i></button>
        </g:form>

        <table class="table table-striped" data-provides="rowlink">
            <thead>
            <tr>
                <g:sortableColumn params="${['q':params.q]}" property="dateOfVisit" title="${message(code: 'patientVisit.dateOfVisit.label')}"/>
                <th>${message(code: 'patient.fullName.label')}</th>
                <g:sortableColumn params="${['q':params.q]}" property="typeOfVisit" title="${message(code: 'patientVisit.typeOfVisit.label')}"/>
                <g:sortableColumn params="${['q':params.q]}" property="typeOfVisit" title="${message(code: 'patientVisit.provider.label')}"/>
                <g:sortableColumn params="${['q':params.q]}" property="diagnosisCode" title="${message(code: 'patientVisit.diagnosisCode.label')}"/>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${patientVisitInstanceList}" var="patientVisitInstance">
                <tr>
                    <td>
                        <g:link action="show" id="${patientVisitInstance.id}">
                            <g:formatDate type="date" style="MEDIUM" date="${patientVisitInstance.dateOfVisit}"/></td>
                        </g:link>
                    <td><%= patientVisitInstance.fullName  %></td>
                    <td><%= patientVisitInstance.typeOfVisit  %></td>
                    <td><%= patientVisitInstance.provider  %></td>
                    <td><%= patientVisitInstance.diagnosisCode  %></td>
                    <td class="link">
                        <g:link action="edit" id="${patientVisitInstance.id}" class="btn btn-small">
                            <i class="icon-edit"></i>
                            <g:message code="default.action.edit.label"/>
                        </g:link>
                        <g:link action="delete" id="${patientVisitInstance.id}" class="btn btn-small btn-danger"
                                onclick="return confirm('${g.message(code: 'default.confirmation')}')">
                            <i class="icon-trash icon-white"></i>
                            <g:message code="default.action.delete.label"/>
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <bootstrap:paginate total="${patientVisitInstanceTotal}" params="${['q':params.q]}"/>
        </div>
    </div>

</div>
</body>
</html>
