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

		<r:require modules="scaffolding"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>
		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					
					<a class="brand" href="${createLink(uri: '/')}">Patient Visit Tracker</a>

					<div class="nav-collapse">
						<ul class="nav">							
							<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
                                <a href="${createLink(uri: '/')}">Home</a></li>
                            <li<%= 'patient' == controllerName ? ' class="active"' : '' %>>
                                <g:link controller="patient">Patients</g:link>
                            </li>
                            <li<%= 'patientVisit' == controllerName ? ' class="active"' : '' %>>
                                <g:link controller="patientVisit">Visits</g:link>
                            </li>
                            <li<%= 'user' == controllerName ? ' class="active"' : '' %>>
                                <g:link controller="user">Users</g:link>
                            </li>
						</ul>
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
		<r:layoutResources/>
	</body>
</html>