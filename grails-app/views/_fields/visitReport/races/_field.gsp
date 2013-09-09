<div class="control-group">
    <label class="control-label" for="races">
        <g:message code="patient.race.label"/>
    </label>

    <div class="controls">
        <g:select name="races"
                  multiple="true"
                  value="${bean.races}"
                  valueMessagePrefix="patient.race.select"
                  from="${org.sacredheart.Patient.RACE}"/>
    </div>
</div>