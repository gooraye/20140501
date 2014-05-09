<?php

namespace Admin\Controller;

class CtrlController extends AdminController {    
    public function index(){
        	$this->meta_title = 'CMS管理';
   	$this->display();
   }
}
