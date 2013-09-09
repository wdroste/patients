<div class="control-group">
    <label class="control-label" for="language">
        <g:message code="patient.language.label"/>
    </label>
    <div class="controls">
        <g:select
                required=""
                name="language"
                value="${value}"
                noSelection="[null:'']"
                valueMessagePrefix="patient.language.select"
                from="${org.sacredheart.Patient.LANGUAGE}"/>
    </div>
</div>


