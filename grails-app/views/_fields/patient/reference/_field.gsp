<div class="control-group">
    <label class="control-label" for="reference">
        <g:message code="patient.reference.label"/>
    </label>
    <div class="controls">
        <g:select
                required=""
                name="reference"
                value="${value}"
                noSelection="[null:'']"
                valueMessagePrefix="patient.reference.select"
                from="${org.sacredheart.Patient.REFERENCE}"/>
    </div>
</div>


