$(document).ready(function () {
    var upload = layui.upload;
    dTable = $('#typeList').DataTable({
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
    //普通图片上传
    var uploadInst = upload.render({
        elem: '#typeLogo',
        url: uploadUrl,
        size: 4*1024,
        before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#uploaded').attr('src', result); //图片链接（base64）
            });
        }, 
        done: function (res) {
            //如果上传失败
            if (res.code != 200) {
                return layer.msg('上传失败',{time: 1500});
            }
            //上传成功
            $(".forminfo input[name='logo']").val(res.data.src);
        }, 
        error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
                uploadInst.upload();
            });
        }
    });
    
    //添加页面点击添加按钮
    $('.submitBtn').click(function(){
        var name = $.trim($(".forminfo input[name='name']").val());
        var logo = $(".forminfo input[name='logo']").val();
        if (name.length == 0 ) {
            layer.msg('分类名称必填', {time: 1500});
            return;
        }
        if( logo.length == 0){
            layer.msg('没有上传分类图片', {time: 1500});
            return;
        }
        
        $.post($('#form').attr('action'), $('#form').serialize(),function (data) {
            alert(data);
//                if (data.code === 200) {
//                    dTable.rows('.selected').remove().draw(false);
//                    layer.msg('删除产品类型成功！', {time: 1500});
//                } else {
//                    layer.msg(data.message, {time: 1500, icon: 5});
//                }
            }
        );
    });
    
});