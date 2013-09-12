<g:set var="screenResults" value="${bean.screenResults.collect {g.message(code:'patient.screenResults.select.' + it)}}"/>
<g:join delimiter=", " in="${screenResults}"/>
