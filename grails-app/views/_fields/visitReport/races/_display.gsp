<g:set var="races" value="${bean.races.collect {g.message(code:'patient.race.select.' + it)}}"/>
<g:join delimiter=", " in="${races}"/>
