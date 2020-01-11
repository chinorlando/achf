<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Concepto_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'concepto';
        $this->column = array('id_concepto', 'nombre', 'fecha', 'estado');
        $this->order  = array('id_concepto' => 'asc');
        $this->id = 'id_concepto';

    }
    
}