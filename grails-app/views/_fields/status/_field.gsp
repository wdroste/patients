<div class="control-group">
    <label class="control-label" for="status"><g:message code="patient.status.label"/></label>
    <div class="controls">
        <g:select name="status" required="" value="${patientInstance.reference}"
          valueMessagePrefix="patient.status.select" from="${org.sacredheart.Status.values()*.name()}"/>
    </div>
</div>
