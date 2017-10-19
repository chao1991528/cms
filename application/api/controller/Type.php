<?php

namespace app\api\controller;

use app\api\common\ApiController;
use think\Db;

class Type extends ApiController {
//    protected $beforeActionList = [
//        'loginNeed'
//    ];

    //获取产品类型列表
    public function doTlist() {
        $data = Db::name('ProductType')->order('sort desc')->select();
        return $this->resData($data);
    }
    
    //删除产品类型
    public function doDelProType(){
        $ids = input('post.ids');
        if(!$ids){
            $this->resMes(300);
        }
        //如果该类型下还有产品，则不能删除
        $productNum = Db::name('Product')->where('type','in',$ids)->count();
        if($productNum>0){
            return $this->resMes(444, '类型下面还有产品，请先删除属于这些类型产品');
        }        
        $res = Db::name('ProductType')->where('id','in',$ids)->delete();
        //还有日志操作undo
        return $res?$this->resMes(200):$this->resMes(400);
    }
    
    //添加产品类型
    public function doAddProType(){
        //获取参数并验证
        $data = input('post.');
        $result = $this->validate($data,'ProductType.add');
        if(true !== $result){
            return $this->resMes('444', $result);
        }
        $productType = model('ProductType');
        $res = $productType->saveData($data);
        //还有日志操作undo
        return $res?$this->resMes(200):$this->resMes(400);
    }

}
