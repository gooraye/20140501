<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 系统配文件
 * 所有系统级别的配置
 */
return array(
    /* 模块相关配置 */
    'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
    'DEFAULT_MODULE'     => 'Home',
    'MODULE_DENY_LIST'   => array('Common', 'User'),
    //'MODULE_ALLOW_LIST'  => array('Home','Admin'),

    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => 'MkD3_28numNZay@?LVc=&B~f;XKGQs],zJhOA-S{', //默认数据加密KEY

    /* 调试配置 */
    'SHOW_PAGE_TRACE' => true,

    /* 用户相关设置 */
    'USER_MAX_CACHE'     => 1000, //最大缓存用户数
    'USER_ADMINISTRATOR' => 1, //管理员用户ID

    /* URL配置 */
    'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'            => 3, //URL模式
    'VAR_URL_PARAMS'       => '', // PATHINFO URL参数变量
    'URL_PATHINFO_DEPR'    => '/', //PATHINFO URL分割符

    /* 全局过滤配置 */
    'DEFAULT_FILTER' => 'safe', //全局过滤函数

    /* 数据库配置 */    
 
     'DB_PREFIX' => 'wp_', // 数据库表前缀
    'DB_TYPE'   => 'mysql', // 数据库类型
    'DB_HOST'   => 'hdm-118.hichina.com', // 服务器地址
    'DB_NAME'   => 'hdm1180183_db', // 数据库名
    'DB_USER'   => 'hdm1180183', // 用户名
    'DB_PWD'    => '364945361',  // 密码
    'DB_PORT'   => '', // 端口


    /* 文档模型配置 (文档模型核心配置，请勿更改) */
    'DOCUMENT_MODEL_TYPE' => array(2 => '主题', 1 => '目录', 3 => '段落'),
    //邮件配置
     'THINK_EMAIL' => array(
        'SMTP_HOST'   => 'smtp.gooraye.net', //SMTP服务器
        'SMTP_PORT'   => '465', //SMTP服务器端口
        'SMTP_USER'   => 'gooraye@gooraye.net ', //SMTP服务器用户名
        'SMTP_PASS'   => 'grxxkj136799711', //SMTP服务器密码
        'FROM_EMAIL'  => 'gooraye@gooraye.net', //发件人EMAIL

        // 'SMTP_USER'   => 'hebiduhebi@126.com', //SMTP服务器用户名
        // 'SMTP_PASS'   => '136799711', //SMTP服务器密码
        // 'FROM_EMAIL'  => 'hebiduhebi@126.com', //发件人EMAIL

        'FROM_NAME'   => '绍兴古睿信息科技', //发件人名称
        'REPLY_EMAIL' => '', //回复EMAIL（留空则为发件人EMAIL）
        'REPLY_NAME'  => '', //回复名称（留空则为发件人名称）
     ),     
     
);
