<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;

Route::get([
    'login' => 'admin/Index/login',
    'verify' => 'admin/Index/verify',
    'index' => 'admin/Index/index',
    'top' => 'admin/Index/top',
    'left' => 'admin/Index/left',
    'footer' => 'admin/Index/footer',
    'first' => 'admin/Index/first',
    'userlist' => 'admin/User/ulist',
]);

Route::post([
    'doLogin' => 'api/Index/doLogin',
    'doLogout' => 'api/Index/doLogout',
]);
