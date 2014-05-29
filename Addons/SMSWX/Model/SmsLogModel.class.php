<?php
// .-----------------------------------------------------------------------------------
// | 
// | 
// | Site: http://www.gooraye.net
// |-----------------------------------------------------------------------------------
// | Author: 贝贝 <hebiduhebi@163.com>
// | Copyright (c) 2012-2014, http://www.gooraye.net. All Rights Reserved.
// |-----------------------------------------------------------------------------------


namespace Addons\SMSWX\Model;
use Think\Model;

class SmsLogModel extends Model{
	protected $_auto = array (         
         		array('cTime','time',1,'function'), // 对update_time字段在更新的时候写入当前时间戳
     	);
}
