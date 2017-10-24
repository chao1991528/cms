<?php

namespace app\admin\controller;

use app\admin\common\FrontController;

/**
 * 产品系列类
 */
class Xilie extends FrontController {

    protected $beforeActionList = [
        'loginNeed'
    ];

    //产品类型列表页
    public function xlist() {
        $setView = [
            'css' => ['style', 'bootstrap.min', 'dataTables.bootstrap'],
            'js'  => ['jquery.dataTables.min','dataTables.bootstrap','xlist']
        ];
        $this->set_view($setView);
        return view('xlist');        
    }

}
