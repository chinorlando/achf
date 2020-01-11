<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Menu_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'menus';
        $this->column = array('id','id_menu_principal','nombre','directorio','icono','imagen','color','orden','estado');
        $this->order  = array('id' => 'asc');
    }
    
}