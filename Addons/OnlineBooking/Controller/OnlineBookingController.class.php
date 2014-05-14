<?php

namespace Addons\OnlineBooking\Controller;
use Home\Controller\AddonsController;

class OnlineBookingController extends AddonsController{

	public function __construct() {
		parent::__construct ();
	}

	public function index()
	{
		$config = getAddonConfig ( 'OnlineBooking' ); // 获取后台插件的配置参数	
		$this->assign("config",$config);
		$this->display();
	}
	
	public function booking()
	{
		
	}
}
