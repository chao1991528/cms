<?php

namespace app\api\model;

use think\Model;
/**
 * 产品类型模型
 */
class ProductType extends Model
{
    protected $autoWriteTimestamp = 'datetime';
    
    //添加产品类型
    public function saveData($data){
        $this->data = $data;
        $rs = $this->save();
        if($rs){
            //日志操作,根据是否有主键确定是编辑还是增加
//            db('log')->insert(['operation'=>'good55']);
            return true;
        }
        return false;
    }    
}
