<%@ page import="org.apache.commons.lang.time.DateUtils; org.sacredheart.PatientVisit; org.sacredheart.YesNo; org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <title>Patient Visit Tracker</title>

    <style type="text/css">
    .jumbotron {
        margin: 80px 0;
        text-align: center;
    }

    .jumbotron h1 {
        font-size: 100px;
        line-height: 1;
    }

    .jumbotron .lead {
        font-size: 24px;
        line-height: 1.25;
    }

    .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
    }
    </style>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>

<body>
<g:if test="${flash.message}">
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>No authorized.</strong>${flash.message}
    </div>
</g:if>


<shiro:notAuthenticated>
    <ui:appHome/>
</shiro:notAuthenticated>

<shiro:authenticated>
    <div class="row-fluid">
        <div class="span6">
            <div id="gender_chart"></div>
        </div>
        <div class="span6">
            <div id="citizen_chart"></div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div id="race_chart"></div>
        </div>
        <div class="span6">
            <div id="language_chart"></div>
        </div>
    </div>
    <!--Load the AJAX API-->
    <script  type="text/javascript">
        // Load the Visualization API and the piechart package.
        google.load('visualization', '1.0', {'packages':['corechart']});
        // Set a callback to run when the Google Visualization API is loaded.
        google.setOnLoadCallback(function () {
            $( "#language_chart" ).load("dashboard/languageChart");
            $( "#citizen_chart" ).load("dashboard/citizenChart");
            $( "#gender_chart" ).load("dashboard/genderChart");
            $( "#race_chart" ).load("dashboard/raceChart");
        });
    </script>
</shiro:authenticated>

</body>
</html>
