<div class="control-group">
    <label class="control-label" for="languages">
        <g:message code="patient.language.label"/>
    </label>
    <div class="controls">
        <g:select name="languages"
                  multiple="true"
                  value="${visitReportInstance.languages}"
                  valueMessagePrefix="patient.language.select"
                  from="${org.sacredheart.Patient.LANGUAGE}"/>
    </div>
</div>
