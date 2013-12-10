<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="report.setup.label"/></title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>

<body>
<div class="row-fluid">
    <g:render template="nav"/>
    <div class="span9">
        <div class="page-header">
            <h1>
                <g:message code="report.static.select.establishedReport"/>:
                <g:formatDate date="${startDate}" type="date" style="SHORT"/> -
                <g:formatDate date="${endDate}" type="date" style="SHORT"/>
            </h1>
            <table>
                <tr>
                    <td>Total Visits: ${estVisits + newVisits}</td>
                </tr>
                <tr>
                    <td>Total distinct patients: ${estPatients.size() + newPatients.size()}</td>
                </tr>
            </table>
        </div>
        <div class="span3">
            <table class="table">
                <tr>
                    <td>New Patients:</td>
                    <td>${newPatients.size()}</td>
                </tr>
                <tr>
                    <td>Established Patients:</td>
                    <td>${estPatients.size()}</td>
                </tr>
                <tr>
                    <td>New Patients Visits:</td>
                    <td>${newVisits}</td>
                </tr>
                <tr>
                    <td>Established Patients Visits:</td>
                    <td>${estVisits}</td>
                </tr>
            </table>
        </div>
        <div class="span6">
            <div id="chart"></div>
        </div>
    </div>
</div>
<g:render template="patientList" model="${[tableHeader:'New Patients', patients:newPatients]}"/>
<g:render template="patientList" model="${[tableHeader:'Established Patients', patients:estPatients]}"/>

<!--Load the AJAX API-->
<r:script>
    // Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {'packages':['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);

    function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Type', 'Established', 'New' ],
        ['Visits', ${estVisits}, ${newVisits}],
        ['Patients', ${estPatients.size()}, ${newPatients.size()}]
      ]);

      var options = { width: '100%', height: 200,
        legend: {
            position: 'top',
            maxLines: 3
        },
	    bar: {
	        groupWidth: '75%'
	    },
        isStacked: true
      };
    // Instantiate and draw our chart, passing in some options.
    var chart =  new google.visualization.BarChart(document.getElementById('chart'));
    chart.draw(data, options);
}
</r:script>
</body>
</html>
