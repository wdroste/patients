<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="visitReport.list.label"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav"/>

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
                    <td>
                        <g:link action="setup" id="${visitReportInstance.id}" class="btn btn-small btn-primary">
                            <i class="icon-tasks icon-white"></i>
                            <g:message code="visitReport.runlink.label"/>
                        </g:link>

                        <g:link action="edit" id="${visitReportInstance.id}" class="btn btn-small">
                            <i class="icon-edit"></i>
                            <g:message code="default.action.edit.label"/>
                        </g:link>
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
