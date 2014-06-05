<?php

namespace Addons\weicar;
use Common\Controller\Addon;

/**
 * 微汽车插件
 * @author 贝贝
 */

    class weicarAddon extends Addon{

        public $info = array(
            'name'=>'weicar',
            'title'=>'微汽车',
            'description'=>'微汽车',
            'status'=>1,
            'author'=>'贝贝',
            'version'=>'1',
            'has_adminlist'=>1,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/weicar/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/weicar/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }