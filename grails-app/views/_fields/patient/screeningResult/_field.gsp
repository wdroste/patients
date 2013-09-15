<div class="control-group">
    <label class="control-label" for="screeningResult">
        <g:message code="patient.screeningResults.label"/>
    </label>
    <div class="controls">
        <g:select
            name="screeningResult"
            required=""
            value="${bean.screeningResult}"
            noSelection="[null:'']"
            valueMessagePrefix="patient.screeningResults.select"
            from="${org.sacredheart.Patient.SCREENING_RESULTS}"/>
    </div>
</div>
