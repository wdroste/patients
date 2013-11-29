<%@ page import="org.sacredheart.Provider" %>

<%--
<f:field property="license" bean="${providerInstance}"/>
<f:field property="license" bean="${providerInstance}"/>
<f:field property="license" bean="${providerInstance}"/>
<f:field property="license" bean="${providerInstance}"/>
<f:field property="license" bean="${providerInstance}"/>
--%>

<div class="control-group ">
    <label class="control-label" for="license">License #</label>
    <div class="controls">
        <g:field name="license" required=""/>
    </div>
</div>

<div class="control-group ">
    <label class="control-label" for="prefix">Prefix</label>
    <div class="controls">
        <g:field name="prefix" data-bind="value: prefix"/>
    </div>
</div>

<div class="control-group ">
    <label class="control-label" for="lastName">Last Name</label>
    <div class="controls">
        <g:field name="lastName" required="" data-bind="value: lastName"/>
    </div>
</div>

<div class="control-group ">
    <label class="control-label" for="firstName">First Name</label>
    <div class="controls">
        <g:field name="firstName" required="" data-bind="value: firstName"/>
    </div>
</div>

<div class="control-group ">
    <label class="control-label" for="middleName">Middle Name</label>
    <div class="controls">
        <g:field name="middleName" data-bind="value: middleName"/>
    </div>
</div>

<div class="control-group ">
    <label class="control-label" for="prefix">Suffix</label>
    <div class="controls">
        <g:field name="prefix" data-bind="value: suffix"/>
    </div>
</div>

<div class="control-group ">
    <label class="control-label" for="title">Display</label>
    <div class="controls">
        <g:field name="title" data-bind="value: title" readonly=""/>
    </div>
</div>

<r:script>
    function ProviderViewModel() {
        this.prefix = ko.observable("${providerInstance.prefix}");
        this.suffix = ko.observable("${providerInstance.suffix}");
        this.lastName = ko.observable("${providerInstance.lastName}");
        this.firstName = ko.observable("${providerInstance.firstName}");
        this.middleName = ko.observable("${providerInstance.middleName}");

        this.title = ko.computed(function() {
            var display = this.prefix() + " " + this.lastName() + ", " + this.firstName();
            if (this.middleName()) {
                display = display + " " + this.middleName();
            }
            if (this.suffix()) {
                display = display + " " + this.suffix();
            }
            return display;
        }, this);
    }
    ko.applyBindings(new ProviderViewModel());
</r:script>
