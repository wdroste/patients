<%@ page import="org.sacredheart.Provider" %>

<f:field property="license" bean="${providerInstance}"/>

<div class="control-group ">
    <label class="control-label" for="title">Title</label>
    <div class="controls">
        <input type="text" id="title" name="title" value="${providerInstance.title}" required="" placeholder="Dr. Bob Stone M.D."/>
        <span class="help-block">Please provide the full title.</span>
    </div>
</div>

<f:field property="lastName" bean="${providerInstance}"/>
<f:field property="firstName" bean="${providerInstance}"/>
<f:field property="middleName" bean="${providerInstance}"/>
