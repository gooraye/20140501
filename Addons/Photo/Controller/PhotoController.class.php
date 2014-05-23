<?php

namespace Addons\Photo\Controller;
use Home\Controller\AddonsController;

class PhotoController extends AddonsController{

	function photo_pic() {
		$param ['pid'] = I ( 'pid', 0, 'intval' );
		$url = addons_url ( 'Photo://Pic/lists', $param );
		// dump($url);
		//echo "<script>alert('".	$param ['marry_id']."')</script>";
		redirect ( $url );
	}

	public function lists() {
		get_list_field();
		parent::common_lists ( $this->model,0,'photolists' );
	}
	function photoView() {
		$map ['id'] = $pid = I ( 'pid', 0, 'intval' );
		$info = M ( 'photo' )->where ( $map )->find ();//获取相册信息
		if(!(is_array($info) && count($info)>0)||$info['visible']==1)
		{
			$this->assign ( 'msg', '相册不存在！' );
			$this->display ( 'errorMsg' );
			exit();
		}
		$map2 ['pid'] = $pid = I ( 'pid', 1, 'intval' );
		$pics = M ( 'photo_pic' )->where ( $map2 )->order ( 'Sord DESC' )->select();
		if(!(is_array($pics) && count($pics)>0))
		{
			$this->assign ( 'msg', '相册还没上传照片！' );
			$this->display ( 'errorMsg' );
			exit();
		}

		$this->assign ( 'photoname', $info['title'] );
		$this->assign ( 'pics', $pics );
		$this->display ( 'PhotoView' );

	}
	

}
