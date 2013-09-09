<div class="control-group">
    <label class="control-label" for="gender">
        <g:message code="patient.gender.label"/>
    </label>
    <div class="controls">
        <g:select
                required=""
                name="gender"
                value="${fieldValue}"
                noSelection="[null:'']"
                valueMessagePrefix="patient.gender.select"
                from="${org.sacredheart.Patient.GENDER}"/>
    </div>
</div>
