
<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
                            <g:sortableColumn property="id" title="${message(code: 'patient.id.label', default: 'Patient ID')}" />
							<g:sortableColumn property="dateOfBirth" title="${message(code: 'patient.dateOfBirth.label', default: 'Date Of Birth')}" />
							<g:sortableColumn property="lastName" title="${message(code: 'patient.lastName.label', default: 'Last Name')}" />
							<g:sortableColumn property="language" title="${message(code: 'patient.language.label', default: 'Language')}" />
                            <g:sortableColumn property="gender" title="${message(code: 'patient.gender.label', default: 'Gender')}" />
                            <th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${patientInstanceList}" var="patientInstance">
						<tr>
							<td>${fieldValue(bean: patientInstance, field: "id")}</td>
							<td>${fieldValue(bean: patientInstance, field: "dateOfBirth")}</td>
							<td>${fieldValue(bean: patientInstance, field: "lastName")}</td>
							<td>${fieldValue(bean: patientInstance, field: "language")}</td>
							<td>${fieldValue(bean: patientInstance, field: "gender")}</td>
							<td class="link">
								<g:link action="show" id="${patientInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${patientInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
