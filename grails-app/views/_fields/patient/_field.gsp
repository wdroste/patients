<div class="control-group ">
    <label class="control-label" for="patient">Patient</label>
    <div class="controls">
        <input type="text" id="patient" autocomplete="off" />
        <input type="hidden" name="patient.id" id="patient.id" value="" />
    </div>
</div>

<script>
    var patients = {};
    var patientLabels = [];

    $( "#patient" ).typeahead({
        source: function ( query, process ) {

            //the "process" argument is a callback, expecting an array of values (strings) to display

            //get the data to populate the typeahead (plus some)
            //from your api, wherever that may be
            var url = '<g:createLink action="search" controller="patient" />';
            $.get(url, { q: query }, function ( data ) {

                //reset these containers
                patients = {};
                patientLabels = [];

                //for each item returned, if the display name is already included
                //(e.g. multiple "John Smith" records) then add a unique value to the end
                //so that the user can tell them apart. Using underscore.js for a functional approach.
                _.each( data, function( item, ix, list ){
                    if ( _.contains( patients, item.label ) ){
                        item.label = item.label + ' #' + item.value;
                    }

                    //add the label to the display array
                    patientLabels.push( item.label );

                    //also store a mapping to get from label back to ID
                    patients[ item.label ] = item.value;
                });

                //return the display array
                process( patientLabels );
            });
        },
        updater: function (item) {
            //save the id value into the hidden field
            $( "#patient.id" ).val( patients[ item ] );

            //return the string you want to go into the textbox (e.g. name)
            return item;
        }
    });
 </script>
