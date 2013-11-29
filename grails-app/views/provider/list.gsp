
<%@ page import="org.sacredheart.Provider" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
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
				
				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
							<g:sortableColumn property="providerId" title="${message(code: 'provider.license.label')}" />
							<g:sortableColumn property="lastName" title="${message(code: 'provider.title.label')}" />
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${providerInstanceList}" var="providerInstance">
						<tr>
							<td>${fieldValue(bean: providerInstance, field: "license")}</td>
							<td>${fieldValue(bean: providerInstance, field: "title")}</td>
							<td class="link">
								<g:link action="show" id="${providerInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${providerInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
