<%@ page import="org.sacredheart.Patient" %>

<f:field bean="patientInstance" property="patientId" autocomplete="off"/>
<f:field bean="patientInstance" property="lastName" required="true"/>
<f:field bean="patientInstance" property="firstName" required="true"/>
<f:field bean="patientInstance" property="screeningResult" required="true"/>
<f:field bean="patientInstance" property="gender" required="true"/>
<f:field bean="patientInstance" property="dateOfBirth" required="true"/>
<f:field bean="patientInstance" property="zipcode" required="true"/>
<f:field bean="patientInstance" property="citizen" required="true"/>
<f:field bean="patientInstance" property="veteran" required="true"/>
<f:field bean="patientInstance" property="race" required="true"/>
<f:field bean="patientInstance" property="language" required="true"/>

<div class="control-group">
    <label class="control-label" for="numberOfFamily">
        <g:message code="patient.numberOfFamily.label"/>
    </label>
    <div class="controls">
        <g:field type="number"
                 required="true"
                 name="numberOfFamily"
                 value="${patientInstance.numberOfFamily}"
                 data-bind="value: numberOfFamily"/>
    </div>
</div>
<div class="control-group">
    <label class="control-label" for="yearlyFamilyIncome">
        <g:message code="patient.yearlyFamilyIncome.label"/>
    </label>
    <div class="controls">
        <g:field type="number"
                 required="true"
                 readonly=""
                 name="yearlyFamilyIncome"
                 value="${patientInstance.yearlyFamilyIncome}"
                 data-bind="value: yearlyFamilyIncome"/>
    </div>
</div>

<f:field bean="patientInstance" property="maritalStatus" required="true"/>
<f:field bean="patientInstance" property="education" required="true"/>

<r:script>
    function PatientViewModel() {
        this.numberOfFamily = ko.observable();
        this.yearlyFamilyIncome = ko.computed(function() {
            var incomeIndex = this.numberOfFamily();
            var incomeTable = [22980, 31020, 39060, 47100, 55140, 63180, 71220, 79260];
            if (incomeIndex > incomeTable.length) {
                return incomeTable[7] + ((incomeIndex - 8) * 8040);
            }
            return incomeTable[this.numberOfFamily() - 1];
        }, this);
    }
    window.patientViewModel = new PatientViewModel(numberOfFamily:${patientInstance.numberOfFamily});
    ko.applyBindings(window.patientViewModel);
</r:script>
