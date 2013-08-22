<%@ page import="org.sacredheart.PatientVisit" %>



<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'dateOfVisit', 'error')} required">
	<label for="dateOfVisit">
		<g:message code="patientVisit.dateOfVisit.label" default="Date Of Visit" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfVisit" precision="day"  value="${patientVisitInstance?.dateOfVisit}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'patientId', 'error')} ">
	<label for="patientId">
		<g:message code="patientVisit.patientId.label" default="Patient Id" />
		
	</label>
	<g:textField name="patientId" value="${patientVisitInstance?.patientId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'screeningResults', 'error')} ">
	<label for="screeningResults">
		<g:message code="patientVisit.screeningResults.label" default="Screening Results" />
		
	</label>
	<g:textField name="screeningResults" value="${patientVisitInstance?.screeningResults}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: patientVisitInstance, field: 'typeOfVisit', 'error')} ">
	<label for="typeOfVisit">
		<g:message code="patientVisit.typeOfVisit.label" default="Type Of Visit" />
		
	</label>
	<g:textField name="typeOfVisit" value="${patientVisitInstance?.typeOfVisit}"/>
</div>

