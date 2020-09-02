<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Curriculo_Jugador_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'curriculo_jugador';
		// $this->column = array('id_jugador', 'id_persona', 'nombres', 'apellido_paterno', 'apellido_materno', 'posicion', 'categoria', 'club', 'estado');

		// $this->order = array('id_jugador' => 'asc' );
		// $this->id = 'id_jugador';

		// $this->column_jugador = array('jugador.id_jugador', 'persona.id_persona', 'persona.nombres', 'persona.apellido_paterno', 'persona.apellido_materno', 'jugador.posicion', 'jugador.categoria', 'jugador.club', 'jugador.estado');
		// $this->order_jugador = array('id_jugador' => 'asc' );
    }


    public function update_curri($id_curri, $id_jugador, $data)
    {
    	$this->db->where('id_currijugador', $id_curri);
        $this->db->where('id_jugador', $id_jugador);
        $this->db->update($this->table, $data);
    }

    public function delete_by_id_curri($id_curri, $id_jugador)
    {
        $this->db->where('id_currijugador', $id_curri);
        $this->db->where('id_jugador', $id_jugador);
        $this->db->delete($this->table);
    }
    
}