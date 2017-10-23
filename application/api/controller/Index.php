<?php

namespace app\api\controller;

use app\api\common\ApiController;
use think\captcha\Captcha;

class Index extends ApiController {
    protected $beforeActionList = [
        'loginNeed' => ['except' => 'doLogin']
    ];
    //登录页面
    public function doLogin() {
        $username = input('post.username');
        $pwd = input('post.pwd');
        $yzm = input('post.yzm');
        if (!$username || !$pwd || !$yzm) {
            return $this->resMes(300);
        }
        //验证码验证
        $captcha = new Captcha();
        $check = $captcha->check($yzm);
        if (!$check) {
            return $this->resMes(402);
        }
        //账号密码验证
        $code = \think\Loader::model('User', 'service')->login($username, $pwd);
        return $this->resMes($code);
    }
    
    //退出登录
    public function doLogout(){
        session(null);
        return $this->resMes(200);
    }
    
    //单个文件上传处理
    public function doUpload() {
        $type = input('post.type');
        if(!$type){
            return $this->resMes(444, '上传目录必须设置');
        }
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');
        // 移动到框架应用根目录/public/uploads/ 目录下 ,上传文件不能超过4M
        $info = $file->validate(['size' => 4 * 1024 * 1024, 'ext' => 'jpg,png,gif,bmp,jpeg'])->move(ROOT_PATH . 'public' . DS . 'uploads' . DS . $type);
        if ($info) {
            //配合layui上传插件，返回固定格式的数据
            $uploadInfo = ['src' => DS . 'uploads' . DS . $type . DS . $info->getSaveName()];
            return $this->resData($uploadInfo);
        } else {
            // 上传失败获取错误信息
            return $this->resMes(444, $file->getError());
        }
    }
    
    //修改品牌理念
    public function doSaveConcept() {
        $content = input('post.content');
        if (!trim($content)) {
            return $this->resMes(300);
        }
        $res = db('concept')->where('id', 1)->update(['content' => $content]);
        return $res !== false ? $this->resMes(200) : $this->resMes(400);
    }
    
    //修改首页背景图片
    public function doSaveBgImg() {
        $bg_image = input('post.bg_image');
        if (!trim($bg_image)) {
            return $this->resMes(300);
        }
        $res = db('bgImg')->where('id', 1)->update(['bg_image' => $bg_image]);
        return $res !== false ? $this->resMes(200) : $this->resMes(400);
    }

}
