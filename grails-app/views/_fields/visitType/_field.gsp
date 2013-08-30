<div class="control-group">
    <label class="control-label" for="visitType">
        <g:message code="patientVisit.visitType.label"/>
    </label>
    <div class="controls">
        <g:select name="visitType"
                  required=""
                  value="${fieldValue}"
                  valueMessagePrefix="patientVisit.visitType.select"
                  from="${org.sacredheart.VisitType.values()*.name()}"/>
    </div>
</div>
