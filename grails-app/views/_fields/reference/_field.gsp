<div class="control-group">
    <label class="control-label" for="reference"><g:message code="patient.reference.label"/></label>
    <div class="controls">
        <g:select name="reference" required="" value="${patientInstance.reference}"
          valueMessagePrefix="patient.reference.select" from="${org.sacredheart.Reference.values()*.name()}"/>
    </div>
</div>
