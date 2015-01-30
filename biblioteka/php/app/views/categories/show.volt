<div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false">
    <!-- widget options:
    usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

    data-widget-colorbutton="false"
    data-widget-editbutton="false"
    data-widget-togglebutton="false"
    data-widget-deletebutton="false"
    data-widget-fullscreenbutton="false"
    data-widget-custombutton="false"
    data-widget-collapsed="true"
    data-widget-sortable="false"

    -->
    <header>
        <span class="widget-icon"> <i class="fa fa-table"></i> </span>
        <h2>Column Filters </h2>

    </header>

    <!-- widget div-->
    <div>

        <!-- widget edit box -->
        <div class="jarviswidget-editbox">
            <!-- This area used as dropdown edit box -->

        </div>
        <!-- end widget edit box -->

        <!-- widget content -->
        <div class="widget-body no-padding">

            <table id="datatable_fixed_column" class="table table-striped table-bordered" width="100%">

                <thead>
                <tr>
                    <th class="hasinput">

                    </th>
                    <th class="hasinput">
                        <input type="text" class="form-control" placeholder="Tytuł" />
                    </th>
                    <th class="hasinput">
                        <input type="text" class="form-control" placeholder="Autor" />
                    </th>
                    <th class="hasinput">
                        <input type="text" class="form-control" placeholder="Rok" />
                    </th>
                    <th class="hasinput">

                    </th>
                </tr>
                <tr>
                    <th data-class="expand">Id</th>
                    <th>Tytuł</th>
                    <th data-hide="phone">Autor</th>
                    <th data-hide="phone">Rok</th>
                    <th data-hide="phone,tablet">Opis</th>
                </tr>
                </thead>

                <tbody>

                </tbody>

            </table>

        </div>
        <!-- end widget content -->

    </div>
    <!-- end widget div -->

</div>
<!-- end widget -->




<!-- PAGE RELATED PLUGIN(S) -->
<script src="/js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="/js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="/js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="/js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="/js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<script type="text/javascript">

    // DO NOT REMOVE : GLOBAL FUNCTIONS!

    $(document).ready(function() {


        /* // DOM Position key index //

         l - Length changing (dropdown)
         f - Filtering input (search)
         t - The Table! (datatable)
         i - Information (records)
         p - Pagination (paging)
         r - pRocessing
         < and > - div elements
         <"#id" and > - div with an id
         <"class" and > - div with a class
         <"#id.class" and > - div with an id and class

         Also see: http://legacy.datatables.net/usage/features
         */

        /* BASIC ;*/
        var responsiveHelper_datatable_fixed_column = undefined;


        var breakpointDefinition = {
            tablet : 1024,
            phone : 480
        };



        /* COLUMN FILTER  */
        var dtbasic = $('#datatable_fixed_column').DataTable({
            //"bFilter": false,
            //"bInfo": false,
            //"bLengthChange": false
            //"bAutoWidth": false,
            //"bPaginate": false,
            //"bStateSave": true // saves sort state using localStorage
            "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6 hidden-xs'><'col-sm-6 col-xs-12 hidden-xs'<'toolbar'>>r>"+
            "t"+
            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
            "autoWidth" : true,
            "processing": true,
            "serverSide": true,
            "order": [[ 1, "asc" ]],
            "ajax": {
                {#"url": "invoices/get/{{ router.getParams()[0] }}/all",#}
                "url": "/categories/getBooks/{{ router.getParams()[0] }}",
                "type": "POST"
            },
            "columns": [
                { "data": "id", "orderable" : false, "sortable" : false },
                { "data": "title" },
                { "data": "author" },
                { "data": "year" },
                { "data": "description" , "orderable" : false, "sortable" : false }
            ],
            "preDrawCallback" : function() {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_datatable_fixed_column) {
                    responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#datatable_fixed_column'), breakpointDefinition);
                }
            },
            "rowCallback" : function(nRow) {
                responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
            },
            "drawCallback" : function(oSettings) {
                responsiveHelper_datatable_fixed_column.respond();
            }

        });


        $("#datatable_fixed_column thead tr th input").on("keyup", function(){
            dtbasic.columns( $(this).parent().index()+':visible' ).search( this.value ).draw();
        });



    });

</script>


