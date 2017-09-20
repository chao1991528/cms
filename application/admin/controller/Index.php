<?php
namespace app\admin\controller;
use app\admin\common\AdminController;
use think\captcha\Captcha;
class Index extends AdminController
{
    //登录页面
    public function login()
    {
        return view('login');
    }
    
    /**
     * 根据$page的不同生成要求的验证码
     * @param string $page 页面
     * @return img
     */
    public function verify($page='login'){
        switch ($page) {
            case 'login':
                $config = [
                    // 验证码字体大小
                    'fontSize'    =>    30,    
                    // 验证码位数
                    'length'      =>    4,   
                    // 关闭验证码杂点
                    'useNoise'    =>    false,
                    //是否画混淆曲线
                    'useCurve'    => false,
                    //验证码字符集合
                    'codeSet'    => '0123456789',
                    //验证码字体
                    'fontttf'  => '5.ttf',
                    //背景色
                    'bg' => [104, 183, 26]
                ];
                break;
            default:
                break;
        }            
        $captcha = new Captcha($config);
        return $captcha->entry();
    }
    
}
