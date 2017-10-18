<?php

namespace app\admin\controller;

use app\admin\common\AdminController;
use think\Db;

class Product extends AdminController {

    protected $beforeActionList = [
        'loginNeed'
    ];

    //项目列表页
    public function plist() {
        $setView = [
            'css' => ['style', 'jquery.dataTables'],
            'js'  => ['jquery.dataTables.min']
        ];
        $this->set_view($setView);
        return view('plist');        
    }

}
