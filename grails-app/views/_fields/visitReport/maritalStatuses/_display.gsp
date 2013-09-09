<g:set var="stats" value="${bean.maritalStatuses.collect {g.message(code:'patient.maritalStatus.select.' + it)}}"/>
<g:join delimiter=", " in="${stats}"/>
