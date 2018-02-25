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
    <table id="report" class="display" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>ID</th>
            <th>Last Name</th>
            <th>First Name</th>
            <th>Date of Birth</th>
            <th>Date of Visit</th>
            <th>Code</th>
        </tr>
        </thead>
        <tbody>
            <g:each var="visit" in="${visits}">
                <tr>
                    <td>${visit['patientId'].encodeAsHTML()}</td>
                    <td>${visit['lastName'].encodeAsHTML()}</td>
                    <td>${visit['firstName'].encodeAsHTML()}</td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${visit['dateOfBirth']}"/></td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${visit['dateOfVisit']}"/></td>
                    <td>${visit['diagnosisCode'].encodeAsHTML()}</td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>

<!--Load the AJAX API-->
<script>

$(document).ready(function() {
  dataTable('#report');
});


</script>
</body>
</html>
