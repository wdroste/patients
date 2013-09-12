<div class="span3 dontprint">
    <div class="well">
        <ul class="nav nav-list">
            <li class="nav-header">${entityName}</li>
            <li class="<%=actionName == 'list' ? 'active' : ''%>">
                <g:link action="list">
                    <i class="icon-list"></i>
                    <g:message code="visitReport.list.label"/>
                </g:link>
            </li>
            <li class="<%=actionName == 'create' ? 'active' : ''%>">
                <g:link action="create">
                    <i class="icon-plus"></i>
                    <g:message code="visitReport.create.label"/>
                </g:link>
            </li>
        </ul>
    </div>
</div>