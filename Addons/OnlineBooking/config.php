<?php
return array(
	'remindway'=>array(//配置在表单中的键名 ,这个会是config[remindway]
		'title'=>'预约的提醒方式',//预约的提醒方式
		'type'=>'checkbox',		 //表单的类型：text、textarea、checkbox、radio、select等
		'options'=>array(		 //select 和radion、checkbox的子选项
			'4'=>'邮箱',		 //值=>文字
			'2'=>'微信',		 //值=>文字
			'1'=>'短信',		 //值=>文字
			'0'=>'不提醒，在线查看',
		),
		'value'=>'0',			 //表单的默认值
	),
	'extra'=>array(//配置在表单中的键名 ,这个会是config[remindway]
		'title'=>'邮箱、微信号或者短信',//预约的提醒方式
		'type'=>'text',		 //表单的类型：text、textarea、checkbox、radio、select等		
		'value'=>'hebiduhebi@126.com',			 //表单的默认值
	),

	'address'=>array(
		'title'=>'地址',//商户地址
		'type'=>'text',		 //	
		'value'=>'绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼',			 //表单的默认值
	),
	'tel'=>array(
		'title'=>'电话',//商户联系电话、手机
		'type'=>'text',		 //	
		'value'=>'0575-89871666、13867519285',			 //表单的默认值
	),

	'info'=>array(
		'title'=>'预约说明',//商户联系电话、手机
		'type'=>'text',		 //	
		'value'=>'预约时间保留当天，请认真填写预约订单。',			 //表单的默认值
	),

	'picture'=>array(
		'title'=>'图片',//商户联系电话、手机
		'type'=>'picture',		 //	
		'value'=>'http://gooraye.qiniudn.com/dwyzaixianyuyue.jpg',			 //表单的默认值
	)
	
);
					