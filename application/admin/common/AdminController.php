<?php

namespace app\admin\common;

use think\Controller;

class AdminController extends Controller {

    protected function _initialize() {
        parent::_initialize();
    }

    protected function loginNeed() {
        if (!is_logined()) {
            $this->redirect('/login.html');
        }
    }

//    public function _empty() {
//        echo 'ff';
//    }
}
