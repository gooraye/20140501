<?php
return array(
	'remindway'=>array(//配置在表单中的键名 ,这个会是config[remindway]
		'title'=>'预约的提醒方式,暂支持邮箱、短信',//预约的提醒方式
		'type'=>'checkbox',		 //表单的类型：text、textarea、checkbox、radio、select等
		'options'=>array(		 //select 和radion、checkbox的子选项
			'4'=>'邮箱',		 //值=>文字
			// '2'=>'微信',		 //值=>文字
			 '1'=>'短信'		 //值=>文字
			// '0'=>'不提醒，在线查看',
		),
		'value'=>'4',			 //表单的默认值
	),
	'toaddress'=>array(//配置在表单中的键名 ,这个会是config[remindway]
		'title'=>'收件人邮箱',//预约的提醒方式
		'type'=>'textarea',		 //表单的类型：text、textarea、checkbox、radio、select等		
		'value'=>"mail:hebiduhebi@126.com;sms:13484379290",			 //表单的默认值
		'tip' => '多个收件箱以,隔开是英文,'
	),

	'address'=>array(
		'title'=>'地址',//商户地址
		'type'=>'text',		 //	
		'value'=>'绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼',			 //表单的默认值
	),
	'addressMap'=>array(
		'title'=>'地图地址',//商户地址
		'type'=>'text',		 //	
		'value'=>'http://j.map.baidu.com/1u2hs',			 //表单的默认值
	),
	'tel'=>array(
		'title'=>'电话',//商户联系电话、手机
		'type'=>'text',		 //	
		'value'=>'0575-89871666',			 //表单的默认值
	),
	'info'=>array(
		'title'=>'预约说明',//商户联系电话、手机
		'type'=>'text',		 //	
		'value'=>'提交成功后，将会电话联系您确定此次预约。',			 //表单的默认值
	),
	'picture'=>array(
		'title'=>'图片',//商户联系电话、手机
		'type'=>'picture',		 //	
		'value'=>'http://gooraye.qiniudn.com/dwyzaixianyuyue.jpg',			 //表单的默认值
	)
	,
	'timepart'=>array(
		'title'=>'可预约时间,只能时',//预约时间
		'type'=>'text',		 //	
		'value'=>'12-24',			 //表单的默认值
	)	
	,
	'projecttype'=>array(
		'title'=>'特色项目',//预约时间
		'type'=>'text',		 //	
		'value'=>'五行经络刷,SPA能量热石',			 //表单的默认值
	)
	
);
					