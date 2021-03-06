<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class ArticleController extends HomeController {

    /* 文档模型频道页 */
	public function index(){

		$list = $this->get_navs();
		$this->assign("channels",$list);
		/* 分类信息 */
		$category = $this->category();

		$map = array('category_id' => 2);
		$articlesModel = D('Document');
		$list = $articlesModel->where($map)->select();
		$newestlist = $this->get_newest_articles();
		// dump($list);
		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign("newestlist",$newestlist);
		$this->assign("hotlist",$this->get_hot_articles());
		$this->assign($list);
		$this->display($category['template_index']);
	}

	/* 文档模型列表页 */
	public function lists($page = 1){
		/* 分类信息 */
		$category = $this->category();
		$newestlist = $this->get_newest_articles();
		/* 获取当前分类列表 */
		$Document = D('Document');
		$list = $Document->page($page, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败！');
		}

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('list', $list);
		$this->assign("channels",$this->get_navs());
		// $this->assign("newestlist",$newestlist);
		// $this->assign("hotlist",$this->get_hot_articles());
		$this->display($category['template_lists']);
	}

	/* 文档模型详情页 */
	public function detail($id = 0, $page = 1){
		/* 标识正确性检测 */
		if(!($id && is_numeric($id))){
			$this->error('文档ID错误！');
		}

		/* 页码检测 */
		$page = intval($page);
		$page = empty($page) ? 1 : $page;
		/* 获取详细信息 */
		$Document = D('Document');
		$info = $Document->detail($id);
		if(!$info){
			$this->error($Document->getError());
		}

		/* 分类信息 */
		$category = $this->category($info['category_id']);

		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
			$tmpl = $info['template'];
		} elseif (!empty($category['template_detail'])){ //分类已定制模板
			$tmpl = $category['template_detail'];
		} else { //使用默认模板
			$tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';
		}

		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');

		if(IS_POST){
			$retInfo['info'] = $info;
			$doc = D('Document');
			if(empty($info)){
				$retInfo['status'] = 0;
				$retInfo['errmsg'] = '无法获取数据！';
			}else{
				$prev = $doc->prev($info);
				$next = $doc->next($info);
				if(!empty($prev)){
					$retInfo['prev'] = U('/home/Article/detail?id='.$prev[id]);
				}
				if(!empty($next)){					
					$retInfo['next'] = U('/home/Article/detail?id='.$next[id]);
				}
				$retInfo['status'] = 1;
				$retInfo['errmsg'] = '';
			}
			$this->ajaxReturn($retInfo,"JSON");
		}
		/* 模板赋值并渲染模板 */
		$this->assign("channels",$this->get_navs());
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->assign('page', $page); //页码
		$this->assign("newestlist",$this->get_newest_articles());
		$this->assign("hotlist",$this->get_hot_articles());
		$this->display($tmpl);
	}

	/* 文档分类检测 */
	private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.category', 0);
		if(empty($id)){
			$this->error('没有指定文档分类！');
		}
		/* 获取分类信息 */
		$category = D('Category')->info($id);
		if($category && 1 == $category['status']){
			switch ($category['display']) {
				case 0:
					$this->error('该分类禁止显示！');
					break;
				//TODO: 更多分类显示状态判断
				default:
					return $category;
			}
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}

	//获取4条最新的新闻
	function get_newest_articles(){
		$articles = S('article_newest');

		if(empty($articles)){
			$doc = D('Document');
			$map['status'] = 1;
			$map['category_id'] = 2;
			$articles = $doc->where($map)->order("update_time desc")->limit(4)->select();
			// var_dump($articles);
			S('article_newest',$articles,300);
		}
		return $articles;
	}

	//获取4条最热的新闻
	function get_hot_articles(){
		$articles = S('article_hot');

		if(empty($articles)){
			$doc = D('Document');
			$map['status'] = 1;
			$map['category_id'] = 2;
			$articles = $doc->where($map)->order("view desc")->limit(4)->select();
			
			S('article_hot',$articles,300);
		}
		return $articles;
	}

}
