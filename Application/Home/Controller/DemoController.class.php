<?php


namespace Home\Controller;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class DemoController extends HomeController {
	
	/* 文档模型频道页 */
	public function index() {
		/* 分类信息 */
		//  4 2 1
		 // $index = (7);
		 // $index  = $index & 2;
		 // $index2  = $index | 2;
		 // $str = $index.' '.$index2;


		 // $index3 = (3);
		 // $index3  = $index3 & 2;
		 // $index4  = $index3 | 2;
		 // $str .= $index3.' '.$index4;
		// 1 +2 + 4 + 8 
		 $str = (15 & 1);
		 var_dump($str);
		 exit();
//		 $this->show($str);

	}

	/* 邮件发送测试 */
	public function Send(){
		$result = think_send_mail('hebiduhebi@163.com','接受','subject','body');
		$this->show($result);
	}
	
	/* 微信发送测试 */
	public function SendWX(){
		$openid = '';
		$weixin = D('Weixin');
		$this->show($weixin->replyText('测试'));
	}
	
	/* 微信发送测试 */
	public function SendSMS(){
		vendor('phpSMS.HaiyanSMS#class');
		 $haiyanSMS = new \HaiyanSMS();

		//$result = $haiyanSMS->QueryBalance();
		//dump($haiyanSMS->IsFailed());
		$result = $haiyanSMS->SendSMS("姓名：123 联系电话：123456789001 日期： 时间：12:00-13:00 特色项目：其它 备注：",'18257567105');
		dump($haiyanSMS->IsFailed());
		dump($haiyanSMS->errmsg);
		$result = $haiyanSMS->QueryBalance();

		$this->show($result);
	}


	/* 微信发送测试 */
	public function QuerySMS(){	
		 vendor('phpSMS.HaiyanSMS#class');
		 $haiyanSMS = new \HaiyanSMS();
		//dump($haiyanSMS);
		$result = $haiyanSMS->QueryBalance();
		dump($haiyanSMS->GetLastResult());
		$this->show($result);
	}

	public function Joke(){
		$output = "";
		$keyword  = "笑话";
		if($keyword == "笑话"){
			// $url = $this->config ['jok_key'] ;
			$url = "http://apix.sinaapp.com/joke/?appkey=gooraye";
//			$url = "http://apix.sinaapp.com/joke/?appkey=trialuser";
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			$output = curl_exec($ch);
			curl_close($ch);
			
			addWeixinLog($joke,"joke");
		}
		echo $output;
	}

}
