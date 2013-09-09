<div class="control-group">
    <label class="control-label" for="genders">
        <g:message code="patient.gender.label"/>
    </label>
    <div class="controls">
        <g:select name="genders"
                  multiple="true"
                  value="${bean.genders}"
                  valueMessagePrefix="patient.gender.select"
                  from="${org.sacredheart.Patient.GENDER}"/>
    </div>
</div>