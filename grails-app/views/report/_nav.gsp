<div class="span3 dontprint">
    <div class="well">
        <ul class="nav nav-list">
            <li class="nav-header">${entityName}</li>
            <li class="<%=actionName == 'index' ? 'active' : ''%>">
                <g:link action="index">
                    <i class="icon-list"></i>
                    <g:message code="report.index.label"/>
                </g:link>
            </li>
        </ul>
    </div>
</div>