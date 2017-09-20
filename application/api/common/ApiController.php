<?php

namespace app\api\common;
use think\Config;
use think\Controller;

class ApiController extends Controller {

    protected function _initialize() {
        parent::_initialize();
    }

    protected function loginNeed() {
        if (!is_logined()) {
            Config::get('return_code.301');
            exit();
        }
    }

    /**
     * 
     * @param int $code 状态码
     * @param array $message  提示信息
     * @return json
     */
    protected function resMes($code, $message = []) {
        if (empty($message)) {
            $message = Config::get('return_code.' . $code);
        }
        return json(['code' => $code, 'message' => $message]);
    }

    /**
     * 返回数据
     * @param array $data 返回的数据
     * @param string $message 数据返回的提示信息
     * @return json
     */
    protected function resData($data, $message = '') {
        if (empty($data)) {
            return $this->resMes(201);
        }
        if (empty($message)) {
            $message = Config::get('return_code.200');
        }
        return json(['code' => 200, 'data' => $data, 'message' => $message]);
    }

}
