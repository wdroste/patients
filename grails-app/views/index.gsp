<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <title>Patient Visit Tracker</title>
</head>

<body>

<g:if test="${flash.message}">
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>No authorized.</strong>${flash.message}
    </div>
</g:if>
</body>
</html>
