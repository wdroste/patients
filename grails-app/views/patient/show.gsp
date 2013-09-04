<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patient.label')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav"/>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="default.show.label" args="[entityName]"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <dl>
            <g:if test="${patientInstance?.citizen}">
                <dt><g:message code="patient.citizen.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="citizen"/></dd>
            </g:if>
            <g:if test="${patientInstance?.dateOfBirth}">
                <dt><g:message code="patient.dateOfBirth.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="dateOfBirth"/></dd>
            </g:if>
            <g:if test="${patientInstance?.education}">
                <dt><g:message code="patient.education.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="education"/></dd>
            </g:if>
            <g:if test="${patientInstance?.firstName}">
                <dt><g:message code="patient.firstName.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="firstName"/></dd>
            </g:if>
            <g:if test="${patientInstance?.gender}">
                <dt><g:message code="patient.gender.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="gender"/></dd>
            </g:if>
            <g:if test="${patientInstance?.language}">
                <dt><g:message code="patient.language.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="language"/></dd>
            </g:if>
            <g:if test="${patientInstance?.lastName}">
                <dt><g:message code="patient.lastName.label" default="Last Name"/></dt>
                <dd><f:display bean="${patientInstance}" property="lastName"/></dd>
            </g:if>
            <g:if test="${patientInstance?.numberOfFamily}">
                <dt><g:message code="patient.numberOfFamily.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="numberOfFamily"/></dd>
            </g:if>
            <g:if test="${patientInstance?.race}">
                <dt><g:message code="patient.race.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="race"/></dd>
            </g:if>
            <g:if test="${patientInstance?.maritalStatus}">
                <dt><g:message code="patient.maritalStatus.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="maritalStatus"/></dd>
            </g:if>

            <g:if test="${patientInstance?.veteran}">
                <dt><g:message code="patient.veteran.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="veteran"/></dd>
            </g:if>

            <g:if test="${patientInstance?.yearlyFamilyIncome}">
                <dt><g:message code="patient.yearlyFamilyIncome.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="yearlyFamilyIncome"/></dd>
            </g:if>

            <g:if test="${patientInstance?.zipcode}">
                <dt><g:message code="patient.zipcode.label"/></dt>
                <dd><f:display bean="${patientInstance}" property="zipcode"/></dd>
            </g:if>
        </dl>
        <g:form>
            <g:hiddenField name="id" value="${patientInstance?.id}"/>
            <div class="form-actions">
                <g:link class="btn" action="edit" id="${patientInstance?.id}">
                    <i class="icon-pencil"></i>
                    <g:message code="default.button.edit.label"/>
                </g:link>
                <button class="btn btn-danger" type="submit" name="_action_delete">
                    <i class="icon-trash icon-white"></i>
                    <g:message code="default.button.delete.label"/>
                </button>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
