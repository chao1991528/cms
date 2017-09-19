<?php
namespace app\admin\controller;
use app\admin\common;

class Index extends common\AdminController
{
    public function login()
    {
        return view('login');
    }
}
