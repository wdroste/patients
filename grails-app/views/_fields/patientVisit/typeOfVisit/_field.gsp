<div class="control-group">
    <label class="control-label" for="${property}">
        <g:message code="patientVisit.visitType.label"/>
    </label>
    <div class="controls">
        <g:select
            required=""
            name="${property}"
            value="${value}"
            valueMessagePrefix="patientVisit.visitType.select"
            from="${org.sacredheart.PatientVisit.VISITTYPE}"/>
    </div>
</div>
