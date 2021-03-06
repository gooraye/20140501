<?php
/**
 * Host的微信模型
 *@author china
 */
namespace Addons\Host\Controller;

use Home\Controller\AddonsController;

class OrderController extends AddonsController {
	var $model;
	var $hid;
	function _initialize() {
		$this->model = $this->getModel ( 'Host_order' );
		
		$param ['hid'] = $this->hid = intval ( $_REQUEST ['hid'] );
		
		$res ['title'] = '微酒店';
		$res ['url'] = addons_url ( 'Host://Host/lists' );
		$res ['class'] = '';
		$nav [] = $res;
		
		$res ['title'] = '房间管理';
		$res ['url'] = addons_url ( 'Host://Order/lists', $param );
		$res ['class'] = 'current';
		$nav [] = $res;
		
		$this->assign ( 'tablist', $nav );
	}
	// 通用插件的列表模型
	public function lists() {
		$param ['hid'] = $this->hid;
		$param ['model'] = $this->model ['id'];
		$add_url = U ( 'add', $param );
		$this->assign ( 'add_url', $add_url );
		
		$map ['hid'] = $this->hid;
		session ( 'common_condition', $map );
		
		parent::common_lists ( $this->model );
	}
	
	// 通用插件的编辑模型
	public function edit() {
		$id = I ( 'id' );
		
		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $Model->save ()) {
				$param ['hid'] = $this->hid;
				$param ['model'] = $this->model ['id'];
				$url = U ( 'lists', $param );
				$this->success ( '保存' . $this->model ['title'] . '成功！', $url );
			} else {
				$this->error ( $Model->getError () );
			}
		}
		
		parent::common_edit ( $this->model, $id );
	}
	
	// 通用插件的增加模型
	public function add() {
		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $hid = $Model->add ()) {
				$param ['hid'] = $this->hid;
				$param ['model'] = $this->model ['id'];
				$url = U ( 'lists', $param );
				$this->success ( '添加' . $this->model ['title'] . '成功！', $url );
			} else {
				$this->error ( $Model->getError () );
			}
			exit ();
		}
		
		$normal_tips = '简要说明房间概况，订单类型：如单床，双人床<br>';
		$this->assign ( 'normal_tips', $normal_tips );
		
		parent::common_add ( $this->model );
	}
	
	// 通用插件的删除模型
	public function del() {
		parent::common_del ( $this->model );
	}
}
