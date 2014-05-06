<?php
return array(
	'theme'=>array(//配置在表单中的键名 ,这个会是config[theme]
		'title'=>'主题:',//表单的文字
		'type'=>'radio',		 //表单的类型：text、textarea、checkbox、radio、select等
		'options'=>array(		 //select 和radion、checkbox的子选项
			'1'=>'样式1',		 //值=>文字
			'0'=>'默认样式',
		),
		'value'=>'0',			 //表单的默认值
	),
);
					