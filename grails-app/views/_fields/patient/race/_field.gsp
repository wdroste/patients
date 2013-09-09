<div class="control-group">
    <label class="control-label" for="race">
        <g:message code="patient.race.label"/>
    </label>
    <div class="controls">
        <g:select name="race"
          required=""
          value="${fieldValue}"
          noSelection="[null:'']"
          valueMessagePrefix="patient.race.select"
          from="${org.sacredheart.Patient.RACE}"/>
    </div>
</div>
