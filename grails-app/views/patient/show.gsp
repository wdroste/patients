
<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
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
				
					<g:if test="${patientInstance?.citizen}">
						<dt><g:message code="patient.citizen.label" default="Citizen" /></dt>
						
							<dd><g:formatBoolean boolean="${patientInstance?.citizen}" /></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.dateOfBirth}">
						<dt><g:message code="patient.dateOfBirth.label" default="Date Of Birth" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="dateOfBirth"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.education}">
						<dt><g:message code="patient.education.label" default="Education" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="education"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.firstName}">
						<dt><g:message code="patient.firstName.label" default="First Name" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="firstName"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.gender}">
						<dt><g:message code="patient.gender.label" default="Gender" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="gender"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.language}">
						<dt><g:message code="patient.language.label" default="Language" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="language"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.lastName}">
						<dt><g:message code="patient.lastName.label" default="Last Name" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="lastName"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.numberOfFamily}">
						<dt><g:message code="patient.numberOfFamily.label" default="Number Of Family" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="numberOfFamily"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.race}">
						<dt><g:message code="patient.race.label" default="Race" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="race"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.reference}">
						<dt><g:message code="patient.reference.label" default="Reference" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="reference"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.status}">
						<dt><g:message code="patient.status.label" default="Status" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="status"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.veteran}">
						<dt><g:message code="patient.veteran.label" default="Veteran" /></dt>
						
							<dd><g:formatBoolean boolean="${patientInstance?.veteran}" /></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.yearlyFamilyIncome}">
						<dt><g:message code="patient.yearlyFamilyIncome.label" default="Yearly Family Income" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="yearlyFamilyIncome"/></dd>
						
					</g:if>
				
					<g:if test="${patientInstance?.zipcode}">
						<dt><g:message code="patient.zipcode.label" default="Zipcode" /></dt>
						
							<dd><g:fieldValue bean="${patientInstance}" field="zipcode"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${patientInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${patientInstance?.id}">
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
