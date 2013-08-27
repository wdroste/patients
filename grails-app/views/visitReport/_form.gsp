<%@ page import="org.sacredheart.report.VisitReport" %>


<fieldset class="embedded"><legend><g:message code="visitReport.ageRange.label" default="Age Range" /></legend>
<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'ageRange.end', 'error')} required">
	<label for="ageRange.end">
		<g:message code="visitReport.ageRange.end.label" default="End" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="end" type="number" value="${ageRangeInstance.end}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'ageRange.id', 'error')} required">
	<label for="ageRange.id">
		<g:message code="visitReport.ageRange.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="id" type="number" value="${ageRangeInstance.id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'ageRange.start', 'error')} required">
	<label for="ageRange.start">
		<g:message code="visitReport.ageRange.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="start" type="number" value="${ageRangeInstance.start}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'ageRange.version', 'error')} required">
	<label for="ageRange.version">
		<g:message code="visitReport.ageRange.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="version" type="number" value="${ageRangeInstance.version}" required=""/>
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'citizen', 'error')} ">
	<label for="citizen">
		<g:message code="visitReport.citizen.label" default="Citizen" />
		
	</label>
	<g:checkBox name="citizen" value="${visitReportInstance?.citizen}" />
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'education', 'error')} required">
	<label for="education">
		<g:message code="visitReport.education.label" default="Education" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="education" from="${org.sacredheart.report.Education?.values()}" keys="${org.sacredheart.report.Education.values()*.name()}" required="" value="${visitReportInstance?.education?.name()}"/>
</div>
<fieldset class="embedded"><legend><g:message code="visitReport.familyIncomeRange.label" default="Family Income Range" /></legend>
<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'familyIncomeRange.end', 'error')} required">
	<label for="familyIncomeRange.end">
		<g:message code="visitReport.familyIncomeRange.end.label" default="End" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="end" type="number" value="${incomeRangeInstance.end}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'familyIncomeRange.id', 'error')} required">
	<label for="familyIncomeRange.id">
		<g:message code="visitReport.familyIncomeRange.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="id" type="number" value="${incomeRangeInstance.id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'familyIncomeRange.start', 'error')} required">
	<label for="familyIncomeRange.start">
		<g:message code="visitReport.familyIncomeRange.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="start" type="number" value="${incomeRangeInstance.start}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'familyIncomeRange.version', 'error')} required">
	<label for="familyIncomeRange.version">
		<g:message code="visitReport.familyIncomeRange.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="version" type="number" value="${incomeRangeInstance.version}" required=""/>
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'firstNamePattern', 'error')} ">
	<label for="firstNamePattern">
		<g:message code="visitReport.firstNamePattern.label" default="First Name Pattern" />
		
	</label>
	<g:textField name="firstNamePattern" value="${visitReportInstance?.firstNamePattern}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="visitReport.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${org.sacredheart.report.Gender?.values()}" keys="${org.sacredheart.report.Gender.values()*.name()}" required="" value="${visitReportInstance?.gender?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'language', 'error')} required">
	<label for="language">
		<g:message code="visitReport.language.label" default="Language" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="language" from="${org.sacredheart.report.Language?.values()}" keys="${org.sacredheart.report.Language.values()*.name()}" required="" value="${visitReportInstance?.language?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'lastNamePattern', 'error')} ">
	<label for="lastNamePattern">
		<g:message code="visitReport.lastNamePattern.label" default="Last Name Pattern" />
		
	</label>
	<g:textField name="lastNamePattern" value="${visitReportInstance?.lastNamePattern}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'maritalStatus', 'error')} required">
	<label for="maritalStatus">
		<g:message code="visitReport.maritalStatus.label" default="Marital Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="maritalStatus" from="${org.sacredheart.report.MaritalStatus?.values()}" keys="${org.sacredheart.report.MaritalStatus.values()*.name()}" required="" value="${visitReportInstance?.maritalStatus?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'middleNamePattern', 'error')} ">
	<label for="middleNamePattern">
		<g:message code="visitReport.middleNamePattern.label" default="Middle Name Pattern" />
		
	</label>
	<g:textField name="middleNamePattern" value="${visitReportInstance?.middleNamePattern}"/>
</div>
<fieldset class="embedded"><legend><g:message code="visitReport.numberOfFamilyRange.label" default="Number Of Family Range" /></legend>
<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'numberOfFamilyRange.end', 'error')} required">
	<label for="numberOfFamilyRange.end">
		<g:message code="visitReport.numberOfFamilyRange.end.label" default="End" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="end" type="number" value="${sizeRangeInstance.end}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'numberOfFamilyRange.id', 'error')} required">
	<label for="numberOfFamilyRange.id">
		<g:message code="visitReport.numberOfFamilyRange.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="id" type="number" value="${sizeRangeInstance.id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'numberOfFamilyRange.start', 'error')} required">
	<label for="numberOfFamilyRange.start">
		<g:message code="visitReport.numberOfFamilyRange.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="start" type="number" value="${sizeRangeInstance.start}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'numberOfFamilyRange.version', 'error')} required">
	<label for="numberOfFamilyRange.version">
		<g:message code="visitReport.numberOfFamilyRange.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="version" type="number" value="${sizeRangeInstance.version}" required=""/>
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'patientIdPattern', 'error')} ">
	<label for="patientIdPattern">
		<g:message code="visitReport.patientIdPattern.label" default="Patient Id Pattern" />
		
	</label>
	<g:textField name="patientIdPattern" value="${visitReportInstance?.patientIdPattern}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'race', 'error')} required">
	<label for="race">
		<g:message code="visitReport.race.label" default="Race" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="race" from="${org.sacredheart.report.Race?.values()}" keys="${org.sacredheart.report.Race.values()*.name()}" required="" value="${visitReportInstance?.race?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitReportInstance, field: 'veteran', 'error')} ">
	<label for="veteran">
		<g:message code="visitReport.veteran.label" default="Veteran" />
		
	</label>
	<g:checkBox name="veteran" value="${visitReportInstance?.veteran}" />
</div>

