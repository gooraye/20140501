<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Controller;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {
	
	// 系统首页
	public function index() {
		// $this->redirect('http://www.gooraye.net/index.html');
		header("HTTP/1.1 301 Moved Permanently");
            	header('Location: ' . 'http://www.gooraye.net/index.html');
		// $map = array('status' => 1,'pid' => 0);
		// $channel = D('Channel');
		// $list = $channel->where($map)->select();
		// $this->assign("channels",$list);

		// $this->display ();

	}

	//metro风格首页
	public function index_a(){
		$map = array('category_id' => 2);
		$articlesModel = D('Document');
		$list = $articlesModel->where($map)->select();
		$newestlist = $this->get_newest_articles();
		$this->assign("newestlist",$newestlist);
		$this->display ();
	}


	// 系统介绍
	public function introduction() {
		$this->display ();
	}
	
	// 系统帮助
	public function help() {
		if (isset ( $_GET ['public_id'] )) {
			$map ['id'] = intval ( $_GET ['public_id'] );
			$info = M ( 'member_public' )->where ( $map )->find ();
			$this->assign ( 'token', $info ['token'] );
		} else {
			$this->assign ( 'token', '你的公众号的Token' );
		}
		
		$list = $this->get_navs();
		$this->assign("channels",$list);
		
		$this->display ();
	}
	// 系统关于
	public function about() {

		$list = $this->get_navs();
		$this->assign("channels",$list);
		
		// D('')
		$this->display ();
	}
	
	
	// 远程获取最新版本号
	public function update_version() {
		die ( M ( 'update_version' )->getField ( "max(`version`)" ) );
	}
		
	public function main() {
		if (! is_login ()) {
			$url = U ( 'home/user/login' );
			redirect ( $url );
		}
		$page = I ( 'p', 1, 'intval' );
		
		// 关键字搜索
		$map ['type'] = 1;
		$key = 'title';
		if (isset ( $_REQUEST [$key] )) {
			$map [$key] = array (
					'like',
					'%' . $_REQUEST [$key] . '%' 
			);
			unset ( $_REQUEST [$key] );
		}
		
		$row = 20;
		
		$data = M ( 'addons' )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		$token_status = D ( 'Common/AddonStatus' )->getList ();
		foreach ( $data as &$vo ) {
			if ($token_status [$vo ['name']] === '-1') {
				$vo ['status_title'] = '无权限';
				$vo ['action'] = '';
				$vo ['color'] = '#CCC';
				$vo ['status'] = 0;
			} elseif ($token_status [$vo ['name']] === 0) {
				$vo ['status_title'] = '已禁用';
				$vo ['action'] = '启用';
				$vo ['color'] = '#CCC';
				$vo ['status'] = 0;
			} else {
				$vo ['status_title'] = '已启用';
				$vo ['action'] = '禁用';
				$vo ['color'] = '';
				$vo ['status'] = 1;
			}
		}
		
		/* 查询记录总数 */
		$count = M ( 'addons' )->where ( $map )->count ();
		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$this->assign ( '_page', $page->show () );
		}
		
		$this->assign ( 'list_data', $data );
		
		$res ['title'] = '功能设置';
		$res ['url'] = U ( 'main' );
		$res ['class'] = 'current';
		$nav [] = $res;
		$this->assign ( 'tablist', $nav );
		$this->display ();
	}
	function setStatus() {
		$addon = I ( 'addon' );
		$token_status = D ( 'Common/AddonStatus' )->getList ();
		if ($token_status [$addon] === '-1') {
			$this->success ( '无权限设置' );
		}
		
		$status = 1 - I ( 'status' );
		$res = D ( 'Common/AddonStatus' )->set ( $addon, $status );
		$this->success ( '设置成功' );
	}
	
	// 宣传页面
	function leaflets() {
		$name = 'Leaflets';
		$config = array ();
		
		$map ['token'] = I ( 'get.token' );
		$addon_config = M ( 'member_public' )->where ( $map )->getField ( 'addon_config' );
		$addon_config = json_decode ( $addon_config, true );
		if (isset ( $addon_config [$name] )) {
			$config = $addon_config [$name];
			
			$config ['img'] = is_numeric ( $config ['img'] ) ? get_cover_url ( $config ['img'] ) : SITE_URL . '/Addons/Leaflets/View/default/Public/qrcode_default.jpg';
			$this->assign ( 'config', $config );
		} else {
			$this->error ( '请先保存宣传页的配置' );
		}
		define ( 'ADDON_PUBLIC_PATH', ONETHINK_ADDON_PATH .  'Leaflets/View/default/Public' );
		
		$this->display ( SITE_PATH . '/Addons/Leaflets/View/default/Leaflets/show.html' );
	}

	//案例展示
	function cases() {
		//案例所属分类ID
		$cateId = 43;
		$map  = array('category_id' => $cateId,'status'=>1);
		$cases = D ( 'Document' )->field('id,title,description')->where($map)->select();
		//获取默认展示案例
		$defaultCaseID = $cases[0]['id'];
		$defaultCase = D('Document')->detail(intval($defaultCaseID,0));

		$this->assign("defaultcase",$defaultCase);
		$this->assign("cases",$cases);
		$this->assign("channels",$this->get_navs());
		$this->display();
	}


	//获取4条最新的新闻
	function get_newest_articles(){
		$articles = S('index_article_newest');

		if(empty($articles)){
			$doc = D('Document');
			$map['status'] = 1;
			$map['category_id'] = 2;
			$articles = $doc->where($map)->order("update_time desc")->limit(4)->select();
			// var_dump($articles);
			S('index_article_newest',$articles,300);
		}
		return $articles;
	}
}