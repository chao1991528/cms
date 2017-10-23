<?php

namespace app\api\controller;

use app\api\common\ApiController;

class Product extends ApiController {
    protected $beforeActionList = [
        'loginNeed'
    ];

    //获取产品列表
    public function doPlist() {
        $products = \app\api\model\Product::all(['status' => 1]);
        $data = [];
        foreach ($products as $k => $v){
            $xilie_ids = $v->productXilie()->column('xilie_id');
            $xilie_names = db('xilie')->where('id','in',$xilie_ids)->column('name');
            $data[$k]['id'] = $v->id;
            $data[$k]['name'] = $v->name;
            $data[$k]['logo'] = $v->logo;
            $data[$k]['type_name'] = $v->productType->name;
            $data[$k]['xilie_names'] = $xilie_names;
            $data[$k]['price_once'] = $v->price_once;
            $data[$k]['price_liaocheng'] = $v->price_all . '元/'. $v->all_need_ci . '次';
            $data[$k]['sort'] = $v->sort;
        }
        return $this->resData($data);
    }
    
    //删除产品
    public function doDelProduct() {
        $ids = input('post.ids');
        if (!$ids) {
            return $this->resMes(300);
        }
        $res1 = db('Product')->where('id', 'in', $ids)->delete();
        $res2 = db('productXilie')->where('product_id', 'in', $ids)->delete();
        //还有日志操作undo
        return $res1 && $res2 ? $this->resMes(200) : $this->resMes(400);
    }

    //添加产品
    public function doAddProduct() {
        //获取参数并验证
        $data = input('post.');
        $result = $this->validate($data, 'Product');
        if (true !== $result) {
            return $this->resMes('444', $result);
        }
        $xilie_arr = $data['xilie'];
        unset($data['xilie']);
        $Product = new \app\api\model\Product;
        $rs = $Product->saveData($data);
        if(!$rs){
            return $this->resMes(400);
        }
        $productXilie = [];
        foreach ($xilie_arr as $k => $v) {
            $productXilie[$k]['product_id'] = $Product->id;
            $productXilie[$k]['xilie_id'] = $v;
        }
        $res = model('ProductXilie')->saveAll($productXilie);
        //还有日志操作undo
        return $res ? $this->resMes(200) : $this->resMes(400);
    }

    //编辑产品
    public function doEditProduct(){
        //获取参数并验证
        $data = input('post.');
        $result = $this->validate($data,'Product.edit');
        if(true !== $result){
            return $this->resMes('444', $result);
        }
        $xilie_arr = $data['xilie'];
        unset($data['xilie']);
        $rs1 = model('Product')->saveData($data);
        if(!$rs1){
            return $this->resMes(400);
        }
        $productXilie = [];
        foreach ($xilie_arr as $k => $v) {
            $productXilie[$k]['product_id'] = $data['id'];
            $productXilie[$k]['xilie_id'] = $v;
        }
        $ProductXilie = model('ProductXilie');
        $rs2 = $ProductXilie::destroy(['product_id' => $data['id']]);
        $rs3 = $ProductXilie->saveAll($productXilie);
        return ($rs2 !== false) && $rs3 ? $this->resMes(200) : $this->resMes(400);
    }

    //根据id查看产品信息
    public function viewProduct(){
        $id = input('post.id');
        if(!$id){
            return $this->resMes(300);
        }
        $product = db('product')->where('id', $id)->find();
        $xielie_ids = db('productXilie')->where('product_id', $id)->column('xilie_id');
        $product['xilie_ids'] = $xielie_ids;
        return $this->resData($product);
    }
}
