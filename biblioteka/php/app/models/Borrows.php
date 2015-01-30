<?php

class Borrows extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $borrow_id;

    /**
     *
     * @var integer
     */
    public $borrow_user_id;

    /**
     *
     * @var string
     */
    public $borrow_start;

    /**
     *
     * @var string
     */
    public $borrow_end;

    /**
     *
     * @var integer
     */
    public $borrow_status;

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'borrow_id' => 'borrow_id', 
            'borrow_user_id' => 'borrow_user_id', 
            'borrow_start' => 'borrow_start', 
            'borrow_end' => 'borrow_end', 
            'borrow_status' => 'borrow_status'
        );
    }

}
