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
		$msg = I('msg',0);
		$result = think_send_mail('hebiduhebi@163.com','接受','subject','body');
		$this->show($result);
	}
	
	/* 微信发送测试 */
	public function SendWX(){
		$openid = '';
		$weixin = D('Weixin');
		$this->show($weixin->replyText('测试'));
	}
	
}
