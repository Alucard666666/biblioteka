<?php

class BooksController extends ControllerBase
{
    public function initialize(){
        parent::initialize();
    }

    public function indexAction(){

	}

    public function detailAction(){

        $this->view->book = Books::findFirst(array(
            "conditions" => "book_link='".$this->router->getParams()[0]."'"
        ));

    }
}

