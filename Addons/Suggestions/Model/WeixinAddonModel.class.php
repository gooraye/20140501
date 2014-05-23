<?php
        	
namespace Addons\Suggestions\Model;
use Home\Model\WeixinModel;
        	
/**
 * Suggestions的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {	
		$param ['token'] = get_token ();
		$param ['openid'] = get_openid ();
		$url = addons_url ( 'Suggestions://Suggestions/suggest', $param );

		$config = getAddonConfig ( 'Suggestions' ); // 获取后台插件的配置参数
		
		$articles [0] = array (
				'Title' => '建议意见',
				'Description' => '请点击进入填写反馈内容',
				'PicUrl' => $config['logo'],
				'Url' => $url
		);
		
		$res = $this->replyNews ( $articles );
	}  	
}
        	