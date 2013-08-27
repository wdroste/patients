<div class="control-group">
    <label class="control-label" for="status"><g:message code="patient.maritalStatus.label"/></label>
    <div class="controls">
        <g:select name="status" required="" value="${fieldValue}"
          noSelection="[null:'']" valueMessagePrefix="patient.maritalStatus.select"
          from="${org.sacredheart.MaritalStatus.values()*.name()}"/>
    </div>
</div>
