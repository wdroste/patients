
<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'visitReport.label', default: 'VisitReport')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${visitReportInstance?.ageRange}">
						<dt><g:message code="visitReport.ageRange.label" default="Age Range" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="ageRange"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.citizen}">
						<dt><g:message code="visitReport.citizen.label" default="Citizen" /></dt>
						
							<dd><g:formatBoolean boolean="${visitReportInstance?.citizen}" /></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.education}">
						<dt><g:message code="visitReport.education.label" default="Education" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="education"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.familyIncomeRange}">
						<dt><g:message code="visitReport.familyIncomeRange.label" default="Family Income Range" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="familyIncomeRange"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.firstNamePattern}">
						<dt><g:message code="visitReport.firstNamePattern.label" default="First Name Pattern" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="firstNamePattern"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.gender}">
						<dt><g:message code="visitReport.gender.label" default="Gender" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="gender"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.language}">
						<dt><g:message code="visitReport.language.label" default="Language" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="language"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.lastNamePattern}">
						<dt><g:message code="visitReport.lastNamePattern.label" default="Last Name Pattern" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="lastNamePattern"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.maritalStatus}">
						<dt><g:message code="visitReport.maritalStatus.label" default="Marital Status" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="maritalStatus"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.middleNamePattern}">
						<dt><g:message code="visitReport.middleNamePattern.label" default="Middle Name Pattern" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="middleNamePattern"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.numberOfFamilyRange}">
						<dt><g:message code="visitReport.numberOfFamilyRange.label" default="Number Of Family Range" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="numberOfFamilyRange"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.patientIdPattern}">
						<dt><g:message code="visitReport.patientIdPattern.label" default="Patient Id Pattern" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="patientIdPattern"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.race}">
						<dt><g:message code="visitReport.race.label" default="Race" /></dt>
						
							<dd><g:fieldValue bean="${visitReportInstance}" field="race"/></dd>
						
					</g:if>
				
					<g:if test="${visitReportInstance?.veteran}">
						<dt><g:message code="visitReport.veteran.label" default="Veteran" /></dt>
						
							<dd><g:formatBoolean boolean="${visitReportInstance?.veteran}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${visitReportInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${visitReportInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
