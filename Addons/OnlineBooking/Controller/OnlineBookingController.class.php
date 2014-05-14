<?php

namespace Addons\OnlineBooking\Controller;
use Home\Controller\AddonsController;

class OnlineBookingController extends AddonsController{

	public function __construct() {
		parent::__construct ();
	}

	public function index()
	{
		$config = getAddonConfig ( 'OnlineBooking' ); // 获取后台插件的配置参数	
		$this->assign("config",$config);
		$this->display();
	}

	public function save()
	{
		$OnlineBooking = M('OnlineBooking');

		$data['info'] = $_POST['info'];
		$data['type'] = $_POST['type'];	
		$data['timepart'] = $_POST['timepart'];	
		$data['dateline'] = $_POST['dateline'];	
		$data['tel'] = $_POST['tel'];	
		$data['truename'] = $_POST['truename'];
		$data['token'] = get_token();
		$data['openid'] = get_openid();

		$body  = '姓名：'.$data['truename'];
		$body .= '联系电话：'.$data['tel'];
		$body .= '预约时间：'.$data['timepart'];
		$body .= '预约日期：'.$data['timepart'];
		$body .= '服务项目：'.$data['type'];
		$body .= '备注'.$data['info'];
		
		if(empty($data['truename']) || empty($data['tel'] )){
			$this->error("手机号与姓名必填!");		
		}
		
		// if($data['token'] == -1 || $data['openid'] == -1){
		// 	$this->error("参数错误，请重新尝试!");		
		// }

		$OnlineBooking->create($data);
		$result = $OnlineBooking->add();
		
		$config = getAddonConfig ( 'OnlineBooking' ); // 获取后台插件的配置参数
		if($result > 0){

			switch ($config['remindway']) {
				case '1':				
					$result = $this->sendSMS();
					break;
				case '4':
					$result = $this->sendMail();
					break;
				default:
					break;
			}
			if($result){
				$this->success("提交成功，请等候客服联系您!");
			}else{
				$this->error("提交失败!".$result);
			}
		}else{
			$this->error("提交失败!");
		}
	}

	/*
	** 发送邮件
	***/
	function sendMail(){		
		$body = '';
		$result = think_send_mail('hebiduhebi@163.com','预约','预约',$body);
		
		return $result;
		// $this->show($result);
	}
	/***/
	function sendSMS(){
		return true;
	}
}
