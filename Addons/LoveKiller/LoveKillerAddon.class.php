<?php

namespace Addons\LoveKiller;
use Common\Controller\Addon;

/**
 * 恋爱高手插件
 * @author 陌路生人
 */

    class LoveKillerAddon extends Addon{

        public $info = array(
            'name'=>'LoveKiller',
            'title'=>'恋爱高手',
            'description'=>'约会合体游戏是时下最火爆的暧昧游戏。玩法简单又极具趣味，是男女屌丝马桶上的时间杀手，周末宅在家里的必备游戏。',
            'status'=>1,
            'author'=>'陌路生人',
            'version'=>'0.1',
            'has_adminlist'=>1,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/LoveKiller/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/LoveKiller/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }