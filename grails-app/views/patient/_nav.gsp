<div class="span3 hidden-print">
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
    <div class="well">
        <h4>Example Searches:</h4>
        <dl>
            <dt>dateCreated:[2015-12-01 TO 2015-12-30]</dt>
            <dd>All new patients in December 2015.</dd>

            <dt>firstName:Joe</dt>
            <dd>First name is equal to 'Joe'</dd>

            <dt>lastName:Smith</dt>
            <dd>Last name is equal to 'Smith'</dd>

            <dt>firstName:Jo*</dt>
            <dd>First name starts with 'Jo'</dd>
        </dl>
    </div>
</div>
