//This is a javascript file with its top level require directives
//= require jquery
//= require_tree bootstrap
//= require bootstrap-duallistbox.js
//= require bootstrap-datepicker.js
//= require bootstrap-rowlink.min.js
//= require bootstrap-formhelpers.js
//= require bootstrap-popover.js
//= require picker.js
//= require picker.date.js
//= require knockout-3.0.0.debug.js
//= require moment-with-langs.js


if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });
    })(jQuery);
}

ko.bindingHandlers.clickAndStop = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel, context) {
        var handler = ko.utils.unwrapObservable(valueAccessor()),
            newValueAccessor = function () {
                return function (data, event) {
                    handler.call(viewModel, data, event);
                    event.cancelBubble = true;
                    if (event.stopPropagation) event.stopPropagation();
                };
            };

        ko.bindingHandlers.click.init(element, newValueAccessor, allBindingsAccessor, viewModel, context);
    }
};


function dataTable(id) {
    $(id).DataTable({
        dom: 'Bfrtip',
        buttons: ['excelHtml5', 'pdfHtml5']
    });
}