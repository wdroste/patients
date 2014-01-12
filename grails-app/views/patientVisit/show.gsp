<%@ page import="org.sacredheart.PatientVisit" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patientVisit.label')}"/>
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
            <g:if test="${patientVisitInstance?.dateOfVisit}">
                <dt><g:message code="patientVisit.dateOfVisit.label"/></dt>
                <dd><g:formatDate date="${patientVisitInstance.dateOfVisit}" type="date" style="MEDIUM"/></dd>
            </g:if>

            <g:if test="${patientVisitInstance?.patientId}">
                <dt><g:message code="patientVisit.patientId.label"/></dt>
                <dd><f:display bean="${patientVisitInstance.patient}" property="patientId"/></dd>
            </g:if>

            <g:if test="${patientVisitInstance?.typeOfVisit}">
                <dt><g:message code="patientVisit.typeOfVisit.label"/></dt>
                <dd><f:display bean="${patientVisitInstance}" property="typeOfVisit"/></dd>
            </g:if>

            <g:if test="${patientVisitInstance?.provider}">
                <dt><g:message code="patientVisit.provider.label"/></dt>
                <dd><f:display bean="${patientVisitInstance}" property="provider"/></dd>
            </g:if>

            <g:if test="${patientVisitInstance?.diagnosisCode}">
                <dt><g:message code="patientVisit.diagnosisCode.label"/></dt>
                <dd><f:display bean="${patientVisitInstance}" property="diagnosisCode"/></dd>
            </g:if>
        </dl>
        <g:form>
            <g:hiddenField name="id" value="${patientVisitInstance?.id}"/>
            <div class="form-actions">
                <g:link class="btn" action="edit" id="${patientVisitInstance?.id}">
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
