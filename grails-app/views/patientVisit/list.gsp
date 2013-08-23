
<%@ page import="org.sacredheart.PatientVisit" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'patientVisit.label', default: 'Patient Visits')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">Patient Visits</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								List Patient Visits
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								Create Patient Visit
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">

                <!--
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>
				-->

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="dateOfVisit" title="${message(code: 'patientVisit.dateOfVisit.label', default: 'Date Of Visit')}" />
						
							<g:sortableColumn property="patientId" title="${message(code: 'patientVisit.patientId.label', default: 'Patient Id')}" />
						
							<g:sortableColumn property="screeningResults" title="${message(code: 'patientVisit.screeningResults.label', default: 'Screening Results')}" />
						
							<g:sortableColumn property="typeOfVisit" title="${message(code: 'patientVisit.typeOfVisit.label', default: 'Type Of Visit')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${patientVisitInstanceList}" var="patientVisitInstance">
						<tr>
							<td><g:formatDate date="${patientVisitInstance.dateOfVisit}" /></td>
							<td>${fieldValue(bean: patientVisitInstance, field: "patient.patientId")}</td>
							<td>${fieldValue(bean: patientVisitInstance, field: "screeningResults")}</td>
							<td>${fieldValue(bean: patientVisitInstance, field: "typeOfVisit")}</td>
							<td class="link">
								<g:link action="show" id="${patientVisitInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${patientVisitInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
