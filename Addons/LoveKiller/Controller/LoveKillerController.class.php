<?php

namespace Addons\LoveKiller\Controller;
use Home\Controller\AddonsController;

class LoveKillerController extends AddonsController{
	protected $model;
	public function __construct() {
		parent::__construct ();
		$this->model = M ( 'Model' )->getByName ( 'ml_lovek_manage' );
		$this->model || $this->error ( '模型不存在！' );

		$this->assign ( 'model', $this->model );
	}
	/**
	 * 显示指定模型列表数据
	 */
	public function lists() {
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		                                
		// 解析列表规则
		$fields = array ();
		$grids = preg_split ( '/[;\r\n]+/s', $this->model ['list_grid'] );
		foreach ( $grids as &$value ) {
			// 字段:标题:链接
			$val = explode ( ':', $value );
			// 支持多个字段显示
			$field = explode ( ',', $val [0] );
			$value = array (
					'field' => $field,
					'title' => $val [1] 
			);
			if (isset ( $val [2] )) {
				// 链接信息
				$value ['href'] = $val [2];
				// 搜索链接信息中的字段信息
				preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use(&$fields) {
					$fields [] = $match [1];
				}, $value ['href'] );
			}
			if (strpos ( $val [1], '|' )) {
				// 显示格式定义
				list ( $value ['title'], $value ['format'] ) = explode ( '|', $val [1] );
			}
			foreach ( $field as $val ) {
				$array = explode ( '|', $val );
				$fields [] = $array [0];
			}
		}
		// 过滤重复字段信息
		$fields = array_unique ( $fields );
		// 关键字搜索
		$map ['token'] = get_token ();
		$key = $this->model ['search_key'] ? $this->model ['search_key'] : 'title';
		if (isset ( $_REQUEST [$key] )) {
			$map [$key] = array (
					'like',
					'%' . htmlspecialchars ( $_REQUEST [$key] ) . '%' 
			);
			unset ( $_REQUEST [$key] );
		}
		// 条件搜索
		foreach ( $_REQUEST as $name => $val ) {
			if (in_array ( $name, $fields )) {
				$map [$name] = $val;
			}
		}
		$row = empty ( $this->model ['list_row'] ) ? 20 : $this->model ['list_row'];
		
		// 读取模型数据列表
		
