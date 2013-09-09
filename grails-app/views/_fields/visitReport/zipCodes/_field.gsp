<div class="control-group ">
    <label class="control-label" for="zipCodes">
        <g:message code="visitReport.zipCodes.label"/>
    </label>

    <div class="controls">
        <g:select name="zipCodes"
                  multiple="true"
                  from="${zipcodes}"
                  value="${bean.zipCodes}"/>
    </div>
</div>