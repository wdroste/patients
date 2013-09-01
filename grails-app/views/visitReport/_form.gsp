<%@ page import="org.sacredheart.report.VisitReport" %>
<%@ page import="org.sacredheart.Patient" %>


<f:field bean="visitReportInstance" property="name" required=""/>
<f:field bean="visitReportInstance" property="description"/>

<div class="control-group ">
    <label class="control-label" for="zipCodes">ZIP Codes</label>

    <div class="controls">
        <g:select name="zipCodes"
                  from="${zipcodes}"
                  value="${visitReportInstance.zipCodes}"
                  multiple="true"/>
    </div>
</div>

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
    <label class="control-label" for="visitType">
        <g:message code="patientVisit.visitType.label"/>
    </label>

    <div class="controls">
        <g:select name="visitType"
                  multiple="true"
                  noSelection="[null: '-- Any Type --']"
                  value="${visitReportInstance.visitTypes}"
                  valueMessagePrefix="patientVisit.visitType.select"
                  from="${org.sacredheart.VisitType.values()*.name()}"/>
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

<div class="control-group">
    <label class="control-label" for="gender">
        <g:message code="patient.gender.label"/>
    </label>
    <div class="controls">
        <g:select name="gender" value="${fieldValue}"
                  noSelection="['':'']" valueMessagePrefix="patient.gender.select"
                  from="${org.sacredheart.Gender.values()*.name()}"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="races">
        <g:message code="patient.race.label"/>
    </label>

    <div class="controls">
        <g:select name="races"
                  multiple="true"
                  noSelection="[null: '-- Any Selection --']"
                  value="${visitReportInstance.races}"
                  valueMessagePrefix="patient.race.select"
                  from="${org.sacredheart.Race.values()*.name()}"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="languages">
        <g:message code="patient.language.label"/>
    </label>

    <div class="controls">
        <g:select name="languages"
                  multiple="true"
                  noSelection="[null: '-- Any Selection --']"
                  value="${visitReportInstance.languages}"
                  valueMessagePrefix="patient.language.select"
                  from="${org.sacredheart.Language.values()*.name()}"/>
    </div>
</div>

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
                  noSelection="[null: '-- Any Selection --']"
                  value="${visitReportInstance.educations}"
                  valueMessagePrefix="patient.education.select"
                  from="${org.sacredheart.Education.values()*.name()}"/>
    </div>
</div>
<div class="control-group">
    <label class="control-label" for="maritalStatuses">
        <g:message code="patient.maritalStatus.label"/>
    </label>

    <div class="controls">
        <g:select name="maritalStatuses"
                  multiple="true"
                  noSelection="[null: '-- Any Selection --']"
                  value="${visitReportInstance.maritalStatuses}"
                  valueMessagePrefix="patient.maritalStatus.select"
                  from="${org.sacredheart.MaritalStatus.values()*.name()}"/>
    </div>
</div>

<r:script>
    $('#zipCodes').bootstrapDualListbox({
        nonselectedlistlabel: 'Non-selected',
        selectedlistlabel: 'Selected',
        preserveselectiononmove: 'moved',
        moveonselect: true
    });
</r:script>

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


