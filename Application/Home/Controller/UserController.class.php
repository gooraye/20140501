<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

 namespace Home\Controller;
use User\Api\UserApi;

/**
 * 用户控制器
 * 包括用户中心，用户登陆及注册
 */
class UserController extends HomeController {

	/* 用户中心首页 */
	// public function index(){
		
	// }

	/* 注册页面 */
	public function register($username = '', $password = '', $repassword = '', $email = '', $verify = ''){
	        if(!C('USER_ALLOW_REGISTER')){
	            $this->error('注册已关闭');
	        }
		if(IS_POST){ //注册用户
			/* 检测验证码 */
			if(!check_verify($verify)){
				$this->error('验证码输入错误！');
			}

			/* 检测密码 */
			if($password != $repassword){
				$this->error('密码和重复密码不一致！');
			}		

			/* 调用注册接口注册用户 */
            		$User = new UserApi;
			$uid = $User->register($username, $password, $email);
			if(0 < $uid){ //注册成功
				//TODO: 发送验证邮件
				$this->success('注册成功！',U('login'));
			} else { //注册失败，显示错误信息
				$this->error($this->showRegError($uid));
			}

		} else { //显示注册表单
			$this->display();
		}
	}

	/* 登陆页面 */
	public function login($username = '', $password = '', $verify = ''){
		// $config	=	S('DB_CONFIG_DATA');
	 //    	if(!$config){
	 //    		$config	=	D('Config')->lists();
	 //    		S('DB_CONFIG_DATA',$config);
	 //    	}
	 //    	C($config); //添加配置

		// if(!IS_POST){
	 //               if(I('get.key','0')  != C('ADMIN_KEY')){
	 //                    $this->error("无访问权限！","/");
	 //               }
	 //          }
		
		if(IS_POST){ //登陆验证
			/* 检测验证码 */
			if(C('WEB_SITE_VERIFY') && !check_verify($verify)){
				$this->error('验证码输入错误！');
			}

			/* 调用UC登陆接口登陆 */
			$user = new UserApi;
			$uid = $user->login($username, $password);
			if(0 < $uid){ //UC登陆成功
				/* 登陆用户 */
				$Member = D('Member');
				if($Member->login($uid)){ // 登陆用户
					$url = Cookie ( '__forward__' );
					if ($url) {
						Cookie ( '__forward__', null );
					} else {
						$url = U ( 'Home/MemberPublic/lists' );
					}
					
					$this->success ( '登陆成功！', $url );
				} else {
					$this->error($Member->getError());
				}

			} else { //登陆失败
				switch($uid) {
					case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
					case -2: $error = '密码错误！'; break;
					default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
				}
				$this->error($error);
			}

		} else { //显示登陆表单
			$this->display("login_c");
		}
	}
	
	

	/* 退出登陆 */
	public function logout(){
		if(is_login()){
			D('Member')->logout();
			$this->success('退出成功！', U('User/login'));
		} else {
			$this->redirect('User/login');
		}
	}

	/* 验证码，用于登陆和注册 */
	public function verify(){
		$verify = new \Think\Verify();
		$verify->entry(1);
	}

	/**
	 * 获取用户注册错误信息
	 * @param  integer $code 错误编码
	 * @return string        错误信息
	 */
	private function showRegError($code = 0){
		switch ($code) {
			case -1:  $error = '用户名长度必须在16个字符以内！'; break;
			case -2:  $error = '用户名被禁止注册！'; break;
			case -3:  $error = '用户名被占用！'; break;
			case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
			case -5:  $error = '邮箱格式不正确！'; break;
			case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
			case -7:  $error = '邮箱被禁止注册！'; break;
			case -8:  $error = '邮箱被占用！'; break;
			case -9:  $error = '手机格式不正确！'; break;
			case -10: $error = '手机被禁止注册！'; break;
			case -11: $error = '手机号被占用！'; break;
			default:  $error = '未知错误';
		}
		return $error;
	}


    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function profile(){
	if ( !is_login() ) {
		$this->error( '您还没有登陆',U('User/login') );
	}
        if ( IS_POST ) {
            //获取参数
            $uid        =   is_login();
            $password   =   I('post.old');
            $repassword = I('post.repassword');
            $data['password'] = I('post.password');
            empty($password) && $this->error('请输入原密码');
            empty($data['password']) && $this->error('请输入新密码');
            empty($repassword) && $this->error('请输入确认密码');

            if($data['password'] !== $repassword){
                $this->error('您输入的新密码与确认密码不一致');
            }

            $Api = new UserApi();
            $res = $Api->updateInfo($uid, $password, $data);
            if($res['status']){
                $this->success('修改密码成功！');
            }else{
                $this->error($res['info']);
            }
        }else{
            $this->display();
        }
    }
}