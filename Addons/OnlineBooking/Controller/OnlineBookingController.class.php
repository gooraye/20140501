<?php

namespace Addons\OnlineBooking\Controller;
use Home\Controller\AddonsController;

class OnlineBookingController extends AddonsController{

	 public function __construct() {
	 	 parent::__construct ();

	 }
	public function index()
	{
		$config = getAddonConfig ( 'OnlineBooking' ); 


		// 获取后台插件的配置参数

		$this->assign("config",$config);
		$timepart = $config['timepart'];

		$map['id'] = intval($config['picture'],0);

		$picture = M('Picture')->where($map)->find();

		// 营业时间，只支持到小时
		$arrTime = explode("-",$timepart);

		// 特色项目
		$projects = $config['projecttype'];
		$projects = explode(",", $projects);

		 // var_dump($picture);
		 // var_dump($config);

		$this->assign("start",intval($arrTime[0]));
		$this->assign("end",intval($arrTime[1]));
		$this->assign("path",$picture['path']);
		$this->assign("projects",$projects);

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
		// $data['token'] = get_token();
		// $data['openid'] = get_openid();
		$br = '<br/>';
		$body  = '姓名：'.$data['truename'].$br;
		$body .= '联系电话：'.$data['tel'].$br;
		$body .= '预约日期：'.$data['dateline'].$br;
		$body .= '预约时间：'.$data['timepart'].$br;
		$body .= '特色项目：'.$data['type'].$br;
		$body .= '备注：'.$data['info'];
		
		if(empty($data['truename']) || empty($data['tel'] )){
			$this->error("手机号与姓名必填!");		
		}
		
		if($data['token'] != -1 &&  $data['openid'] != -1){
			// $this->error("参数错误，请重新尝试!");	
			$OnlineBooking->create($data);
			$result = $OnlineBooking->add();	
		}

		
		
		$config = getAddonConfig ( 'OnlineBooking' ); // 获取后台插件的配置参数
		// if($result > 0){
		// 	$this->error("提交失败!");		
		// }
		// $result = $this->sendMail($config['toaddress'],$body);
		// var_dump($config['remindway']);
		$noticeWay = 0;
		for ($i=0; $i < count($config['remindway']); $i++) { 
			$noticeWay += intval($config['remindway'][$i]);
		}

		// dump($noticeWay);
		// exit();
		 
		 //发送邮件
		if(($noticeWay & 4) == 4){
			$result[0] = $this->sendMail($config['toaddress'],$body);			
		}

		if(($noticeWay & 1) == 1){
			 $result[1] = $this->sendSMS($config['toaddress'],$body);
		}

		//发送微信
		if(($noticeWay & 2) == 2){
			$result[2] = $this->sendWeixin($config['toaddress'],$body);
		}

		if($result[0]  === true || $result[1]  === true || $result[2]  === true){
			$this->success("提交成功，请等候客服联系您!");
		}else{
			$this->error("提交失败!".$result);
		}
	
	}
	/*
	** 发送邮件
	***/
	function sendWeixin($toaddress,$body){
		
		 $result = true;
		 // think_send_mail($toaddress,'预约','预约提醒',$body);
		// M('')
		return $result;
	}
	/*
	** 发送邮件
	***/
	function sendMail($toaddress,$body){

		$toaddress = explode(",", $toaddress);

		for ($i=0; $i < count($toaddress); $i++) {
			
			$result = think_send_mail($toaddress,'预约','预约提醒',$body);

		}
		
		return $result;
	}
	/***/
	function sendSMS($toaddress,$body){
		return true;
	}


	/* 回复文本消息 */
	public function replyText($content) {
		$msg ['Content'] = $content;
		$this->_replyData ( $msg, 'text' );
	}

	/* 发送回复消息到微信平台 */
	private function _replyData($msg, $msgType) {
		// 记录日志
		$msg ['ToUserName'] = '';
		$msg ['FromUserName'] = '';
		$msg ['CreateTime'] = NOW_TIME;
		$msg ['MsgType'] = $msgType;	
		$xml = new \SimpleXMLElement ( '<xml></xml>' );
		$this->_data2xml ( $xml, $msg );
		$str = $xml->asXML ();
		
		// 记录日志
		addWeixinLog ( $str, '_replyData' );
		
		echo ( $str );
	}
	
	/* 组装xml数据 */
	public function _data2xml($xml, $data, $item = 'item') {
		foreach ( $data as $key => $value ) {
			
			is_numeric ( $key ) &&  ($key = $item);
			
			if (is_array ( $value ) || is_object ( $value )) {
				$child = $xml->addChild ( $key );
				$this->_data2xml ( $child, $value, $item );
			} else {
				if (is_numeric ( $value )) {
					$child = $xml->addChild ( $key, $value );
				} else {
					$child = $xml->addChild ( $key );
					$node = dom_import_simplexml ( $child );
					$node->appendChild ( $node->ownerDocument->createCDATASection ( $value ) );
				}
			}
		}
	}



}
