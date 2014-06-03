<?php
// .-----------------------------------------------------------------------------------
// | 
// | 
// | Site: http://www.gooraye.net
// |-----------------------------------------------------------------------------------
// | Author: 贝贝 <hebiduhebi@163.com>
// | Copyright (c) 2012-2014, http://www.gooraye.net. All Rights Reserved.
// |-----------------------------------------------------------------------------------


/**
** 海岩短信接口
**/
class HaiyanSMS{

	//用户ID
	private $userid;
	//用户账户
	private $account ;
	//用户密码
	private $pwd;

	//查询结果
	private $result ;

	//最近一次操作是否失败 以及 错误信息
	private $failed = false;
	public $errmsg = '';

	//总数量
	public $sendtotal = 0;

	//剩余数量
	public $overage = 0;

	//构造函数
	function __construct($userid='', $account='', $pwd=''){
		$this->failed = false;
		if(empty($userid) || empty($account) || empty($pwd))
		{
			$config = C('HAIYAN_SMS');
			$this->userid = $config['userid'];
			$this->account = $config['account'];
			$this->pwd = $config['pwd'];
		}else{
			$this->userid = $userid;
			$this->account = $account;
			$this->pwd = $pwd;
		}
	}

	/*
	** 查询余额
	** 
	*/
	public function QueryBalance(){

		$post_data = array();
		$post_data['userid'] = $this->userid;
		$post_data['account'] = $this->account;
		$post_data['password'] = $this->pwd;
		$url='http://www.duanxin10086.com/sms.aspx?action=overage';
		// $o='';
		// foreach ($post_data as $k=>$v)
		// {
		//     $o.=urlencode("$k=".$v).'&';
		// }
		//$post_data=substr($o,0,-1);		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		//如果需要将结果直接返回到变量里，那加上这句。
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
		$this->result = curl_exec($ch);
		$this->GetLastResult();
		return $this->result;
	}

	/**
	* 发送短信
	* @content string 内容
	* @mobile string  收信人手机号码 多个以,隔开
	* 
	*/	
	public function SendSMS($content,$mobile){

		$post_data = array();
		$post_data['userid'] = $this->userid;
		$post_data['account'] = $this->account;
		$post_data['password'] = $this->pwd;
		$post_data['content'] = ($content); //短信内容需要用urlencode编码下
		$post_data['mobile'] = $mobile;
		$post_data['sendtime'] = ''; //不定时发送，值为0，定时发送，输入格式YYYYMMDDHHmmss的日期值
		//$post_data['taskName'] = $taskName;
		$url='http://www.duanxin10086.com/sms.aspx?action=send';
		 // $o='';
		 // foreach ($post_data as $k=>$v)
		 // {
		 //    $o.="$k=".urlencode($v).'&';
		 // }
		//$post_data=substr($o,0,-1);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //如果需要将结果直接返回到变量里，那加上这句。
		$this->result = curl_exec($ch);
		$this->GetLastResult();
		return $this->result;
	}

	private function GetLastResult(){
		$xml = simplexml_load_string($this->result);
		if(strtolower($xml->returnstatus) === "faild"){
			$this->failed = true;
			$this->errmsg = $xml->message;
		}else if(strtolower($xml->returnstatus) === "sucess"){

			$this->failed = false;
			$this->errmsg = '';
			$this->overage = $xml->overage;
			$this->sendtotal = $xml->sendtotal;
		}

		return $xml;
	}

	public function IsFailed(){
		return $this->failed;
	}



}
