<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Cargo_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'cargo';
        $this->column = array('id_cargo','nombre','estado');
        $this->order  = array('id_cargo' => 'asc');
        $this->id     = 'id_cargo';
    }
    
}