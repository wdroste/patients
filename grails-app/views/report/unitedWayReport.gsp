<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title>
        <g:message code="report.setup.label"/>
    </title>
    <!-- Datatables Javascript/CSS -->

    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"/>
</head>

<body>
<div class="row-fluid">
    <div class="span3">
        <table id="zipcode" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>ZIP Code</th>
                <th>Count</th>
            </tr>
            </thead>
            <tbody>
                <g:each var="result" in="${zipCodeData}">
                    <tr>
                        <td>${result[0].encodeAsHTML()}</td>
                        <td>${result[1].encodeAsHTML()}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>

    <div class="span3">
        <table id="ageRange" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Age Range</th>
                <th>Count</th>
            </tr>
            </thead>
            <tbody>
                <g:each var="result" in="${ageRangeData}">
                    <tr>
                        <td>${result[0].encodeAsHTML()}</td>
                        <td>${result[1].encodeAsHTML()}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>

    <div class="span3">
        <table id="ethnicity" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Ethnicity</th>
                <th>Count</th>
            </tr>
            </thead>
            <tbody>
                <g:each var="result" in="${ethnicityData}">
                    <tr>
                        <td>${result[0].encodeAsHTML()}</td>
                        <td>${result[1].encodeAsHTML()}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>

    <div class="span3">
        <table id="gender" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Gender</th>
                <th>Count</th>
            </tr>
            </thead>
            <tbody>
                <g:each var="result" in="${genderData}">
                    <tr>
                        <td>${result[0].encodeAsHTML()}</td>
                        <td>${result[1].encodeAsHTML()}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>

<!--Load the AJAX API-->
<script>

$(document).ready(function() {  
  $('#ageRange').DataTable( {
    dom: 'Bfrtip',
    buttons: [ { extend: 'pdfHtml5' }, { extend: 'excel' } ],
    paging: false,
    ordering: false,
    searching: false
  });
  $('#gender').DataTable( {
    dom: 'Bfrtip',
    buttons: [ { extend: 'pdfHtml5' }, { extend: 'excel' } ],
    paging: false,
    ordering: false,
    searching: false
  });
  $('#zipcode').DataTable( {
    dom: 'Bfrtip',
    buttons: [ { extend: 'pdfHtml5' }, { extend: 'excel' } ],
    searching: false
  });
  $('#ethnicity').DataTable( {
    dom: 'Bfrtip',
    buttons: [ { extend: 'pdfHtml5' }, { extend: 'excel' } ],
    paging: false,
    searching: false
  });
});


</script>
</body>
</html>
