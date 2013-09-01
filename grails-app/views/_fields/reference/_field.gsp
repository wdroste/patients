<div class="control-group">
    <label class="control-label" for="${property}">
        <g:message code="patient.reference.label"/>
    </label>
    <div class="controls">
        <g:select name="${property}" value="${value}"
          valueMessagePrefix="patient.reference.select"
          from="${org.sacredheart.Reference.values()*.name()}"/>
    </div>
</div>
