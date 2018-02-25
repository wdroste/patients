<%@ page import="org.sacredheart.report.VisitReport" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="report.setup.label"/></title>

    <script src="https://cdn.jsdelivr.net/npm/tinygradient@0.3.1/tinygradient.min.js"></script>
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
    </div>
</div>

<div class="row-fluid">
    <div class="span3"></div>
    <div class="span9">
        <canvas id="myChart"></canvas>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/patternomaly@1.3.0/dist/patternomaly.min.js"></script>

<script>
var providers = ${providers}
var patientVisitCounts = ${patientVisitCounts}
var gradient = tinygradient('red', 'green', 'blue');
var ctx = document.getElementById("myChart").getContext('2d');

var backgroundColors = gradient.rgb(providers.length);
var myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        labels: providers,
        datasets: [{
            label: '# of Visits',
            data: patientVisitCounts,
            backgroundColor: backgroundColors
        }]
    }
});
</script>

</body>
</html>
