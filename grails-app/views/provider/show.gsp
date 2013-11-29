
<%@ page import="org.sacredheart.Provider" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
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
                    <dt><g:message code="provider.providerId.label" /></dt>
                        <dd><g:fieldValue bean="${providerInstance}" field="license"/></dd>
                    <dt><g:message code="provider.lastName.label" /></dt>
                        <dd><g:fieldValue bean="${providerInstance}" field="lastName"/></dd>
                    <dt><g:message code="provider.firstName.label" /></dt>
                        <dd><g:fieldValue bean="${providerInstance}" field="firstName"/></dd>
                    <dt><g:message code="provider.middleName.label" /></dt>
                        <dd><g:fieldValue bean="${providerInstance}" field="middleName"/></dd>
                    <dt><g:message code="provider.title.label" /></dt>
                        <dd><g:fieldValue bean="${providerInstance}" field="title"/></dd>
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${providerInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${providerInstance?.id}">
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
