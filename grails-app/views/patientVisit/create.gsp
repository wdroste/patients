<%@ page import="grails.converters.JSON; org.sacredheart.Patient; org.sacredheart.PatientVisit" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patientVisit.label', default: 'PatientVisit')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav"/>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <g:hasErrors bean="${patientVisitInstance}">
            <bootstrap:alert class="alert-error">
                <ul>
                    <g:eachError bean="${patientVisitInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </bootstrap:alert>
        </g:hasErrors>

        <fieldset>
            <g:form class="form-horizontal" action="create">
                <fieldset>
                    <div class="control-group ">
                        <label class="control-label" for="search">
                            <g:message code="patient.patientId.label"/>
                        </label>
                        <div class="controls">
                            <input type="text" name="search" value="" required=""
                                   id="search" autocomplete="off" style="width: 400px;">
                        </div>
                    </div>
                    <g:hiddenField name="patient.id" value=""/>

                    <f:field bean="patientVisitInstance" property="dateOfVisit"/>
                    <f:field bean="patientVisitInstance" property="typeOfVisit"/>
                    <f:field bean="patientVisitInstance" property="provider"/>
                    <f:field bean="patientVisitInstance" property="diagnosisCode"/>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="icon-ok icon-white"></i>
                            <g:message code="default.button.create.label" default="Create"/>
                        </button>
                    </div>
                </fieldset>
            </g:form>
        </fieldset>

    </div>

</div>
<%
    def jsonData = Patient.list().collect { p ->
        // format the date of birth..
        def dt = g.formatDate(type:'date', style:'SHORT', date: p.dateOfBirth)
        ['id': p.id, 'patientId': "${p.patientId} | ${p.fullName} | ${dt}"]
    } as JSON
%>
<r:script>
    $('#search').typeahead({
        source: function (query, process) {
            patients = [];
            map = {};

            var data = ${jsonData};
            $.each(data, function (i, patient) {
                map[patient.patientId] = patient;
                patients.push(patient.patientId);
            });

            process(patients);
        },
        updater: function (item) {
            var id = map[item].id
            $('input[name="patient.id"]').attr('value',id);
            return item;
        },
        matcher: function (item) {
            if (item.toLowerCase().indexOf(this.query.trim().toLowerCase()) != -1) {
               return true;
            }
        },
        sorter: function (items) {
            return items.sort();
        },
        highlighter: function (item) {
            var regex = new RegExp( '(' + this.query + ')', 'gi' );
            return item.replace( regex, "<strong>$1</strong>" );
        }
    });
</r:script>
</body>
</html>
