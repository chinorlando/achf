<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Estadio_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'estadio';
        $this->column = array('id_estadio','nombreestadio','capacidad','ciudad','direccion','foto','fecha_inaguracion','estado');
        $this->order  = array('id_estadio' => 'asc');
        $this->id = 'id_estadio';

    }
    
}