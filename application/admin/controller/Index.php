<?php
namespace app\admin\controller;
use app\admin\common\AdminController;
use think\captcha\Captcha;
class Index extends AdminController
{    
    //登录页面
    public function index()
    {
        if(is_logined()){
            $this->redirect('/plist.html');
        }
        return view('login');
    }
    
    /**
     * 根据$page的不同生成要求的验证码
     * @param string $page 页面
     * @return img
     */
    public function verify($page='index'){
        switch ($page) {
            case 'index':
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
     * 品牌理念
     */
    public function concept() {
        $setView = [
            'css' => ['style'],
            'js'  => ['concept']
        ];
        $this->set_view($setView);
        $content = db('concept')->where('id', 1)->value('content');
        return view('concept',['content'=>$content]);
    }
    
    /**
     * 首页背景图
     */
    public function bgImage() {
        $setView = [
            'css' => ['style'],
            'js'  => ['index_bg']
        ];
        $this->set_view($setView);
        $img = db('bgImg')->where('id', 1)->value('bg_image');
        return view('bgImage',['img'=>$img]);
    }
    
}
