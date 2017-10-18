$(function () {
    $('#logout').click(function () {
        layer.confirm('确定退出登录吗？',
                {
                    btn: ['确定', '取消'] //按钮
                },
                function () {
                    $.post("/doLogout", function (data) {
                        if (data.code === 200) {
                            window.location.href = "/index.html";
                        }
                    }
                    );
                });
    });

    //顶部导航切换
    $(".nav li a").click(function () {
        $(".nav li a.selected").removeClass("selected");
        $(this).addClass("selected");
    });

    //导航切换
    $(".menuson .header").click(function () {
        var $parent = $(this).parent();
        $(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();

        $parent.addClass("active");
        if (!!$(this).next('.sub-menus').size()) {
            if ($parent.hasClass("open")) {
                $parent.removeClass("open").find('.sub-menus').hide();
            } else {
                $parent.addClass("open").find('.sub-menus').show();
            }


        }
    });

    // 三级菜单点击
    $('.sub-menus li').click(function (e) {
        $(".sub-menus li.active").removeClass("active");
        $(this).addClass("active");
    });

    $('.title').click(function () {
        var $ul = $(this).next('ul');
        $('dd').find('.menuson').slideUp();
        if ($ul.is(':visible')) {
            $(this).next('.menuson').slideUp();
        } else {
            $(this).next('.menuson').slideDown();
        }
    });
    //数据列表页全选和全不选
    $('.checkall').click(function () {
        if ($(this).is(':checked')) {
            $('body tr td input[type="checkbox"]').prop("checked", true);
        } else {
            $('body tr td input[type="checkbox"]').prop("checked", false);
        }
    });
    //如果有一行取消/选中，则取消/全选
    $('table').on('click', 'tbody tr input[type="checkbox"]', function () {
        if ($(this).is(':checked')) {
            var checkboxNum = $('body tr td input[type="checkbox"]').length;
            var checkedNum = 0;
            $('body tr td input[type="checkbox"]').each(function () {
                if ($(this).is(':checked')) {
                    checkedNum++;
                }
            });
            if (checkboxNum === checkedNum) {
                $('.checkall').prop('checked', true);
            }

        } else {
            $('.checkall').prop('checked', false);
        }
    });

    //数据列表页删除按钮
    $('.toolbar').children('li').eq(1).click(function () {
        var ids = '';
        $('body tr td input[type="checkbox"]').each(function () {
            if ($(this).is(':checked')) {
                ids += $(this).val()+',';
            }            
        });
        if (ids.length > 0) {
            ids = ids.substring(0, ids.length - 1);
            $.post(delUrl, { ids: ids },
                function(data){
                    alert("Data Loaded: " + data);
                }
            );
        } else {
            layer.open({
                title: '错误',
                icon:5,
                content: '没有选中删除项目！'
            });
        }        
    });
    
});