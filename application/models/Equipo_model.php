<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Equipo_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'Equipo';
        $this->column = array('id_equipo', 'nombre_equipo', 'direccion', 'ciudad', 'escudo', 'presidente', 'fecha_fundación', 'entrenador', 'observaciones', 'estado');
        $this->order  = array('id_equipo' => 'asc');
        $this->id = 'id_equipo';
    } 
}