<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patient.label')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav" />

    <div class="span9">

        <div class="row-fluid">
            <g:form method="get" action="list" class="form-inline">
                <input name="q" class="span5" type="text" placeholder="Search" value="${params.q}">
                <button type="submit" class="btn btn-primary"><i class="icon-search icon-white"></i></button>
            </g:form>

            <g:if test="${false}">
                <g:form method="get" action="list" class="form-inline">
                    <label class="checkbox"><input type="checkbox"> Missing Veteran</label>
                    <label class="checkbox"><input type="checkbox"> Missing Citizenship</label>
                    <label class="checkbox"><input type="checkbox"> Missing Date of Birth</label>
                    <label class="checkbox"><input type="checkbox"> Missing Race</label>
                    <label class="checkbox"><input type="checkbox"> Missing Gender</label>
                    <button type="submit" class="btn btn-primary"><i class="icon-search icon-white"></i></button>
                </g:form>
            </g:if>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <table class="table table-striped" data-provides="rowlink">
            <thead>
            <tr>
                <g:sortableColumn property="patientId" title="${message(code: 'patient.patientId.label')}" params="${[q:params.q]}"/>
                <g:sortableColumn property="dateOfBirth" title="${message(code: 'patient.dateOfBirth.label')}"  params="${[q:params.q]}"/>
                <g:sortableColumn property="lastName" title="${message(code: 'patient.lastName.label')}" params="${[q:params.q]}"/>
                <g:sortableColumn property="firstName" title="${message(code: 'patient.firstName.label')}" params="${[q:params.q]}"/>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${patientInstanceList}" var="patientInstance">
                <tr>
                    <td>
                        <g:link action="show" id="${patientInstance.id}">
                            <f:display bean="${patientInstance}" property="patientId"/>
                        </g:link>
                    </td>
                    <td><f:display bean="${patientInstance}" property="dateOfBirth"/></td>
                    <td><f:display bean="${patientInstance}" property="lastName"/></td>
                    <td><f:display bean="${patientInstance}" property="firstName"/></td>
                    <td class="nolink">
                        <g:link action="visit" id="${patientInstance.id}" class="btn btn-small btn-primary">
                            <i class="icon-plus icon-white"></i>
                            <g:message code="patient.visit.label"/>
                        </g:link>

                        <g:link action="edit" id="${patientInstance.id}" class="btn btn-small">
                            <i class="icon-edit"></i>
                            <g:message code="default.action.edit.label"/>
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <bootstrap:paginate total="${patientInstanceTotal}" params="${[q:params.q]}"/>
        </div>
    </div>
</div>
</body>
</html>