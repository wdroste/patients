<div class="row-fluid">
    <div class="offset3 span9">
        <h3>${tableHeader}</h3>
        <table class="table table-striped" data-provides="rowlink">
            <thead>
            <tr>
                <g:sortableColumn property="patientId" title="${message(code: 'patient.patientId.label')}"/>
                <g:sortableColumn property="dateOfBirth" title="${message(code: 'patient.dateOfBirth.label')}"/>
                <g:sortableColumn property="lastName" title="${message(code: 'patient.lastName.label')}"/>
                <g:sortableColumn property="firstName" title="${message(code: 'patient.firstName.label')}"/>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${patients}" var="patientInstance">
                <tr>
                    <td>
                        <g:link action="show" id="${patientInstance.id}">
                            <f:display bean="${patientInstance}" property="patientId"/>
                        </g:link>
                    </td>
                    <td><f:display bean="${patientInstance}" property="dateOfBirth"/></td>
                    <td><f:display bean="${patientInstance}" property="lastName"/></td>
                    <td><f:display bean="${patientInstance}" property="firstName"/></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
