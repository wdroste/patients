<%@ page import="org.sacredheart.PatientVisit" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patientVisit.label')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">

    <g:render template="nav"/>

    <div class="span9">

        <div class="page-header">
            <h1><g:message code="patient.addVisit.label" /></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <g:hasErrors bean="${patientVisitInstance}">
            <bootstrap:alert class="alert-error">
                <ul>
                    <g:eachError bean="${patientVisitInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </bootstrap:alert>
        </g:hasErrors>

        <fieldset>
            <g:form class="form-horizontal" action="addVisit" >
                <fieldset>
                    <f:field bean="${patientVisitInstance}" property="typeOfVisit"/>
                    <f:field bean="${patientVisitInstance}" property="dateOfVisit"/>

                    <div class="input-append date" id="dp3" data-date-format="mm/dd/yyyy">
                        <input class="span2" size="16" type="text" value="12/02/2013">
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>
                    <r:script>
                        $('#dp3').datepicker().on('changeDate', function(e){
                            var y = e.date.getFullYear(),
                                    _m = e.date.getMonth() + 1,
                                    m = (_m > 9 ? _m : '0'+_m),
                                    _d = e.date.getDate(),
                                    d = (_d > 9 ? _d : '0'+_d);
                            $(this).text(y + '-' + m + '-' + d);
                        });
                    </r:script>
                    
                    <g:field type="hidden" name="patient.id" value="${patientVisitInstance.patient.id}"/>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="icon-ok icon-white"></i>
                            <g:message code="default.button.create.label" />
                        </button>
                    </div>
                </fieldset>
            </g:form>
        </fieldset>

    </div>

</div>
</body>
</html>
