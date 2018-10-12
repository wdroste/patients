<%@ page import="org.sacredheart.Patient" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'patient.label')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="nav" />

    <div class="span9">

        <div class="row-fluid">
            <g:form useToken="true" method="get" action="list" class="form-inline">
                <input name="q" data-bind="value: q" class="span5" type="text" placeholder="Search" required="">
                <button type="submit" class="btn btn-primary" data-bind="click: search">
                    <i class="icon-search icon-white"></i>
                </button>
            </g:form>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <div data-bind='simpleGrid: gridViewModel'> </div>
    </div>
</div>

<script type="text/html" id="ko_simpleGrid_grid">
    <table class="ko-grid table table-striped" data-provides="rowlink" cellspacing="0">
        <thead>
            <tr data-bind="foreach: columns">
                <th data-bind="text: headerText, click: $root.sortBy"></th>
            </tr>
        </thead>
        <tbody data-bind="foreach: itemsOnCurrentPage">
            <tr style="cursor:pointer;" data-bind="template: {name:$root.processRow, foreach: $parent.columns}, click: $root.linkFx" class="rowlink">
            </tr>
    </table>
</script>
<script type="text/html" id="ko_simpleGrid_td">
    <td data-bind="text: typeof rowText == 'function' ? rowText($parent) : $parent[rowText] "></td>
</script>
<script type="text/html" id="ko_simpleGrid_td_action">
    <td class="nolink">
        <button data-bind="clickAndStop: function() { visitLink($parent[rowText]) } " class="btn btn-small btn-primary">
            <i class="icon-plus icon-white"></i>
            <g:message code="patient.visit.label"/>
        </button>

        <button data-bind="clickAndStop: function() { editLink($parent[rowText]) } " class="btn btn-small">
            <i class="icon-edit"></i>
            <g:message code="default.action.edit.label"/>
        </button>
    </td>
</script>
<script type="text/html" id="ko_simpleGrid_pageLinks">
</script>
<script type="text/html" id="ko_simpleGrid_pageLinks2">
    <div class="ko-grid-pageLinks">
        <span>Page:</span>
        <a href="#" data-bind="text: $data + 1, click: function() { $root.currentPageIndex($data) }, css: { selected: $data == $root.currentPageIndex() }"></a>
</div>
</script>

<script>
    var PagedGridModel = function(q, items) {
        var self = this;
        self.q = ko.observable(q);
        self.max = ko.observable(100);
        self.offset = ko.observable(0);

        self.items = ko.observableArray(items);

        self.search = function() {
            $.getJSON("/rest/v1/patients",
                $.param({max:"100", offset:"0", q:self.q()}),
                function(data) {
                    self.items(data);
                });
            window.location.hash = "#" + self.q();
        };

        this.jumpToFirstPage = function() {
            this.gridViewModel.currentPageIndex(0);
        };

        var dateTransform = function(item) {
            var m = moment(item.dateOfBirth);
            return m.isValid() ?  m.calendar() : "";
        }

        self.toggle = true;

        this.gridViewModel = new ko.simpleGrid.viewModel({
            data: self.items,
            columns: [
                { headerText: "${message(code: 'patient.patientId.label')}", rowText: "patientId" },
                { headerText: "${message(code: 'patient.dateOfBirth.label')}", rowText: dateTransform },
                { headerText: "${message(code: 'patient.lastName.label')}", rowText: "lastName" },
                { headerText: "${message(code: 'patient.firstName.label')}", rowText: "firstName" },
                { headerText: "", rowText: "id",
                    editLink: function(id) {
                        window.location = "/patient/edit/" + id;
                    },
                    visitLink: function(id) {
                        window.location = "/patient/visit/" + id;
                    }
                }
            ],
            pageSize: 100,
            linkFx: function(item) {
                window.location = "/patient/show/" + item.id;
            },
            sortBy : function(column) {
                self.items.sort(function(o1, o2) {
                    var oo1 = self.toggle ? o1 : o2;
                    var oo2 = self.toggle ? o2 : o1;
                    var b = oo1[column.rowText];
                    var a = oo2[column.rowText];
                    return a>b ? -1 : a<b ? 1 : 0;
                });
                self.toggle = !self.toggle;
            },
            processRow : function(item, bindingContext) {
                return (item.rowText == "id") ? "ko_simpleGrid_td_action" : "ko_simpleGrid_td";
            }
        });
    };

    var query = "";
    if (window.location.hash != "" || window.location.hash != "#") {
        query = window.location.hash.substr(1);
        // initial data
        $.getJSON("/rest/v1/patients",
            $.param({max:"100", offset:"0", q:query}),
            function(data) {
                ko.applyBindings(new PagedGridModel(query, data));
            });
    } else {
        ko.applyBindings(new PagedGridModel(query, []));
    }
</script>

</body>
</html>
