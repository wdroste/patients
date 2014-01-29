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
                <g:message code="report.static.select.visitsByProviderReport"/>:
                <g:formatDate date="${startDate}" type="date" style="SHORT"/> -
                <g:formatDate date="${endDate}" type="date" style="SHORT"/>
            </h1>
        </div>
        <div class="span3">
            <table>
                <g:each in="${results}" var="result">
                    <tr>
                        <td><%= result.key  %></td>
                        <td><%= result.value %></td>
                    </tr>
                </g:each>
            </table>
        </div>
        <div class="span6">
            <div id="chart"></div>
        </div>
    </div>
</div>

<!--Load the AJAX API-->
<r:script>
    // Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {'packages':['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);

    function drawChart() {
        // Create the data table...
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Provider');
        data.addColumn('number', '#');
        <g:each in="${results}" var="result">
            data.addRow(['${result.key}', ${result.value}]);
        </g:each>
        // Set chart options
        var options = { 'title': 'By Provider', 'width':400, 'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart'));
        chart.draw(data, options);
    }
</r:script>
</body>
</html>
