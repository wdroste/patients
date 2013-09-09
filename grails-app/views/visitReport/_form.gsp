<%@ page import="org.sacredheart.Patient" %>
<%@ page import="org.sacredheart.report.VisitReport" %>


<f:field bean="visitReportInstance" property="name" required=""/>
<f:field bean="visitReportInstance" property="description"/>
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

<div class="control-group ">
    <label class="control-label" for="ageRange">Age Range</label>

    <div id="ageRange" class="controls">
        <input type="number" name="ageRange.start" value="" id="ageRange.start">
        <input type="number" name="ageRange.end" value="" id="ageRange.end">
    </div>
</div>

<f:field bean="visitReportInstance" property="citizen"/>
<f:field bean="visitReportInstance" property="veteran"/>
<f:field bean="visitReportInstance" property="languages"/>
<f:field bean="visitReportInstance" property="genders"/>
<f:field bean="visitReportInstance" property="races"/>






<div class="control-group ">
    <label class="control-label" for="numberOfFamilyRange">Number of Family</label>

    <div id="numberOfFamilyRange" class="controls">
        <input type="number" name="numberOfFamilyRange.start" value="" id="numberOfFamilyRange.start">
        <input type="number" name="numberOfFamilyRange.end" value="" id="numberOfFamilyRange.end">
    </div>
</div>

<div class="control-group ">
    <label class="control-label" for="familyIncomeRange">Family Income Range</label>

    <div id="familyIncomeRange" class="controls">
        <input type="number" name="familyIncomeRange.start" value="" id="familyIncomeRange.start">
        <input type="number" name="familyIncomeRange.end" value="" id="familyIncomeRange.end">
    </div>
</div>


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


