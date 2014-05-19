<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Front\Controller;

/**
 * 后台首页控制器
 */
class IndexController extends FrontController {
	
	// 系统首页
	public function index() {

		$this->display ();
	}

	public function login(){
		
		if(IS_POST){
			$username = I('form.username');
			$pwd = I('form.pwd');
			var_dump($username);
			$this->show($username.$pwd);			
		}

		if(is_login() > 0){

			$this->redirect("index/index");

		}else{

			$this->display ();

		}

	}


}