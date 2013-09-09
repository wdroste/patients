<div class="control-group">
    <label class="control-label" for="screeningResults">
        <g:message code="patient.screeningResults.label"/>
    </label>
    <div class="controls">
        <g:select
            name="screeningResults"
            required=""
            value="${value}"
            noSelection="[null:'']"
            valueMessagePrefix="patient.screeningResults.select"
            from="${org.sacredheart.Patient.SCREENING_RESULTS}"/>
    </div>
</div>
