<%@ page import="org.sacredheart.User" %>

<f:field bean="userInstance" property="fullName" label="user.fullName.label"/>
<f:field bean="userInstance" property="email" label="user.email.label"/>


<div class="control-group">
    <label class="control-label" for="password"><g:message code="user.password.label"/></label>
    <div class="controls">
        <g:passwordField name="password" label="user.password.label"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="confirmPassword"><g:message code="user.confirmPassword.label"/></label>
    <div class="controls">
        <g:passwordField name="confirmPassword" label="user.confirmPassword.label"/>
    </div>
</div>
