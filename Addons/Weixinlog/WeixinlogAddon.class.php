<?php

namespace Addons\Weixinlog;
use Common\Controller\Addon;

/**
 * 微信交互日志插件
 * @author 何必都
 */

    class WeixinlogAddon extends Addon{

        public $info = array(
            'name'=>'Weixinlog',
            'title'=>'微信交互日志',
            'description'=>'查看微信日志',
            'status'=>1,
            'author'=>'何必都',
            'version'=>'1',
            'has_adminlist'=>0,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/Weixinlog/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Weixinlog/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }