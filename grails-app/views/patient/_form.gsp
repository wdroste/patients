<%@ page import="org.sacredheart.YesNo" %>
<%@ page import="org.sacredheart.Patient" %>

<f:with bean="patientInstance">
    <f:field property="patientId" autocomplete="off"/>
    <f:field property="ssn" autocomplete="off" default="XXX-XX-XXXX"/>
    <f:field property="lastName"/>
    <f:field property="firstName"/>
    <f:field property="screeningResult"/>
    <f:field property="gender"/>
    <f:field property="dateOfBirth"/>
    <f:field property="citizen" default="${YesNo.Yes}"/>
    <f:field property="veteran" default="${YesNo.No}"/>
    <f:field property="race"/>
    <f:field property="language"/>
    <f:field property="ethnicity"/>
    <f:field property="transportation"/>

    <div class="control-group">
        <label class="control-label" for="numberOfFamily">
            <g:message code="patient.numberOfFamily.label"/>
        </label>
        <div class="controls">
            <g:field type="number"
                     min="1"
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
                     name="yearlyFamilyIncome"
                     value="${patientInstance.yearlyFamilyIncome}"
                     data-bind="value: yearlyFamilyIncome"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="federalPoverty">
            <g:message code="patient.federalPoverty.label"/>
        </label>
        <div class="controls">
            <g:field type="number"
                     readonly=""
                     name="federalPoverty"
                     value="${patientInstance.federalPoverty}"
                     data-bind="value: federalPoverty"/>
        </div>
    </div>

    <f:field property="maritalStatus"/>
    <f:field property="education"/>
    <f:field property="reference"/>

    <fieldset>
        <legend>Contact Info</legend>
        <f:field property="streetAddress"/>
        <f:field property="city"/>
        <f:field property="state"/>
        <f:field property="zipcode"/>
        <f:field property="homePhoneNumber"/>
        <f:field property="mobilePhoneNumber"/>
        <f:field property="emailAddress"/>
    </fieldset>

    <fieldset>
        <legend>Next of Kin</legend>
        <f:field property="nextOfKinLastName"/>
        <f:field property="nextOfKinFirstName"/>
        <f:field property="nextOfKinRelationshipCode"/>
        <f:field property="nextOfKinPhoneNumber"/>
    </fieldset>

</f:with>

<r:script>
    function PatientViewModel() {
        this.numberOfFamily = ko.observable(${patientInstance.numberOfFamily});
        this.yearlyFamilyIncome = ko.observable(${patientInstance.yearlyFamilyIncome});

        this.federalPoverty = ko.computed(function() {
            var incomeIndex = 0;
            if (!isNaN(this.numberOfFamily())) {
                incomeIndex = this.numberOfFamily();
            }
            var incomeTable = [22980, 31020, 39060, 47100, 55140, 63180, 71220, 79260];
            var povertyIncome;
            if (incomeIndex > incomeTable.length) {
                povertyIncome = incomeTable[7] + ((incomeIndex - 8) * 8040);
            } else {
                povertyIncome = incomeTable[this.numberOfFamily() - 1];
            }
            var val = (this.yearlyFamilyIncome() * 200) / povertyIncome;
            return val.toFixed(0);
        }, this);
    }
    ko.applyBindings(new PatientViewModel());
</r:script>
