<?php

namespace Addons\OnlineBooking;
use Common\Controller\Addon;

/**
 * 在线预约插件
 * @author hbd
 */

    class OnlineBookingAddon extends Addon{

           public $info = array(
            'name'=>'OnlineBooking',
            'title'=>'在线预约',
            'description'=>'在线预约模块',
            'status'=>0,
            'author'=>'hbd',
            'version'=>'0.1',
            'has_adminlist'=>1,
            'type'=>1      
           );

	public function install() {
		$install_sql = './Addons/OnlineBooking/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/OnlineBooking/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }