$(document).ready(function () {
    $(".submitBtn").click(function(){
        var content = $.trim($('.textinput').val());
        if(content.length == 0){
            layer.msg('品牌理念内容不能为空！', {time: 1500});
            return;
        }
        var url = $('#conceptForm').attr('action');
        $.post(url, {content:content},function (data) {            
            if (data.code === 200) {
                layer.msg('品牌理念修改成功', {time: 2000});
            } else {
                layer.msg(data.message, {time: 1500});
            }
        });
    });
});