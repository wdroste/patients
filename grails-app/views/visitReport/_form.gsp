<%@ page import="org.sacredheart.report.VisitReport" %>
<%@ page import="org.sacredheart.Patient" %>


<f:field bean="visitReportInstance" property="name"/>
<f:field bean="visitReportInstance" property="description"/>

<div class="control-group ">
    <label class="control-label" for="zipCodes">ZIP Codes</label>

    <div class="controls span4">
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
<f:field bean="visitReportInstance" property="gender"/>
<f:field bean="visitReportInstance" property="race"/>
<f:field bean="visitReportInstance" property="language"/>

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


<f:field bean="visitReportInstance" property="education"/>
<f:field bean="visitReportInstance" property="maritalStatus"/>

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


