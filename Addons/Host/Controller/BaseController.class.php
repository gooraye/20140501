<?php
/**
 * Host的微信模型
 *@author china
 */
namespace Addons\Host\Controller;

use Home\Controller\AddonsController;

class BaseController extends AddonsController {
	var $config;
	function _initialize() {
		$controller = strtolower ( _CONTROLLER );
	
		$res ['title'] = '商家设置';
		$res ['url'] = addons_url ( 'Host://Host/lists' );
		$res ['class'] = $controller == 'Host' ? 'current' : '';
		$nav [] = $res;
	
		
		$res ['title'] = '设置订单';
		$res ['url'] = addons_url ( 'Host://Order/lists' );
		$res ['class'] = $controller == 'Order' ? 'current' : '';
		$nav [] = $res;
		
		
		
	
				
		$this->assign ( 'nav', $nav );
		
		$config = getAddonConfig ( 'WeiSite' );
		$config ['cover_url'] = get_cover_url ( $config ['cover'] );
		$config ['background'] = get_cover_url ( $config ['background'] );
		$this->config = $config;
		$this->assign ( 'config', $config );
		// dump ( $config );
		// dump(get_token());
		
		// 定义模板常量
		$act = strtolower ( _ACTION );
		$temp = $config ['template_' . $act];
		$act = ucfirst ( $act );
		
		define ( 'CUSTOM_TEMPLATE_PATH', ONETHINK_ADDON_PATH . 'WeiSite/View/default/Template');
	}
}
