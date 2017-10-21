<?php

namespace app\api\model;

use think\Model;
/**
 * 产品模型
 */
class Product extends Model
{
    protected $autoWriteTimestamp = 'datetime';
    
    public function productXilie()
    {
        return $this->hasMany('ProductXilie', 'product_id');
    }
    
    public function productType()
    {
        return $this->belongsTo('ProductType', 'type');
    }
    
    /**
     * 获取是否存在相关关联记录
     * @param  object  系列
     * @return bool
     */
    public function getIsChecked(Xilie &$Xilie) {
        $product_id = (int) $this->id;
        $xilie_id = (int) $Xilie->id;

        //查询条件
        $map = ['product_id' => $product_id, 'xilie_id' => $xilie_id];

        $productXilie = ProductXilie::get($map);

        return empty($productXilie) ? false : true;
    }  
    
    //添加产品
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
