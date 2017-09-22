<?php

namespace app\api\controller;

use app\api\common\ApiController;
use think\captcha\Captcha;
use think\Db;

class Index extends ApiController {

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

}