		empty ( $fields ) || in_array ( 'id', $fields ) || array_push ( $fields, 'id' );
		$name = parse_name ( get_table_name ( $this->model ['id'] ), true );
		$data = M ( $name )->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		
		/* 查询记录总数 */
		$count = M ( $name )->where ( $map )->count ();
		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$this->assign ( '_page', $page->show () );
		}
		
		$this->assign ( 'list_grids', $grids );
		$this->assign ( 'list_data', $data );
		$this->meta_title = $this->model ['title'] . '列表';
		$this->display ( T ( 'Addons://LoveKiller@LoveKiller/lists' ) );
	}
	
	/**
	 * 显示玩家列表数据
	 */
	public function loglists() {
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		
		$modellog = M ( 'Model' )->getByName ( 'ml_lovek_log' );
		$modellog || $this->error ( '模型不存在！' );    
		// 解析列表规则
		$fields = array ();
		$grids = preg_split ( '/[;\r\n]+/s', $modellog ['list_grid'] );
		foreach ( $grids as &$value ) {
			// 字段:标题:链接
			$val = explode ( ':', $value );
			// 支持多个字段显示
			$field = explode ( ',', $val [0] );
			$value = array (
					'field' => $field,
					'title' => $val [1] 
			);
			if (isset ( $val [2] )) {
				// 链接信息
				$value ['href'] = $val [2];
				// 搜索链接信息中的字段信息
				preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use(&$fields) {
					$fields [] = $match [1];
				}, $value ['href'] );
			}
			if (strpos ( $val [1], '|' )) {
				// 显示格式定义
				list ( $value ['title'], $value ['format'] ) = explode ( '|', $val [1] );
			}
			foreach ( $field as $val ) {
				$array = explode ( '|', $val );
				$fields [] = $array [0];
			}
		}
		// 过滤重复字段信息
		$fields = array_unique ( $fields );
		// 关键字搜索
		$map ['token'] = get_token ();		
		$map ['manage_id'] = I ( 'id', 0, 'intval' );	
		$row = empty ( $modellog ['list_row'] ) ? 20 : $modellog ['list_row'];
		
		// 读取模型数据列表
		
		empty ( $fields ) || in_array ( 'id', $fields ) || array_push ( $fields, 'id' );		
		$data = M ( "ml_lovek_log")->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();		
		/* 查询记录总数 */
		$count = M ( "ml_lovek_log")->where ( $map )->count ();		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$this->assign ( '_page', $page->show () );
		}
		
		$this->assign ( 'list_grids', $grids );
		$this->assign ( 'list_data', $data );	
		$this->display ( T ( 'Addons://LoveKiller@LoveKiller/loglists' ) );
	}
	
	
	
	public function del() {
		$ids = I ( 'id', 0 );
		if (empty ( $ids )) {
			$ids = array_unique ( ( array ) I ( 'ids', 0 ) );
		}
		if (empty ( $ids )) {
			$this->error ( '请选择要操作的数据!' );
		}
		
		$Model = M ( get_table_name ( $this->model ['id'] ) );
		$map = array (
				'id' => array (
						'in',
						$ids 
				) 
		);
		$map ['token'] = get_token ();
		if ($Model->where ( $map )->delete ()) {
			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败！' );
		}
	}
	public function edit() {
		// 获取模型信息
		$id = I ( 'id', 0, 'intval' );
		
		if (IS_POST) {			
			
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $Model->save ()) {				
				// 保存关键词
				D ( 'Common/Keyword' )->set ( I ( 'post.keyword' ), 'LoveKiller', I ( 'post.id' ) );
				
				$this->success ( '保存' . $this->model ['title'] . '成功！', U ( 'lists?model=' . $this->model ['name'] ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $this->model ['id'] );
			
			// 获取数据
			$data = M ( get_table_name ( $this->model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );
						
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this->meta_title = '编辑' . $this->model ['title'];
			$this->display ( T ( 'Addons://LoveKiller@LoveKiller/edit' ) );
		}
	}
	public function add() {
		if (IS_POST) {
			// 自动补充token
			$token = get_token ();
			$_POST ['token'] = $token;
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $LoveKiller_id = $Model->add ()) {				
				
				//保存攻略关键词
				//查询是否已经保存过
				$keywords = M ( "keyword" )->where (array("keyword"=>"我要高潮"))->find ();
				if(empty($keywords)){
					//新增
					$reply_id =  M("custom_reply_text")->add(array(                    
							'keyword' => "我要高潮",
							'token' =>$token,
							'content' =>"约会合体游戏是时下最火爆的暧昧游戏。玩法简单又极具趣味，是男女屌丝马桶上的时间杀手，周末宅在家里的必备游戏。​​

游戏规则：滑动方块使两个相同的方块重合就可以生成新的方块​

玩法虽易，想要获得高分成为恋爱大神不易，攻略如下：​

攻略一：和追女生一样，有耐心是游戏高分的先决条件；​
攻略二：了解合成的顺序，建议把文字和数字对应起来：​

单身+单身=搭讪（2+2=4）
搭讪+搭讪=约会（4+4=8）
约会+约会=表白（8+8=16）
....​

攻略三：让数字最大的方块保持在右下角
攻略四：满足最大数所在的那一列和那一行是满的，这样可以保持最大数始终在角落
攻略五：尽量不要向左和向上滑动，如果最后一行没有填满，向左滑可能使得最大数离开右下角然后右下角被填住那就尴尬了。
攻略六：不要急于“清理桌面”。
很多人在玩的时候喜欢把界面清理得非常整洁，这会造成两个后果：​
1、清理后，不得不向大数所在行的反方向移动方块​
2、大数连锁合并时，很小的数被塞进大数那一行​​

攻略七：分享到朋友圈，邀请自己的朋友一起玩：​

和情侣一起玩，会大大增加游戏的乐趣。可以玩到哪个环节就实际体验下，比如玩到接吻结束了，就和情侣来个法国湿吻。如果玩到高潮那就...嘿嘿嘿。
没有情侣的单身屌丝可以分享到朋友圈，找好基友切磋交流下恋爱技巧。​​

看再多攻略也比不上实战。掌握了所有技巧？那就发送【". I ( 'keyword' )."】去体验游戏“高潮”的快感吧~",
							'sort' =>0,
							'keyword_type' =>0,
							'view_count' =>0					
					));

					M("keyword")->add(array(                    
							'keyword' => "我要高潮",
							'token' =>$token,
							'aim_id' =>$reply_id,
							'keyword_length' =>12,
							'keyword_type' =>0,
							'extra_text' =>"custom_reply_text",
							'extra_int' =>0,
							'addon' =>"CustomReply",
							'cTime' => time()						
					));	
				}
				
				// 保存关键词
				D ( 'Common/Keyword' )->set ( I ( 'keyword' ).$keywords["id"], 'LoveKiller', $LoveKiller_id );
				$this->success ( '添加' . $this->model ['title'] . '成功！', U ( 'lists?model=' . $this->model ['name'] ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			
			$LoveKiller_fields = get_model_attribute ( $this->model ['id'] );
			$this->assign ( 'fields', $LoveKiller_fields );
						
			$this->meta_title = '新增' . $this->model ['title'];
			$this->display ( $this->model ['template_add'] ? $this->model ['template_add'] : T ( 'Addons://LoveKiller@LoveKiller/add' ) );
		}
	}
	
	protected function checkAttr($Model, $model_id) {
		$fields = get_model_attribute ( $model_id, false );
		$validate = $auto = array ();
		foreach ( $fields as $key => $attr ) {
			if ($attr ['is_must']) { // 必填字段
				$validate [] = array (
						$attr ['name'],
						'require',
						$attr ['title'] . '必须!' 
				);
			}
			// 自动验证规则
			if (! empty ( $attr ['validate_rule'] )) {
				$validate [] = array (
						$attr ['name'],
						$attr ['validate_rule'],
						$attr ['error_info'] ? $attr ['error_info'] : $attr ['title'] . '验证错误',
						0,
						$attr ['validate_type'],
						$attr ['validate_time'] 
				);
			}
			// 自动完成规则
			if (! empty ( $attr ['auto_rule'] )) {
				$auto [] = array (
						$attr ['name'],
						$attr ['auto_rule'],
						$attr ['auto_time'],
						$attr ['auto_type'] 
				);
			} elseif ('checkbox' == $attr ['type']) { // 多选型
				$auto [] = array (
						$attr ['name'],
						'arr2str',
						3,
						'function' 
				);
			} elseif ('datetime' == $attr ['type']) { // 日期型
				$auto [] = array (
						$attr ['name'],
						'strtotime',
						3,
						'function' 
				);
			}
		}
		return $Model->validate ( $validate )->auto ( $auto );
	}
	/**
     * **************************微信上的操作功能************************************
     */
    function show() {
		$LoveKiller_id = I ( 'id', 0, 'intval' );			
		$info = $this->_getLoveKillerInfo ( $LoveKiller_id );	
		$param ['id'] = $LoveKiller_id;
		$openid = get_openid ();
		$token = get_token ();
		$param ['token'] =$token;
		$param ['openid'] = $openid;		
		$url="";
		//查询是否绑定了信息
		$user = M('member')->where(array(
			"openid" => $openid,
			"token" => $token
		))->find();
		if ($user["truename"] == "" && $openid != "" && $openid != "-1") {			
			$url = addons_url('LoveKiller://LoveKiller/info', $param);			
		}
		$this->assign('isinfo_url', $url);
		//记录次数url
		$csurl = addons_url('LoveKiller://LoveKiller/logcount', $param);	
		$this->assign('csurl', $csurl);
		//记录最高分数url
		$hurl = addons_url('LoveKiller://LoveKiller/logh', $param);	
		$this->assign('hurl', $hurl);
		$this->display ( T ( 'Addons://LoveKiller@LoveKiller/show' ) );
	}
	
	//[Ajax]保存用户信息
    function info()
    {
        $data['openid'] = get_openid();
        $data['token']  = get_token();      
      
		// 保存用户信息
		$truename = I('truename');
		if (!empty($truename)) {
			$member['truename'] = $truename;
		}
		$mobile = I('mobile');
		if (!empty($mobile)) {
			$member['mobile'] = $mobile;
		}
		if (!empty($member)) {
			M('member')->where($data)->save($member);
		}
        $array=array("result"=>0);
        $json = json_encode($array);
        echo urldecode($json);
    }
		
	//[Ajax]记录游戏总次数
    function logcount()
    {
        $LoveKiller_id = I ( 'id', 0, 'intval' );
		$token = get_token ();
		$openid = get_openid();
		
		$map ['id'] = intval ( $LoveKiller_id );
		$map ['token'] = $token ;
		$info = M ( "ml_lovek_manage" )->where ( $map )->find ();	
	  
		// 保存信息		
		$ml_lovek_manage['playcount'] = (intval ( $info["playcount"])+1);		
		M('ml_lovek_manage')->where($map )->save($ml_lovek_manage);		
        
		
		if($openid != "-1" && $openid != ""){
			//记录游戏玩家
			$log = M ( "ml_lovek_log" )->where (array("manage_id"=>$LoveKiller_id,"openid"=>$openid))->find ();
			if($log["id"] > 0){
				//更新
				M("ml_lovek_log")->where(array("manage_id"=>$LoveKiller_id,"openid"=>$openid))
					->data(array(
						'playcount' => (intval($log["playcount"]) + 1 )                   
					))->save();
			}else{
				//新增
				M("ml_lovek_log")->add(array(                    
						'manage_id' => $LoveKiller_id,
						'openid' => $openid,
						'playcount' =>1,
						'cTime' => time(),
						'highestrecord' => 0
				));
			}		
		}
		$array=array("result"=>0);
        $json = json_encode($array);
        echo urldecode($json);
    }
	
	//[Ajax]记录游戏最高分数
    function logh()
    {
        $LoveKiller_id = I ( 'id', 0, 'intval' );
		$hh = I('hhf', 0, 'intval');		
		$token = get_token ();
		$openid = get_openid();
		
		$map ['id'] = intval ( $LoveKiller_id );
		$map ['token'] = $token ;
		$info = M ( "ml_lovek_manage" )->where ( $map )->find ();	
	    if($hh != 0 && intval($info["highestrecord"]) < $hh){
			// 保存信息		
			$ml_lovek_manage['highestrecord'] = $hh;		
			M('ml_lovek_manage')->where($map )->save($ml_lovek_manage);	
		}
		if($openid != "-1" && $openid != ""){
			//记录游戏玩家
			$log = M ( "ml_lovek_log" )->where (array("manage_id"=>$LoveKiller_id,"openid"=>$openid))->find ();
			if($log["id"] > 0 && intval($log["highestrecord"]) < $hh){
				//更新
				M("ml_lovek_log")->where(array("manage_id"=>$LoveKiller_id,"openid"=>$openid))
					->data(array(
						'highestrecord' => $hh                   
					))->save();
			}
		}
		
        $array=array("result"=>0,"text"=>$openid);
        $json = json_encode($array);
        echo urldecode($json);
    }
	
	function _getLoveKillerInfo($id) {
		// 检查ID是否合法
		if (empty ( $id ) || 0 == $id) {
			$this->error ( "哎呀,出错了!" );
		}		
		$map ['id'] = intval ( $id );
		$info = M ( "ml_lovek_manage" )->where ( $map )->find ();		
		$this->assign ( 'info', $info );
		return $info;
	}
}
