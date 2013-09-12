<div class="control-group">
    <label class="control-label" for="status">
        <g:message code="patient.maritalStatus.label"/>
    </label>
    <div class="controls">
        <g:select
            name="maritalStatus"
            required=""
            noSelection="[null:'']"
            value="${bean.maritalStatus}"
            valueMessagePrefix="patient.maritalStatus.select"
            from="${org.sacredheart.Patient.MARITIALSTATUS}"/>
    </div>
</div>
