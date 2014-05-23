<?php
        	
namespace Addons\Photo\Model;
use Home\Model\WeixinModel;
        	
/**
 * Photo的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$token =	$map['token'] = get_token();
		$pid=0;
		if (! empty ( $keywordArr ['aim_id'] )) 
		{
			$pid=$map ['id'] = $keywordArr ['aim_id'];
		}
		
		$info = M ( 'photo' )->where ( $map )->find ();//获取相册信息
		if(!(is_array($info) && count($info)>0)||$info['visible']==1)
		{
			//相册不存在或不可见
			return true;
		}

		$pid = $info['id'];
		
//		addWeixinLog(serialize($info),"123");
		$param ['token'] =$token;
		$param ['openid'] = get_openid ();
		$param ['pid'] =$pid;
		$url = addons_url ( 'Photo://Photo/photoView', $param );
		$articles [0] = array (
				'Title' => $info['title'],
				'Description' => $info['intro'],
				'PicUrl' => get_picture_url($info['cover']),
				'Url' => $url
		);
	
		$res = $this->replyNews ( $articles );
		}


	// 关注公众号事件
	public function subscribe() {
		return true;
	}
	
	// 取消关注公众号事件
	public function unsubscribe() {
		return true;
	}
	
	// 扫描带参数二维码事件
	public function scan() {
		return true;
	}
	
	// 上报地理位置事件
	public function location() {
		return true;
	}
	
	// 自定义菜单事件
	public function click() {
		return true;
	}	
}
        	