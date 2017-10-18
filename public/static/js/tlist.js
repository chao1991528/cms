$(document).ready(function () {
    $('#typeList').DataTable({
        "ajax": "/api/type/doTlist",
        "language": {
            url: '/api/type/localisation'
        },
        "order": [[ 1, "desc" ]],
        "columns": [
            {
                "data": "id", 
                "sClass": "text-center", 
                "render": function (data, type, full, meta) {
                    return '<input type="checkbox"  class="checkchild"  value="' + data + '" />';
                }, 
                "bSortable": false
            },
            {"data": "id", "sClass": "text-center"},
            {"data": "name", "sClass": "text-center"},
            {"data": "logo", "sClass": "text-center"},
            {"data": "sort", "sClass": "text-center"},
            {"data": "create_time", "sClass": "text-center"}
        ],
        "aoColumnDefs": [
            { "sWidth": "5%", "aTargets": [0] },
            {  
                "targets": 6,  
                "searchable": false,
                "sClass": "text-center",               
                "sWidth": '10%',
                "data":"id",
                "render": function(data, type, row) { // 返回自定义内容
                    return "<a href='javascript:;' data-id=" + data + "' >编辑</a>";
                }
            }
        ]  
    });        
           
});