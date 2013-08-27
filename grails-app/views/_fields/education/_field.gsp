<div class="control-group">
    <label class="control-label" for="education"><g:message code="patient.education.label"/></label>
    <div class="controls">
        <g:select name="education" required="" value="${fieldValue}"
            noSelection="[null:'']" valueMessagePrefix="patient.education.select"
            from="${org.sacredheart.Education.values()*.name()}"/>
    </div>
</div>


