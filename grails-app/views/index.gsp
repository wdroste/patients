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
</head>

<body>
<g:if test="${flash.message}">
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>No authorized.</strong>${flash.message}
    </div>
</g:if>

<!-- Jumbotron -->
<div class="jumbotron">
    <h1>Sacred Heart</h1>
    <h1>Community Clinic</h1>
    <p class="lead">SHCC is a FREE "Walk In" Clinic serving the uninsured and underinsured living in Round Rock,TX.
    Our Goal is to be God's hands and feet in our community by taking care of his children. SHCC is staffed by volunteers
    from the community.</p>
    <a class="btn btn-large btn-success" href="http://www.sacredheartclinic.org/">More information</a>
</div>
</body>
</html>
