<?php
return array (
		'toaddress'=>array(
			'title' => '发送邮件地址', 
			'type'=>'text',
			'value'=>'2966442390@qq.com,1966236348@qq.com',
			'tip'=>'邮件地址，若有多个以,符隔开'
		),
		'need_truename' => array (
				'title' => '是否需要填写昵称:',
				'type' => 'radio',
				'options' => array (
						'1' => '是',
						'0' => '否' 
				),
				'value' => '0' 
		),
		'need_mobile' => array (
				'title' => '是否需要填写手机号:',
				'type' => 'radio',
				'options' => array (
						'1' => '是',
						'0' => '否' 
				),
				'value' => '0' 
		) ,
		'logo' => array(

			'title' => '建议意见logo',
			'type' => 'text',
			'value' => 'http://gooraye.qiniudn.com/gr_logotext.png', 

		)
);
					