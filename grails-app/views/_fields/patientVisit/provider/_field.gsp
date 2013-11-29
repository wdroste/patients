<div class="control-group">
    <label class="control-label" for="provider.id">
        <g:message code="patientVisit.provider.label"/>
    </label>
    <div class="controls">
        <g:select
            required=""
            name="provider.id"
            noSelection="${['null':'Please select a provider...']}"
            value="${bean.provider?.id}"
            optionKey="id" optionValue="title"
            from="${org.sacredheart.Provider.list()}"/>
    </div>
</div>
