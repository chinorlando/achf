<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Categoria_Arbitro_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'categoria_arbitro';
        $this->column = array('id_catarbitro','nombre', 'estado');
        $this->order  = array('id_catarbitro' => 'asc');
        $this->id = 'id_catarbitro';

    }
    
}