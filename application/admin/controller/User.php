<?php

namespace app\admin\controller;

use app\admin\common\AdminController;
use think\Db;

class User extends AdminController {

    protected $beforeActionList = [
        'loginNeed'
    ];

    //用户列表页
    public function ulist() {
        $users = Db::name('user')->select();
        return view('list', [
            'users'  => $users
        ]);
    }

}
