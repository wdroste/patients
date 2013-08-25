<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
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
                        <g:message code="default.list.label" args="[entityName]"/>
                    </g:link>
                </li>
                <li>
                    <g:link class="create" action="create">
                        <i class="icon-plus"></i>
                        <g:message code="default.create.label" args="[entityName]"/>
                    </g:link>
                </li>
            </ul>
        </div>
    </div>

    <div class="span9">

        <div class="row-fluid">
            <g:form method="get" action="list" class="form-inline">
                <input name="patientId" class="span5" type="text" placeholder="Patient ID" value="${params.patientId}">
                <input name="lastName" class="span5" type="text" placeholder="Last Name" value="${params.lastName}">
                <button type="submit" class="btn btn-primary"><i class="icon-search icon-white"></i></button>
            </g:form>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <table class="table table-striped">
            <thead>
            <tr>
                <g:sortableColumn property="patientId" title="${message(code: 'patient.patientId.label')}"/>
                <g:sortableColumn property="dateOfBirth" title="${message(code: 'patient.dateOfBirth.label')}"/>
                <g:sortableColumn property="lastName" title="${message(code: 'patient.lastName.label')}"/>
                <g:sortableColumn property="firstName" title="${message(code: 'patient.firstName.label')}"/>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${patientInstanceList}" var="patientInstance">
                <tr>
                    <td><f:display bean="${patientInstance}" property="patientId"/></td>
                    <td><f:display bean="${patientInstance}" property="dateOfBirth"/></td>
                    <td><f:display bean="${patientInstance}" property="lastName"/></td>
                    <td><f:display bean="${patientInstance}" property="firstName"/></td>
                    <td class="link">
                        <g:link action="show" id="${patientInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                        <g:link action="visit" id="${patientInstance.id}" class="btn btn-small">Visit &raquo;</g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <bootstrap:paginate total="${patientInstanceTotal}"
                                params="${[patientId: params.patientId, lastName: params.lastName]}"/>
        </div>
    </div>

</div>
</body>
</html>
