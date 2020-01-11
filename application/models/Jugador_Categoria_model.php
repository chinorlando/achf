<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Jugador_Categoria_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'Jugador_Categoria';
        $this->column = array('id_jugcategoria', 'id_jugador', 'id_categoria', 'n_registro_fbf', 'nombre', 'apellido_paterno', 'apellido_materno', 'foto', 'estado');
        $this->order  = array('id_jugcategoria' => 'asc');
        $this->id = 'id_jugcategoria';

    }
    
}