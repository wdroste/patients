<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patient.label')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://intercoolerreleases-leaddynocom.netdna-ssl.com/intercooler-1.1.0.min.js"></script>
</head>

<body>
<div class="row-fluid">
    <g:render template="nav" />
    <div class="span9">
        <div class="row-fluid">
            <g:form method="get" action="list" class="form-inline">
                <input name="q" class="span5" type="text" placeholder="Search" value="${params.q}">
                <button type="submit" class="btn btn-primary"><i class="icon-search icon-white"></i></button>
            </g:form>
        </div>
        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>
        <table class="table table-striped">
            <thead>
            <tr>
                <g:sortableColumn property="patientId" title="${message(code: 'patient.patientId.label')}" params="${[q:params.q]}"/>
                <g:sortableColumn property="dateOfBirth" title="${message(code: 'patient.dateOfBirth.label')}"  params="${[q:params.q]}"/>
                <g:sortableColumn property="lastName" title="${message(code: 'patient.lastName.label')}" params="${[q:params.q]}"/>
                <g:sortableColumn property="firstName" title="${message(code: 'patient.firstName.label')}" params="${[q:params.q]}"/>
                <th></th>
            </tr>
            </thead>
            <tbody id="patients">
              <g:render template="patientTBody" bean="${patientInstanceList}"/>
            </tbody>
        </table>
        <center> <!-- lol -->
            <i class="fa fa-spinner fa-spin fa-5x" id="indicator" style="display: none"></i>
        </center>
    </div>
</div>
</body>
</html>