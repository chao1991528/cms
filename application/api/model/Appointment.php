<?php

namespace app\api\model;

use think\Model;
/**
 * 预约模型
 */
class Appointment extends Model
{
    protected $autoWriteTimestamp = 'datetime';
    
    public function getStatusAttr($value)
    {
        $status = [ 0=>'预约中',1=>'已使用',2=>'已过期'];
        return $status[$value];
    }
    
    public function getStoreIdAttr($value)
    {
        $store = [ 1=>'门店1',2=>'门店2'];
        return $store[$value];
    }
    
    //添加预约
    public function saveData($data){
        $this->data = $data;
        if(isset($data['id']) && !empty($data['id'])){
            $rs = $this->save($data, ['id'=> $data['id']]);
        }else{
            $rs = $this->save();
        }        
        if($rs){
            //日志操作,根据是否有主键确定是编辑还是增加
//            db('log')->insert(['operation'=>'good55']);
            return true;
        }
        return false;
    }   
    
}
