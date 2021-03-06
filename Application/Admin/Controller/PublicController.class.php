<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class PublicController extends \Think\Controller {

    /* 空操作，用于输出404页面 */
    public function _empty(){
        $this->redirect('Index/index');
    }
    /**
     * 后台用户登陆
     * @author 丁丁 <346551990@qq.com>
     */
    public function login($username = null, $password = null, $verify = null){
    	/* 读取数据库中的配置 */
    	$config	=	S('DB_CONFIG_DATA');
    	if(!$config){
    		$config	=	D('Config')->lists();
    		S('DB_CONFIG_DATA',$config);
    	}
    	C($config); //添加配置
    	   
          // dump(C('ADMIN_KEY'));
            // dump(I('get.key','0'));
          // if(!IS_POST){
          //      if(I('get.key','0')  != C('ADMIN_KEY')){
          //           $this->error("无访问权限！","/");
          //      }
          // }
        if(IS_POST){
            /* 检测验证码 TODO: */
            if(C('WEB_SITE_VERIFY') && !check_verify($verify)){
                $this->error('验证码输入错误！');
            }

            /* 调用UC登陆接口登陆 */
            $User = new UserApi;
            $uid = $User->login($username, $password);
            if(0 < $uid){ //UC登陆成功
                /* 登陆用户 */
                $Member = D('Member');
                if($Member->login($uid)){ //登陆用户
                    //TODO:跳转到登陆前页面
                    $this->success('登陆成功！', U('Index/index'));
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
        } else {
            if(is_login()){
                $this->redirect('Index/index');
            }else{
                $this->display();
            }
        }
    }

    /* 退出登陆 */
    public function logout(){
        if(is_login()){
            D('Member')->logout();
            session('[destroy]');
            $this->success('退出成功！', U('login'));
        } else {
            $this->redirect('login');
        }
    }

    public function verify(){
        $verify = new \Think\Verify();
        $verify->entry(1);
    }

}
