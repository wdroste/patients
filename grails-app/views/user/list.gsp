<%@ page import="org.sacredheart.User" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'user.label')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">

    <div class="span3 hidden-print">
        <div class="well">
            <ul class="nav nav-list">
                <li class="nav-header">${entityName}</li>
                <li class="active">
                    <g:link class="list" action="list">
                        <i class="icon-list icon-white"></i>
                        <g:message code="default.list.label" args="[entityName]"/>
                    </g:link>
                </li>
                <li>
                    <g:link class="create" action="create">
                        <i class="icon-plus"></i>
                        <g:message code="default.create.label" args="[entityName]"/>
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
                <g:sortableColumn property="email" title="${message(code: 'user.email.label')}"/>
                <g:sortableColumn property="fullName" title="${message(code: 'user.fullName.label')}"/>
                <th><g:message code="default.actions.label"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${userInstanceList}" var="userInstance">
                <tr>
                    <td>${fieldValue(bean: userInstance, field: "email")}</td>
                    <td>${fieldValue(bean: userInstance, field: "fullName")}</td>
                    <td class="link">
                        <g:link action="edit" id="${userInstance.id}" class="btn btn-small">
                            <i class="icon-edit"></i>
                            <g:message code="default.action.edit.label"/>
                        </g:link>
                        <g:link action="delete" id="${userInstance.id}" class="btn btn-small btn-danger"
                                onclick="window.confirm('${g.message(code:'default.confirmation')}')">
                            <i class="icon-trash icon-white"></i>
                            <g:message code="default.action.delete.label"/>
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <bootstrap:paginate total="${userInstanceTotal}"/>
        </div>
    </div>

</div>
</body>
</html>
