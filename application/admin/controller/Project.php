<?php

namespace app\admin\controller;

use app\admin\common\AdminController;
use think\Db;

class Project extends AdminController {

    protected $beforeActionList = [
        'loginNeed'
    ];

    //项目列表页
    public function plist() {
        $setView = [
            'css' => ['style']
        ];
        $this->set_view($setView);
        
        $projects = Db::name('project')->select();
        return view('plist', [
            'projects'  => $projects
        ]);
    }

}
