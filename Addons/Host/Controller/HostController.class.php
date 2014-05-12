<?php
/**
 * Host的微信模型
 *@author china
 */
namespace Addons\Host\Controller;

use Home\Controller\AddonsController;

class HostController extends AddonsController {

	function Host_order() {
		$param ['hid'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Host://Order/lists', $param );
		// dump($url);
		redirect ( $url );
	}
	function Host_Guanli() {
		$param ['hid'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Host://Guanli/lists', $param );
		// dump($url);
		redirect ( $url );
	}
	function preview() {
		$param ['hid'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Host://Host/show', $param );
		// dump($url);
		redirect ( $url );
	}
	function show($html = 'show') {
		$map ['id'] = $hid = I ( 'hid', 0, 'intval' );
		$map ['token'] = get_token ();
		$info = M ( 'host' )->where ( $map )->find ();
		$this->assign ( 'info', $info );
		
		unset ( $map );
		$map ['uid'] = $this->mid;
		$map ['hid'] = $hid;
		$order = M ( 'host_order' )->where ( $map )->select ();
		
		$this->assign ( 'order', $order );
		
		$this->display ( $html );
	}
	function profile() {
		$map ['uid'] = $this->mid;
		$info = M ( 'member' )->where ( $map )->find ();
		$this->assign ( 'info', $info );
		
		if (IS_POST) {
			if (! empty ( $_POST ['truename'] ) && $_POST ['truename'] != $info ['truename']) {
				$data ['truename'] = I ( 'post.truename' );
			}
			if (! empty ( $_POST ['mobile'] ) && $_POST ['mobile'] != $info ['mobile']) {
				$data ['mobile'] = I ( 'post.mobile' );
			}
			
			if (! empty ( $data )) {
				$res = M ( 'member' )->where ( $map )->save ( $data );
			}
			
			redirect ( U ( 'Host', 'hid=' . $_REQUEST ['hid'] ) );
			exit ();
		}
		
		$this->display ();
	}
	function Host() {
		$map ['hid'] = intval ( $_REQUEST ['hid'] );
		$map ['token'] = get_token ();
		$Host = M ( 'host' )->where ( $map )->find ();
		
		$now = time ();
		$start = intval ( $Host ['start_time'] );
		$end = intval ( $Host ['end_time'] );
		if (($start > 0 && $now < $start) || ($end > 0 && $now > $end)) {
			redirect ( U ( 'show', 'hid=' . $map ['hid'] ) );
		}
		
		$list = M ( 'host_order' )->where ( $map )->order ( 'sort asc, id asc' )->select ();
		foreach ( $list as $vo ) {
			$question_list [$vo ['id']] = $vo;
		}
		
		if (IS_POST) {
			$map ['uid'] = $this->mid;
			$map ['order_id'] = I ( 'post.order_id', 0, 'intval' );
			$answer = M ( 'Host_answer' )->where ( $map )->find ();
			
			$data ['cTime'] = time ();
			//$data ['answer'] = serialize ( $_POST ['answer'] );
			//$data ['score'] = $this->_getScore ( $question_list [$map ['question_id']], $_POST ['answer'] );
			if ($answer) {
				M ( 'Host_answer' )->where ( $map )->save ( $data );
			} else {
				$data ['hid'] = $map ['hid'];
				$data ['token'] = $map ['token'];
				$data ['question_id'] = $map ['question_id'];
				$data ['uid'] = $map ['uid'];
				$data ['openid'] = get_openid ();
				M ( 'Host_answer' )->add ( $data );
			}
		}
		
		$question_id = I ( 'post.next_id', 0, 'intval' );
		if ($question_id == '-1') {
			redirect ( U ( 'finish', 'hid=' . $map ['hid'] ) );
		}
		
		if (empty ( $question_id )) {
			$question = $list [0];
			$next_id = isset ( $list [1] ['id'] ) ? $list [1] ['id'] : '-1';
		} else {
			foreach ( $list as $k => $vo ) {
				if ($vo ['id'] == $question_id) {
					$question = $vo;
					$next_id = isset ( $list [$k + 1] ['id'] ) ? $list [$k + 1] ['id'] : '-1';
				}
			}
		}
		
		$extra = parse_config_attr ( $question ['extra'] );
		
		$this->assign ( 'host', $host );
		$this->assign ( 'question', $question );
		$this->assign ( 'next_id', $next_id );
		$this->assign ( 'extra', $extra );
		
		$this->display ();
	}
	function finish() {
		$this->show ( 'finish' );
	}
	
	// 内容页面
	function detail() {
		$map ['id'] = I ( 'get.id', 0, 'intval' );
		//$map ['hid'] = $hid;
		$info = M ( 'host_order' )->where ( $map )->find ();
		$a=$info['price'];
		$b=$info['yhprice'];
		$nums=$a-$b;
		$this->assign('nums',$nums);
		$hotel=M ( 'host' )->where ( $hid )->find ();
		//dump($hotel);
		$this->assign ( 'hotel', $hotel );
		$this->assign ( 'info', $info );
		
		M ( 'host_order' )->where ( $map )->setInc ( 'view_count' );
		M('host')->where($hid)->setInc('view_count');
		$this->display ();
	}
	
	function shop(){
		$hotel=M ( 'host' )->where ( $hid )->find ();
		$this->assign ( 'hotel', $hotel );
		M('host')->where($hid)->setInc('view_count');
		$this->display ();
	
	}
	
}
