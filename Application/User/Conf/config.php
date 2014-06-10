<?php
// .-----------------------------------------------------------------------------------
// | 
// | 
// | Site: http://www.gooraye.net
// |-----------------------------------------------------------------------------------
// | Author: 贝贝 <hebiduhebi@163.com>
// | Copyright (c) 2012-2014, http://www.gooraye.net. All Rights Reserved.
// |-----------------------------------------------------------------------------------


/**
 * UCenter客户端配置文件
 * 注意：该配置文件请使用常量方式定义
 */

define('UC_APP_ID', 1); //应用ID
define('UC_API_TYPE', 'Model'); //可选值 Model / Service
define('UC_AUTH_KEY', 'MkD3_28numNZay@?LVc=&B~f;XKGQs],zJhOA-S{'); //加密KEY

//万网
define('UC_DB_DSN', 'mysql://hdm1180183:364945361@hdm-118.hichina.com/hdm1180183_db'); 
//define('UC_DB_DSN', 'mysql://u8UAepm7wNYKh2ypXDTrn3o8:qsYrXDjv6ddG2Mh1lkurEZj1Vd9O36dN@sqld.duapp.com:4050/OGWQmxWOuIZWNAOfiiCY'); 
// define('UC_DB_DSN', 'mysql://wp:1@127.0.0.1:3306/wp_dbwx'); // 数据库连接，使用Model方式调用API必须配置此项
define('UC_TABLE_PREFIX', 'wp_'); // 数据表前缀，使用Model方式调用API必须配置此项
