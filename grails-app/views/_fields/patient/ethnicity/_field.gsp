<div class="control-group">
    <label class="control-label" for="ethnicity">
        <g:message code="patient.ethnicity.label"/>
    </label>
    <div class="controls">
        <g:select
                required=""
                name="ethnicity"
                value="${value}"
                noSelection="[null:'']"
                valueMessagePrefix="patient.ethnicity"
                from="${org.sacredheart.YesNo}"/>
    </div>
</div>