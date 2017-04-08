<f:field bean="patientVisitInstance" property="dateOfVisit"/>
<f:field bean="patientVisitInstance" property="typeOfVisit" />
<f:field bean="patientVisitInstance" property="provider" />
<f:field bean="patientVisitInstance" property="diagnosisCode"/>

<script>
$(function() {
    $("#typeOfVisit").change(function () {
        var key = $("#typeOfVisit").val();

        var value = "";
        if ('FluShot' == key) {
            value = 'V04.81';
        } else if ('Lab' == key) {
            value = 'V72.62';
        } else if ('CancerScreening' == key) {
            value = 'V72.3';
        } else if ('DiabeticEducation' == key) {
            value = 'V623';
        } else if ('Counseling' == key) {
            value = 'Z71.9';
        } else if ('PhysicalTherapy' == key) {
            value = 'V57.1';
        }
        $("#diagnosisCode").val(value);
    }).change();
});
</script>
