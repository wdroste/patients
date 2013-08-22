<div class="control-group">
    <label class="control-label" for="gender"><g:message code="patient.gender.label"/></label>
    <div class="controls">
        <g:select name="gender" required="" value="${patientInstance.gender}"
          valueMessagePrefix="patient.gender.select" from="${org.sacredheart.Gender.values()*.name()}"/>
    </div>
</div>
