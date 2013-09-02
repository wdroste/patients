<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'visitReport.label')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
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
            <h1><g:message code="visitReport.show.header" args="[visitReportInstance.name]"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <dl>
            <g:if test="${visitReportInstance?.ageRange}">
                <dt><g:message code="visitReport.ageRange.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="ageRange"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.citizen}">
                <dt><g:message code="visitReport.citizen.label"/></dt>
                <dd><g:formatBoolean boolean="${visitReportInstance?.citizen}"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.educations}">
                <dt><g:message code="visitReport.education.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="educations"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.familyIncomeRange}">
                <dt><g:message code="visitReport.familyIncomeRange.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="familyIncomeRange"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.firstNamePattern}">
                <dt><g:message code="visitReport.firstNamePattern.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="firstNamePattern"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.gender}">
                <dt><g:message code="visitReport.gender.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="gender"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.languages}">
                <dt><g:message code="visitReport.language.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="languages"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.lastNamePattern}">
                <dt><g:message code="visitReport.lastNamePattern.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="lastNamePattern"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.maritalStatuses}">
                <dt><g:message code="visitReport.maritalStatus.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="maritalStatuses"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.middleNamePattern}">
                <dt><g:message code="visitReport.middleNamePattern.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="middleNamePattern"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.numberOfFamilyRange}">
                <dt><g:message code="visitReport.numberOfFamilyRange.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="numberOfFamilyRange"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.patientIdPattern}">
                <dt><g:message code="visitReport.patientIdPattern.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="patientIdPattern"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.races}">
                <dt><g:message code="visitReport.race.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="races"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.veteran}">
                <dt><g:message code="visitReport.veteran.label"/></dt>
                <dd><g:formatBoolean boolean="${visitReportInstance?.veteran}"/></dd>
            </g:if>
        </dl>

        <g:form>
            <g:hiddenField name="id" value="${visitReportInstance?.id}"/>
            <div class="form-actions">
                <g:link class="btn" action="edit" id="${visitReportInstance?.id}">
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
