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
            'css' => ['style', 'bootstrap.min', 'dataTables.bootstrap'],
            'js'  => ['jquery.dataTables.min','dataTables.bootstrap','plist']
        ];
        $this->set_view($setView);
        return view('plist');        
    }

}
