<?php

namespace Addons\ReturnTop;
use Common\Controller\Addon;

/**
 * 返回顶部插件
 * @author 丁丁
 */

    class ReturnTopAddon extends Addon{

        public $info = array(
            'name'=>'ReturnTop',
            'title'=>'返回顶部',
            'description'=>'返回顶部',
            'status'=>0,
            'author'=>'丁丁',
            'version'=>'0.1',
            'has_adminlist'=>0,
            'type'=>0         
        );

	public function install() {		
		return true;
	}
	public function uninstall() {		
		return true;
	}

        //实现的pageFooter钩子方法
        public function pageFooter($param){
            // $this->assign('addons_config', $this->getConfig());
            // $this->display('comment');
            $addons_config = $this->getConfig();
            
            $this->display('returntop'.$addons_config[theme] );
            // echo '<a class="returntop" style="display: none;" >'.</a>';
        }

    }