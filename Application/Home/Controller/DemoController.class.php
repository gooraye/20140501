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
		$post_data = array();
		$post_data['userid'] = 8373;
		$post_data['account'] = 'bao009';
		$post_data['password'] = '112233';
		$post_data['content'] = 'PHP'; //短信内容需要用urlencode编码下
		$post_data['mobile'] = '13484379290';
		$post_data['sendtime'] = ''; //不定时发送，值为0，定时发送，输入格式YYYYMMDDHHmmss的日期值
		$url='http://xzx.qf106.com/sms.aspx?action=send';
		$o='';
		foreach ($post_data as $k=>$v)
		{
		   $o.="$k=".urlencode($v).'&';
		}
		// $post_data=substr($o,0,-1);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		//curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //如果需要将结果直接返回到变量里，那加上这句。
		$result = curl_exec($ch);
		$this->show($result);
	}


	/* 微信发送测试 */
	public function QuerySMS(){
		
		$post_data = array();
		$post_data['userid'] = 8373;
		$post_data['account'] = 'bao009';
		$post_data['password'] = '112233';
		$url='http://xzx.qf106.com/sms.aspx?action=overage';
		$o='';
		foreach ($post_data as $k=>$v)
		{
		    $o.=urlencode("$k=".$v).'&';
		}
		// $post_data=substr($o,0,-1);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		//curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //如果需要将结果直接返回到变量里，那加上这句。
		$result = curl_exec($ch);
		$this->show($result);
	}
}
