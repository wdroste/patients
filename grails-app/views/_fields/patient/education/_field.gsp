<div class="control-group">
    <label class="control-label" for="education">
        <g:message code="patient.education.label"/>
    </label>
    <div class="controls">
        <g:select
                required=""
                name="education"
                value="${value}"
                noSelection="[null:'']"
                valueMessagePrefix="patient.education.select"
                from="${org.sacredheart.Patient.EDUCATION}"/>
    </div>
</div>


