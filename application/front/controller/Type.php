<?php

namespace app\admin\controller;

use app\admin\common\FrontController;

/**
 * 产品类型类
 */
class Type extends FrontController {

    protected $beforeActionList = [
        'loginNeed'
    ];

    //产品类型列表页
    public function tlist() {
        $setView = [
            'css' => ['style', 'bootstrap.min', 'dataTables.bootstrap'],
            'js'  => ['jquery.dataTables.min','dataTables.bootstrap','tlist']
        ];
        $this->set_view($setView);
        return view('tlist');        
    }

}
