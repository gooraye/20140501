<?php
// .-----------------------------------------------------------------------------------
// | 
// | 
// | Site: http://www.gooraye.net
// |-----------------------------------------------------------------------------------
// | Author: 贝贝 <hebiduhebi@163.com>
// | Copyright (c) 2012-2014, http://www.gooraye.net. All Rights Reserved.
// |-----------------------------------------------------------------------------------


namespace Admin\Controller;

use Think\Controller;

/**
 * 微信日志控制器
 */
class SmsLogController extends AdminController {

	public function index(){
       		$this->meta_title = '短信日志管理';
		$log = M('SmsLog');

	          // 记录当前列表页的cookie
	          Cookie('__forward__',$_SERVER['REQUEST_URI']);
		//分页
        		$request    =   (array)I('request.');
        		$map['title'] = array(" like ",I('title'));
		$count      = $log->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,10,$request);// 实例化分页类 传入总记录数和每页显示的记录数(10)
		$show       = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $log->order('cTime desc')->limit($Page->firstRow.','.$Page->listRows)->where($map)->select();
		$this->assign('loglist',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->display("Ctrl:SmsLogList");
		// $this->display();
	}

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}

	/**
	* 删除微信日志
	* @author 贝贝 <hebiduhebi@163.com>
	*/
	public function del(){
	$id = array_unique((array)I('id',0));

	if ( empty($id) ) {
	    $this->error('请选择要操作的数据!');
	}

	$map = array('id' => array('in', $id) );
	if(M('SmsLog')->where($map)->delete()){

	    //记录行为
	    action_log('delete_SmsLog', 'SmsLog', $id, UID);
	    $this->success('删除成功');
	} else {
	    $this->error('删除失败！');
	}
	}



}
