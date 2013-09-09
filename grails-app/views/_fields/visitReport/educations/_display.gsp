<g:set var="edus" value="${bean.educations.collect {g.message(code:'patient.education.select.' + it)}}"/>
<g:join delimiter=", " in="${edus}"/>
