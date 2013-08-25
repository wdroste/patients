<%@ page import="org.sacredheart.PatientVisit" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patient.label')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">

    <div class="span3">
        <div class="well">
            <ul class="nav nav-list">
                <li class="nav-header">${entityName}</li>
                <li>
                    <g:link class="list" action="list">
                        <i class="icon-list"></i>
                        <g:message code="default.list.label" args="[entityName]" />
                    </g:link>
                </li>
                <li class="active">
                    <g:link class="create" action="create">
                        <i class="icon-plus icon-white"></i>
                        <g:message code="default.create.label" args="[entityName]" />
                    </g:link>
                </li>
            </ul>
        </div>
    </div>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="patient.addVisit.label" /></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <g:hasErrors bean="${patientVisitInstance}">
            <bootstrap:alert class="alert-error">
                <ul>
                    <g:eachError bean="${patientVisitInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </bootstrap:alert>
        </g:hasErrors>

        <fieldset>
            <g:form class="form-horizontal" action="addVisit" >
                <fieldset>
                    <f:field bean="${patientVisitInstance}" property="typeOfVisit"/>
                    <f:field bean="${patientVisitInstance}" property="dateOfVisit"/>
                    
                    <g:field type="hidden" name="patient.id" value="${patientVisitInstance.patient.id}"/>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="icon-ok icon-white"></i>
                            <g:message code="default.button.create.label" />
                        </button>
                    </div>
                </fieldset>
            </g:form>
        </fieldset>

    </div>

</div>
</body>
</html>
