<div class="span3 hidden-print">
    <div class="well">
        <ul class="nav nav-list">
            <li class="nav-header">${entityName}</li>
            <li class="<%=actionName == 'list' ? 'active' : ''%>">
                <g:link action="list">
                    <i class="icon-list"></i>
                    <g:message code="default.list.label" args="[entityName]"/>
                </g:link>
            </li>
            <li class="<%=actionName == 'create' ? 'active' : ''%>">
                <g:link action="create">
                    <i class="icon-plus"></i>
                    <g:message code="default.create.label" args="[entityName]"/>
                </g:link>
            </li>
            <li class="<%=actionName == 'upload' ? 'active' : ''%>">
                <g:link action="upload">
                    <i class="icon-upload"></i>
                    <g:message code="patientVisit.upload.label"/>
                </g:link>
            </li>
        </ul>
    </div>
    <div class="well">
        <h4>Example Searches:</h4>
        <dl>
            <dt>dateOfVisit:[2015-12-01 TO 2015-12-20]</dt>
            <dd>All visits between these dates</dd>

            <dt>dateOfVisit:[2014-12-01 TO 2014-12-20] provider_lastName:Smith</dt>
            <dd>All visits between these dates for provider 'Smith'.</dd>

            <dt>patient_firstName:Joe</dt>
            <dd>All visits by patients with first name is equal to 'Joe'</dd>

            <dt>patient_lastName:Smith</dt>
            <dd>All visits by patients with last name is equal to 'Smith'</dd>

            <dt>patient_firstName:Jo*</dt>
            <dd>All visits by patients with first name starts with 'Jo'</dd>
        </dl>
    </div>
</div>
