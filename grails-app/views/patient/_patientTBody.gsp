
<g:if test="${it.size() >= 2}">
    <g:render template="patientRow" collection="${it.subList(0, it.size()-2)}" var="patientInstance"/>
</g:if>
<g:if test="${it.size() >= 1}">
    <g:set var="last" value="${it.get(it.size() - 1)}"/>
    <g:render template="patientRow" model="['patientInstance':last, 'last':params.max == it.size()]"/>
</g:if>
