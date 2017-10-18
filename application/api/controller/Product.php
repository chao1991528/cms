<?php

namespace app\api\controller;

use app\api\common\ApiController;
use think\Db;

class Product extends ApiController {

    //获取项目列表
    public function doList() {
        $data = Db::name('user')->where('status',1)->select();
        return $this->resData($data);
    }

}
