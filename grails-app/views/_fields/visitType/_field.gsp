<div class="control-group">
    <label class="control-label" for="${property}">
        <g:message code="patientVisit.visitType.label"/>
    </label>
    <div class="controls">
        <g:select name="${property}"
                  required=""
                  value="${value}"
                  valueMessagePrefix="patientVisit.visitType.select"
                  from="${org.sacredheart.VisitType.values()*.name()}"/>
    </div>
</div>
