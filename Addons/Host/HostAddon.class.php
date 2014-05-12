<?php

namespace Addons\Host;
use Common\Controller\Addon;

/**
 * 微酒店插件
 * @author china
 */

    class HostAddon extends Addon{

        public $info = array(
            'name'=>'Host',
            'title'=>'微酒店',
            'description'=>'发送微酒店',
            'status'=>1,
            'author'=>'china',
            'version'=>'0.1',
            'has_adminlist'=>1,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/Host/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Host/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }