<g:set var="langs" value="${bean.languages.collect {g.message(code:'patient.language.select.' + it)}}"/>
<g:join delimiter=", " in="${langs}"/>
