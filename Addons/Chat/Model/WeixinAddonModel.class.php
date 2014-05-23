<?php

namespace Addons\Chat\Model;

use Home\Model\WeixinModel;

class WeixinAddonModel extends WeixinModel {
	var $config = array ();
	function reply($dataArr, $keywordArr = array()) {
		$this->config = getAddonConfig ( 'Chat' ); // 获取后台插件的配置参数	
		//dump($this->config);
		$opens = intval( $this->config['opens'] );

		$opens = 0;
		for ($i=0; $i < count($this->config['opens']); $i++) { 
			$opens += intval($this->config['opens'][$i]);
		}

		// dump($opens);
		// $this->config['opens'];
		// $this->replyText ( strval(strpos($dataArr['Content'],'天气')));
		// return $opens;
		// $content = $this->_weather($dataArr['Content']);
		// $this->replyNews ( $content );
		// return $content;
		$content = '';
		if(($opens & 8) === 8 && empty($content)){
			$content = $this->_joke($dataArr['Content']);
		}

		//开启天气预报
		if(($opens & 4) === 4 && empty($content)){
			 $content = $this->_weather($dataArr['Content']);
				
			if(!empty($content)){

				$res = $this->replyNews ( $content );
				// addWeixinLog($content,'天气预报');
				return $res;

			}
			

		 }
		 
		 if (($opens & 1) === 1  && empty ( $content )) {//开启机器人
			//先尝试小九机器人
			$content = $this->_xiaojo ( $dataArr ['Content'] );
			//再尝试小黄鸡
			if (empty ( $content )) {
				$content = $this->_simsim ( $dataArr ['Content'] );
			}
		}

		// // TODO 此处可继续增加其它API接口
		
		// // $content = $this->_fixed();
		// // 最后只能随机回复了
		if (empty ( $content )) {
			$content = $this->_rand ();
		}
		$res = $this->replyText ( $content );
		return $res;
	}
	
	//笑话
	private function  _joke($keyword){
		$output = "";
		if($keyword == "笑话"){
			$this->config = getAddonConfig ( 'Chat' ); // 获取后台插件的配置参数	
			$url = $this->config ['jok_key'] ;
//			$url = "http://apix.sinaapp.com/joke/?appkey=gooraye";
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			$output = curl_exec($ch);
			curl_close($ch);
			
//			addWeixinLog($url,"jok_key");
//			addWeixinLog($output,"joke");
		}
		return $output;
	}



	// 随机回复
	private function _rand() {
		$this->config ['rand_reply'] = array_map ( 'trim', explode ( "\n", $this->config ['rand_reply'] ) );
		$key = array_rand ( $this->config ['rand_reply'] );
		//解决多个字符串无法回发问题 by hbd @20140509
		return implode("\n",$this->config ['rand_reply']);
	}
	
	// 小黄鸡
	private function _simsim($keyword) {
		$api_url = $this->config['simsim_url']."?key=" . $this->config['simsim_key'] . "&lc=ch&ft=0.0&text=" . $keyword;
		
		$result = file_get_contents ( $api_url );
		$result = json_decode ( $result, true );
		
		return $result ['response'];
	}
	
	// 小九机器人
	private function _xiaojo($keyword) {
		$curlPost ['chat'] = $keyword;
		$ch = curl_init ();
		curl_setopt ( $ch, CURLOPT_URL, $this->config['i9_url'] );
		curl_setopt ( $ch, CURLOPT_HEADER, 0 );
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt ( $ch, CURLOPT_POST, 1 );
		curl_setopt ( $ch, CURLOPT_POSTFIELDS, $curlPost );
		$data = curl_exec ( $ch );
		curl_close ( $ch );
		
		return $data;
	}


	private function _weather($keyword){
		if(strpos($keyword, '天气')  ===  0){
			// addWeixinLog($keyword,$keyword);
			// return '';
		 	return $this->getWeatherInfo($keyword);

		}

		return '';
	}


	private function getWeatherInfo($cityName)
	{
		
		$url = "http://api.map.baidu.com/telematics/v3/weather?location=".urlencode($cityName)."&output=json&ak=u8UAepm7wNYKh2ypXDTrn3o8";
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$output = curl_exec($ch);
		curl_close($ch);
		$result = json_decode($output, true);
		if ($result["error"] != 0){
			// return $result["status"];
			return '';
		}
		// addWeixinLog($result,"getWeatherInfo");

		$curHour = (int)date('H',time());
		$weather = $result["results"][0];
		$weatherArray[] = array("Title" =>$weather['currentCity']."天气预报", "Description" =>"", "PicUrl" =>"", "Url" =>"");
		for ($i = 0; $i < count($weather["weather_data"]); $i++) {
			$weatherArray[] = array("Title"=>
			$weather["weather_data"][$i]["date"]."\n".
			$weather["weather_data"][$i]["weather"]." ".
			$weather["weather_data"][$i]["wind"]." ".
			$weather["weather_data"][$i]["temperature"],
			"Description"=>"", 
			"PicUrl"=>(($curHour >= 6) && ($curHour < 18))?$weather["weather_data"][$i]["dayPictureUrl"]:$weather["weather_data"][$i]["nightPictureUrl"], "Url"=>"");
		}

		addWeixinLog($weatherArray,"getWeatherInfo");
		return $weatherArray;
	}


	// 关注公众号事件
	public function subscribe() {
		return true;
	}
	
	// 取消关注公众号事件
	public function unsubscribe() {
		return true;
	}
	
	// 扫描带参数二维码事件
	public function scan() {
		return true;
	}
	
	// 上报地理位置事件
	public function location() {
		return true;
	}
	
	// 自定义菜单事件
	public function click($dataArr) {
		// var_dump($dataArr
		addWeixinLog($dataArr['EventKey'],"click");
		$content = $this->_joke($dataArr['EventKey']);
		if(!empty($content))
		{
			$this->replyText($content);
		}
		return true;
	}

}
