<g:set var="chartId" value="${java.util.UUID.randomUUID().toString()}"/>
<div id="${chartId}"></div>
<script type="text/javascript">
    (function () {
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '${typeDisplay}');
        data.addColumn('number', '#');
        data.addRows(${data as grails.converters.JSON});

        // Set chart options
        var options = {'title': '${titleDisplay}', 'width': 400, 'height': 300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('${chartId}'));
        chart.draw(data, options);
    }());
</script>