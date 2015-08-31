<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="${assetPath(src: 'images/favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'images/apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'images/apple-touch-icon-retina.png')}">

    <g:layoutHead/>

    <style type="text/css" media="print">
    .dontprint {
        display: none;
    }
    </style>
</head>

<body>
<nav class="navbar navbar-fixed-top dontprint">
    <div class="navbar-inner">
        <div class="container-fluid">

            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <a class="brand" href="${createLink(uri: '/')}">Patient Visit Tracker</a>

            <div class="nav-collapse">
                <shiro:authenticated>

                    <ul class="nav">
                        <li<%=request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : ''%>>
                            <a href="${createLink(uri: '/')}">Home</a></li>
                        <li<%='patient' == controllerName ? ' class="active"' : ''%>>
                            <g:link controller="patient">Patients</g:link>
                        </li>
                        <li<%='patientVisit' == controllerName ? ' class="active"' : ''%>>
                            <g:link controller="patientVisit">Visits</g:link>
                        </li>
                        <li<%='report' == controllerName ? ' class="active"' : ''%>>
                            <g:link controller="report">Base Reports</g:link>
                        </li>
                        <li<%='visitReport' == controllerName ? ' class="active"' : ''%>>
                            <g:link controller="visitReport">Custom Reports</g:link>
                        </li>
                        <li<%='provider' == controllerName ? ' class="active"' : ''%>>
                            <g:link controller="provider">Provider</g:link>
                        </li>
                        <li<%='user' == controllerName ? ' class="active"' : ''%>>
                            <g:link controller="user">Users</g:link>
                        </li>
                    </ul>
                </shiro:authenticated>
                <shiro:notAuthenticated>
                    <g:form id="login" class="navbar-form pull-right" action="signIn" controller="auth">
                        <input class="span2" type="text" placeholder="Email" name="email">
                        <input class="span2" type="password" placeholder="Password" name="password">
                        <button type="submit" class="btn">Sign in</button>
                    </g:form>
                </shiro:notAuthenticated>
                <shiro:authenticated>
                    <g:form id="loginout" class="navbar-form pull-right" action="signOut" controller="auth">
                        <button type="submit" class="btn">Sign Out</button>
                    </g:form>
                </shiro:authenticated>
            </div>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <g:layoutBody/>
    <hr>
    <footer>
        <p>&copy; NSquard 2013</p>
    </footer>
</div>
</body>
</html>