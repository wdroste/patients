<div class="span3">
    <div class="well">
        <ul class="nav nav-list">
            <li class="nav-header">${entityName}</li>
            <li class="<%= actionName == 'list' ? 'active' : '' %>">
                <g:link action="list">
                    <i class="icon-list"></i>
                    <g:message code="default.list.label" args="[entityName]"/>
                </g:link>
            </li>
            <li class="<%= actionName == 'create' ? 'active' : '' %>">
                <g:link action="create">
                    <i class="icon-plus"></i>
                    <g:message code="default.create.label" args="[entityName]"/>
                </g:link>
            </li>
            <li class="<%= actionName == 'upload' ? 'active' : '' %>">
                <g:link action="upload">
                    <i class="icon-upload"></i>
                    <g:message code="patients.upload.label"/>
                </g:link>
            </li>
        </ul>
    </div>
</div>
