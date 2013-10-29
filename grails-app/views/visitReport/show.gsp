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

    <g:render template="nav"/>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="visitReport.show.header" args="[visitReportInstance.name]"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <dl>
            <g:if test="${visitReportInstance?.description}">
                <dt><g:message code="visitReport.description.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="description"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.zipCodes}">
                <dt><g:message code="visitReport.zipCodes.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="zipCodes"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.citizen}">
                <dt><g:message code="visitReport.citizen.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="citizen"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.educations}">
                <dt><g:message code="visitReport.education.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="educations"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.firstNamePattern}">
                <dt><g:message code="visitReport.firstNamePattern.label"/></dt>
                <dd><g:fieldValue bean="${visitReportInstance}" field="firstNamePattern"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.genders}">
                <dt><g:message code="visitReport.gender.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="genders"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.languages}">
                <dt><g:message code="visitReport.language.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="languages"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.lastNamePattern}">
                <dt><g:message code="visitReport.lastNamePattern.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="lastNamePattern"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.maritalStatuses}">
                <dt><g:message code="visitReport.maritalStatus.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="maritalStatuses"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.middleNamePattern}">
                <dt><g:message code="visitReport.middleNamePattern.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="middleNamePattern"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.patientIdPattern}">
                <dt><g:message code="visitReport.patientIdPattern.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="patientIdPattern"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.races}">
                <dt><g:message code="patient.race.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="races"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.veteran}">
                <dt><g:message code="visitReport.veteran.label"/></dt>
                <dd><f:display bean="${visitReportInstance}" property="veteran"/></dd>
            </g:if>

            <g:if test="${visitReportInstance?.ageRange}">
                <dt><g:message code="visitReport.ageRange.label"/></dt>
                <dd>
                    <f:display bean="${visitReportInstance.ageRange}" property="start"/>
                    -
                    <f:display bean="${visitReportInstance.ageRange}" property="end"/>
                </dd>
            </g:if>

            <g:if test="${visitReportInstance?.numberOfFamilyRange}">
                <dt><g:message code="visitReport.numberOfFamilyRange.label"/></dt>
                <dd>
                    <f:display bean="${visitReportInstance.numberOfFamilyRange}" property="start"/>
                    -
                    <f:display bean="${visitReportInstance.numberOfFamilyRange}" property="end"/>
                </dd>
            </g:if>


            <g:if test="${visitReportInstance?.familyIncomeRange}">
                <dt><g:message code="visitReport.familyIncomeRange.label"/></dt>
                <dd>
                    $<f:display bean="${visitReportInstance.familyIncomeRange}" property="start"/>
                    -
                    $<f:display bean="${visitReportInstance.familyIncomeRange}" property="end"/>
                </dd>
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
