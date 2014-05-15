<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Addons\EditorForAdmin\Controller;

use Home\Controller\AddonsController;
use Think\Upload;
use Think\Controller;

class UploadController extends Controller{

	public $uploader = null;

	/* 上传图片 */
	public function upload(){
		
		if(C('PICTURE_UPLOAD_DRIVER') == 'local'){

			/* 上传配置 */
			$setting = C('EDITOR_UPLOAD');

			// dump($setting);
			/* 调用文件上传组件上传文件 */
			$this->uploader = new Upload($setting, 'Local');
			$info   = $this->uploader->upload($_FILES);
		

			if ($info) {
						
				foreach ( $info as &$file ) {
					$file ['rootpath'] = __ROOT__ . ltrim ( $setting ['rootPath'], "." );
				}
				return $info ['imgFile'] ['rootpath'] . $info ['imgFile'] ['savepath'] . $info ['imgFile'] ['savename'];
				
			}

		}else{
			return $this->vendorUpload();
		}
	}

	public function vendorUpload()
	{        
	        /* 读取数据库中的配置 */
	        // $config =   S('DB_CONFIG_DATA');
	        // if(!$config){
	        //     $config =   api('Config/lists');
	        //     S('DB_CONFIG_DATA',$config);
	        // }

		// var_dump(C('PICTURE_UPLOAD_DRIVER'));
		// var_dump(C('PICTURE_UPLOAD'));
		// var_dump(C('UPLOAD_QINIU_CONFIG'));

		
		$driver = strtoupper(C('PICTURE_UPLOAD_DRIVER'));

		/* 上传配置 */
		$setting = C('UPLOAD_'.$driver.'_CONFIG');

        
		// var_dump($setting);
		/* 调用文件上传组件上传文件 */
		$this->uploader = new Upload(C('PICTURE_UPLOAD'), 
			C('PICTURE_UPLOAD_DRIVER'),$setting);

		$info   = $this->uploader->upload($_FILES);
		// if(!$info){
		//  	//dump($this->uploader->getError());
		// }

		// return $info;
		return $info ['imgFile'] ['url'];
	}

	//keditor编辑器上传图片处理
	public function ke_upimg(){

		/* 返回标准数据 */
		$return  = array('error' => 0, 'info' => '上传成功', 'data' => '');
		$img = $this->upload();
		/* 记录附件信息 */
		if($img){
			$return['url'] = $img;
			unset($return['info'], $return['data']);
		} else {
			$return['error'] = 1;
			$return['message']   = $this->uploader->getError();
		}

		/* 返回JSON数据 */
		exit(json_encode($return));
	}

	//ueditor编辑器上传图片处理
	public function ue_upimg(){

		// dump('ue_upimg');
		$img = $this->upload();
		$return = array();
		$return['url'] = $img;
		$title = htmlspecialchars($_POST['pictitle'], ENT_QUOTES);
		$return['title'] = $title;
		$return['original'] = $img['imgFile']['name'];
		$return['state'] = ($img)? 'SUCCESS' : $this->uploader->getError();
		/* 返回JSON数据 */
		$this->ajaxReturn($return);
	}

}
