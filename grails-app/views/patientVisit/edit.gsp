<%@ page import="org.sacredheart.PatientVisit" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'patientVisit.label', default: 'PatientVisit')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
					<g:form class="form-horizontal" action="edit" id="${patientVisitInstance?.id}" >
						<g:hiddenField name="version" value="${patientVisitInstance?.version}" />
						<fieldset>
                            <g:set var="patient" value="${patientVisitInstance.patient}"/>

                            <div class="control-group ">
                                <label class="control-label" for="fullName">
                                    <g:message code="patient.fullName.label"/>
                                </label>
                                <div class="controls">
                                    <input type="text" id="fullName" value="${patient.fullName}" readonly>
                                </div>
                            </div>

                            <g:set var="dt"><g:formatDate type="date" style="SHORT" date="${patient.dateOfBirth}"/></g:set>
                            <div class="control-group ">
                                <label class="control-label" for="dateOfBirth">
                                    <g:message code="patient.dateOfBirth.label"/>
                                </label>
                                <div class="controls">
                                    <input type="text" id="dateOfBirth" value="${dt}" readonly>
                                </div>
                            </div>
                            <f:field bean="patientVisitInstance" property="dateOfVisit"/>
                            <f:field bean="patientVisitInstance" property="typeOfVisit"/>
                            <f:field bean="patientVisitInstance" property="provider"/>

                            <div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.update.label" default="Update" />
								</button>
								<button type="submit" class="btn btn-danger" name="_action_delete" formnovalidate>
									<i class="icon-trash icon-white"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

			</div>

		</div>
	</body>
</html>
