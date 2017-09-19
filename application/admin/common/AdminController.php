<?php
namespace app\admin\common;
use think\Controller;
class AdminController extends Controller{
    protected function loginNeed(){
        if(!is_logined()){
            redirect('login');
        }
    }        
    
}
