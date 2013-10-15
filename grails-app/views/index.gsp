<%@ page import="org.apache.commons.lang.time.DateUtils; org.sacredheart.PatientVisit; org.sacredheart.YesNo; org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <title>Patient Visit Tracker</title>

    <style type="text/css">
        /* Main marketing message and sign up button */
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
    <%
        def c = PatientVisit.createCriteria()
        visits = c.count {
            ge('dateOfVisit', DateUtils.truncate(new Date(), Calendar.YEAR))
            not { inList('typeOfVisit', ['Cancelled', 'NoShow']) } 
        }
    %>
    <!-- Jumbotron -->
    <div class="jumbotron">
        <h1>Sacred Heart</h1>
        <h1>Community Clinic</h1>
        <p class="lead">SHCC is a FREE "Walk In" Clinic serving the uninsured and underinsured living in Round Rock,TX.
        Our Goal is to be God's hands and feet in our community by taking care of his children. SHCC is staffed by volunteers
        from the community. The clinic has served ${Patient.count()} patients, with over <%= visits %> visits year to date.</p>
        <a class="btn btn-large btn-success" href="http://www.sacredheartclinic.org/">More information</a>
    </div>
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
            <div id="veteran_chart"></div>
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
            veteranChart();
        }

        function veteranChart() {
            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Population of Veterans');
            data.addColumn('number', '#');
            data.addRows([
                ['Veteran', ${Patient.countByVeteran(YesNo.Yes)}],
                ['Civilian', ${Patient.countByVeteran(YesNo.No)}]
            ]);

            // Set chart options
            var options = {'title':'Population of Veterans',
                'width':400,
                'height':300};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('veteran_chart'));
            chart.draw(data, options);
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
    </r:script>
</shiro:authenticated>

</body>
</html>
