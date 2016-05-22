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
        <dl>
            <lh>Example Searches:</lh>
            <dt>*:*  -diagnosisCode:[* TO *]</dt>
            <dd>All visits without a diagnostic code</dd>

            <dt>dateOfVisit:[2015-12-01 TO 2015-12-20]</dt>
            <dd>All visits between these dates</dd>
        </dl>
    </div>
</div>
