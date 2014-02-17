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
    <r:script>

        // Load the Visualization API and the piechart package.
        google.load('visualization', '1.0', {'packages':['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.setOnLoadCallback(drawCharts);

        function drawCharts() {
            genderChart();
            citizenChart();
            raceChart();
            languageChart();
        }

        function raceChart() {
            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Race');
            data.addColumn('number', '#');
            data.addRows([
                ['Black',    ${Patient.countByRace('Black')}],
                ['White',    ${Patient.countByRace('White')}],
                ['Hispanic', ${Patient.countByRace('Hispanic')}],
                ['Asian',    ${Patient.countByRace('Asian')}],
                ['Other',    ${Patient.countByRace('Other')}]
            ]);

            // Set chart options
            var options = {'title':'Population Race',
                'width':400,
                'height':300};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('race_chart'));
            chart.draw(data, options);
        }


        function citizenChart() {
            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'US Citizen');
            data.addColumn('number', '#');
            data.addRows([
                ['Yes', ${Patient.countByCitizen(YesNo.Yes)}],
                ['No', ${Patient.countByCitizen(YesNo.No)}]
            ]);

            // Set chart options
            var options = {'title':'Population Citizenship',
                'width':400,
                'height':300};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('citizen_chart'));
            chart.draw(data, options);
        }

        function genderChart() {
            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Gender');
            data.addColumn('number', '#');
            data.addRows([
                ['Male', ${Patient.countByGender('Male')}],
                ['Female', ${Patient.countByGender('Female')}]
            ]);

            // Set chart options
            var options = {'title':'Population Gender',
                'width':400,
                'height':300};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('gender_chart'));
            chart.draw(data, options);
        }

        function languageChart() {
            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Language');
            data.addColumn('number', '#');
            data.addRows(${g.include(controller:'dashboard', action:'languageData')});

            // Set chart options
            var options = {'title':'Language', 'width':400, 'height':300};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('language_chart'));
            chart.draw(data, options);
        }
    </r:script>
</shiro:authenticated>

</body>
</html>
