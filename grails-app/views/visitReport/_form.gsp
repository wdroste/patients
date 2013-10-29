<%@ page import="org.sacredheart.Patient" %>
<%@ page import="org.sacredheart.report.VisitReport" %>


<f:field bean="visitReportInstance" property="name" required=""/>
<f:field bean="visitReportInstance" property="description"/>
<f:field bean="visitReportInstance" property="screeningResults"/>
<f:field bean="visitReportInstance" property="zipCodes"/>

<g:if test="${counties}">
    <div class="control-group ">
        <label class="control-label" for="counties">Counties</label>

        <div class="controls span4">
            <g:select name="counties"
                      from="${counties}"
                      value="${visitReportInstance.counties}"
                      multiple="true"/>
        </div>
    </div>
</g:if>


<div class="control-group">
    <label class="control-label" for="visitTypes">
        <g:message code="patientVisit.visitType.label"/>
    </label>

    <div class="controls">
        <g:select name="visitTypes"
                  multiple="true"
                  value="${visitReportInstance.visitTypes}"
                  valueMessagePrefix="patientVisit.visitType.select"
                  from="${org.sacredheart.PatientVisit.VISITTYPE}"/>
    </div>
</div>

<f:field bean="visitReportInstance" property="patientIdPattern"/>
<f:field bean="visitReportInstance" property="firstNamePattern"/>
<f:field bean="visitReportInstance" property="middleNamePattern"/>
<f:field bean="visitReportInstance" property="lastNamePattern"/>


<f:field bean="visitReportInstance" property="citizen"/>
<f:field bean="visitReportInstance" property="veteran"/>
<f:field bean="visitReportInstance" property="languages"/>
<f:field bean="visitReportInstance" property="genders"/>
<f:field bean="visitReportInstance" property="races"/>



<div class="control-group">
    <label class="control-label" for="educations">
        <g:message code="patient.education.label"/>
    </label>

    <div class="controls">
        <g:select name="educations"
                  multiple="true"
                  value="${visitReportInstance.educations}"
                  valueMessagePrefix="patient.education.select"
                  from="${org.sacredheart.Patient.EDUCATION}"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="maritalStatuses">
        <g:message code="patient.maritalStatus.label"/>
    </label>

    <div class="controls">
        <g:select name="maritalStatuses"
                  multiple="true"
                  value="${visitReportInstance.maritalStatuses}"
                  valueMessagePrefix="patient.maritalStatus.select"
                  from="${org.sacredheart.Patient.MARITIALSTATUS}"/>
    </div>
</div>

<fieldset class="embedded ageRange">
    <legend>Age Range</legend>
    <f:field bean="visitReportInstance" property="ageRange.start"/>
    <f:field bean="visitReportInstance" property="ageRange.end"/>
</fieldset>

<fieldset class="embedded numberOfFamilyRange">
    <legend>Family Size Range</legend>
    <f:field bean="visitReportInstance" property="numberOfFamilyRange.start"/>
    <f:field bean="visitReportInstance" property="numberOfFamilyRange.end"/>
</fieldset>

<fieldset class="embedded familyIncomeRange">
    <legend>Family Income Range</legend>
    <f:field bean="visitReportInstance" property="familyIncomeRange.start"/>
    <f:field bean="visitReportInstance" property="familyIncomeRange.end"/>
</fieldset>



<g:if test="${false}">
    <r:script>
        $('#zipCodes').bootstrapDualListbox({
            nonselectedlistlabel: 'Non-selected',
            selectedlistlabel: 'Selected',
            preserveselectiononmove: 'moved',
            moveonselect: true
        });
    </r:script>
</g:if>

<g:if test="${counties}">
    <r:script>
        $('#counties').bootstrapDualListbox({
            nonselectedlistlabel: 'Non-selected',
            selectedlistlabel: 'Selected',
            preserveselectiononmove: 'moved',
            moveonselect: true
        });
    </r:script>
</g:if>


<r:script>

</r:script>