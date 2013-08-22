<%@ page import="org.sacredheart.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'secret', 'error')} required">
	<label for="secret">
		<g:message code="user.secret.label" default="Secret" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="secret" required="" value="${userInstance?.secret}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fullName', 'error')} required">
	<label for="fullName">
		<g:message code="user.fullName.label" default="Full Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullName" required="" value="${userInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${userInstance?.email}"/>
</div>

