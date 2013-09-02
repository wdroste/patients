<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="visitReport.list.label"/></title>
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
        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <table class="table table-striped">
            <thead>
            <tr>
                <g:sortableColumn property="name" title="${message(code: 'visitReport.name.label')}"/>
                <th class="header"><g:message code="visitReport.description.label"/></th>
                <g:sortableColumn property="lastUpdated" title="${message(code: 'visitReport.lastUpdated.label')}"/>
                <th><g:message code="default.actions.label"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${visitReportInstanceList}" var="visitReportInstance">
                <tr>
                    <td><f:display bean="${visitReportInstance}" property="name"/></td>
                    <td><f:display bean="${visitReportInstance}" property="description"/></td>
                    <td><f:display bean="${visitReportInstance}" property="lastUpdated"/></td>
                    <td class="link">
                        <g:link action="edit" id="${visitReportInstance.id}" class="btn btn-small">
                            <g:message code="default.action.edit.label"/>
                        </g:link>
                        <g:link action="setup" id="${visitReportInstance.id}" class="btn btn-small">Run &raquo;</g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <bootstrap:paginate total="${visitReportInstanceTotal}"/>
        </div>
    </div>
</div>
</body>
</html>
