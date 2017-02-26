<g:if test="${last == true}">
  <g:set var="appendFrom"><g:createLink action="infiniteList" params="${params}"/></g:set>
  <tr ic-append-from="${appendFrom}" ic-trigger-on="scrolled-into-view" ic-target="#patients" ic-indicator="#indicator">
</g:if>
<g:else>
<tr>
</g:else>
    <td>
        <g:link action="show" id="${patientInstance.id}">
            <f:display bean="${patientInstance}" property="patientId"/>
        </g:link>
    </td>
    <td><f:display bean="${patientInstance}" property="dateOfBirth"/></td>
    <td><f:display bean="${patientInstance}" property="lastName"/></td>
    <td>
        <f:display bean="${patientInstance}" property="firstName"/>
    </td>
    <td class="nolink">
        <g:link action="visit" id="${patientInstance.id}" class="btn btn-small btn-primary">
            <i class="icon-plus icon-white"></i>
            <g:message code="patient.visit.label"/>
        </g:link>

        <g:link action="edit" id="${patientInstance.id}" class="btn btn-small">
            <i class="icon-edit"></i>
            <g:message code="default.action.edit.label"/>
        </g:link>
    </td>
</tr>