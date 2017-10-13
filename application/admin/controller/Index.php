<?php
namespace app\admin\controller;
use app\admin\common\AdminController;
use think\captcha\Captcha;
class Index extends AdminController
{
    protected $beforeActionList = [
//        'loginNeed'
        'loginNeed' => ['except' => 'login,verify'],
    ];
    
    //登录页面
    public function login()
    {
        if(is_logined()){
            $this->redirect('/index.html');
        }
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
    
    /**
     * 首页
     */
    public function index(){
        return view('index');
    }
    
    /**
     * 左侧菜单栏
     */
    public function left() {
        return view('left');
    }
    
    /**
     * 登录后第一个页面
     */
    public function first(){
        return view('first');
    }
    
    /**
     * 登录后首页头部页面
     */
    public function top(){
        return view('top');
    }
    
     /**
     * 登录后首页尾部页面
     */
    public function footer(){
        return view('footer');
    }
}
