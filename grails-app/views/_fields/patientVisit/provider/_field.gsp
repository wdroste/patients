<%@ page import="org.sacredheart.Provider" %>
<div class="control-group">
    <label class="control-label" for="provider.id">
        <g:message code="patientVisit.provider.label"/>
    </label>
    <div class="controls">
        <g:select
            required=""
            name="provider.id"
            optionKey="id" optionValue="title"
            from="${org.sacredheart.Provider.list()}"
            value="${bean.provider?.id ?: Provider.findByLicense('NA').id }"
        />
    </div>
</div>
