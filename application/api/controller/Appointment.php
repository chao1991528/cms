<?php

namespace app\api\controller;

use app\api\common\ApiController;

class Appointment extends ApiController {
//    protected $beforeActionList = [
//        'loginNeed'
//    ];

    //获取预约列表
    public function doAlist() {
//        $data = db('appointment')->order('sort desc')->select();
        $data = \app\api\model\Appointment::all();
        foreach ($data as &$v){
            $v['store_name'] = $v['store_id'];
            unset($v['store_id']);
            $v['appoint_full_time'] = $v['appoint_date'] . ' ' . $v['appoint_time'];
            unset($v['appoint_date']);
            unset($v['appoint_time']);
            $v['product_name'] = $v['product_id'];
            unset($v['product_id']);
        }
        return $this->resData($data);
    }
    
    //删除产品类型
    public function doDelAppointment(){
        $ids = input('post.ids');
        if(!$ids){
            $this->resMes(300);
        }
        //如果该类型下还有产品，则不能删除
        $productNum = db('Product')->where('type','in',$ids)->count();
        if($productNum>0){
            return $this->resMes(444, '类型下面还有产品，请先删除属于这些类型产品');
        }        
        $res = db('appointment')->where('id','in',$ids)->delete();
        //还有日志操作undo
        return $res?$this->resMes(200):$this->resMes(400);
    }
    
    //添加产品类型
    public function doAddAppointment(){
        //获取参数并验证
        $data = input('post.');
        $result = $this->validate($data,'appointment.add');
        if(true !== $result){
            return $this->resMes('444', $result);
        }
        $productType = model('appointment');
        $res = $productType->saveData($data);
        //还有日志操作undo
        return $res?$this->resMes(200):$this->resMes(400);
    }
    
    //编辑产品类型
    public function doEditAppointment(){
        //获取参数并验证
        $data = input('post.');
        $result = $this->validate($data,'appointment');
        if(true !== $result){
            return $this->resMes('444', $result);
        }
        if(empty($data['logo'])){
            unset($data['logo']);
        }
        $productType = model('appointment');
        $res = $productType->saveData($data);
        return $res?$this->resMes(200):$this->resMes(400);
    }

    //根据id查看产品类型信息
    public function viewAppointment(){
        $id = input('post.id');
        if(!$id){
            return $this->resMes(300);
        }
        $productType = db('appointment')->where('id', $id)->find();
        return $this->resData($productType);
    }
}
