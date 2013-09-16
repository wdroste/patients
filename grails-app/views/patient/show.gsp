<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patient.label')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav"/>

    <div class="span9">
        <div class="page-header">
            <h1>${patientInstance.patientId}: ${patientInstance.fullName}</h1>
        </div>
        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>
        <div class="span6">

            <form class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="citizen">
                        <g:message code="patient.citizen.label"/>
                    </label>

                    <div class="controls">
                        <ui:yesno id="citizen" bean="${patientInstance}" property="citizen"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="veteran">
                        <g:message code="patient.veteran.label"/>
                    </label>

                    <div class="controls">
                        <ui:yesno id="veteran" bean="${patientInstance}" property="veteran"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="dateOfBirth">
                        <g:message code="patient.dateOfBirth.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="dateOfBirth" disabled=""
                               value="${f.display('bean': patientInstance, 'property': 'dateOfBirth')}"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="gender">
                        <g:message code="patient.gender.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="gender" disabled=""
                               value="${f.display('bean': patientInstance, 'property': 'gender')}"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="education">
                        <g:message code="patient.education.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="education" disabled=""
                               value="${f.display('bean': patientInstance, 'property': 'education')}"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="language">
                        <g:message code="patient.language.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="language" disabled=""
                               value="${f.display('bean': patientInstance, 'property': 'language')}"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="numberOfFamily">
                        <g:message code="patient.numberOfFamily.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="numberOfFamily" disabled=""
                               value="${f.display('bean': patientInstance, 'property': 'numberOfFamily')}"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="yearlyFamilyIncome">
                        <g:message code="patient.yearlyFamilyIncome.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="yearlyFamilyIncome" disabled=""
                               value="${f.display('bean': patientInstance, 'property': 'yearlyFamilyIncome')}"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="federalPoverty">
                        <g:message code="patient.federalPoverty.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="federalPoverty" disabled=""
                               value="${f.display('bean': patientInstance, 'property': 'federalPoverty')}%"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="race">
                        <g:message code="patient.race.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="race" disabled=""
                               value="${f.display('bean': patientInstance, 'property': 'race')}"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="screeningResult">
                        <g:message code="patient.screeningResults.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="screeningResult" disabled=""
                               value="${f.display('bean': patientInstance, 'property':'screeningResult')}"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="maritalStatus">
                        <g:message code="patient.maritalStatus.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="maritalStatus" disabled=""
                               value="${f.display('bean': patientInstance, 'property':'maritalStatus')}"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="zipcode">
                        <g:message code="patient.zipcode.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="zipcode" disabled=""
                               value="${f.display('bean': patientInstance, 'property':'zipcode')}"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="reference">
                        <g:message code="patient.reference.label"/>
                    </label>

                    <div class="controls">
                        <input type="text" id="reference" disabled=""
                               value="${f.display('bean': patientInstance, 'property':'reference')}"/>
                    </div>
                </div>
            </form>
        </div>

        <div class="span3">
            <table class="table table-condensed" data-provides="rowlink">
                <thead>
                <tr>
                    <th><g:message code="patientVisit.dateOfVisit.label"/></th>
                    <th><g:message code="patientVisit.typeOfVisit.label"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${patientInstance.visits}" var="patientVisitInstance">
                    <tr>
                        <td>
                            <g:link action="edit" controller="patientVisit" id="${patientVisitInstance.id}">
                                <g:formatDate type="date" style="MEDIUM" date="${patientVisitInstance.dateOfVisit}"/>
                            </g:link>
                        </td>
                        <td><f:display bean="${patientVisitInstance}" property="typeOfVisit"/></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
