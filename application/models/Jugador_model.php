<?php if (!defined('BASEPATH')) exit ('no direct script acces allowed');

class Jugador_model extends MY_Model {
	
	public function __construct()
	{
		parent::__construct();

		$this->table  = 'v_ficha_kardex';
		// $this->column = array('id_jugador', 'id_persona', 'n_registro_fbf', 'nombres', 'apellido_paterno', 'apellido_materno', 'categoria', 'lfpb_asociacion_liga_provincial', 'nacionalidad', 'estado_civil', 'ciudad', 'fecha_nacimiento', 'foto', 'nombre_padre', 'nombre_madre', 'edad', 'c_i', 'sexo', 'domicilio', 'procede_del_club', 'estado', 'posicion', 'estatura', 'peso');
		$this->column = array('id_jugador', 'id_persona', 'nombres', 'apellido_paterno', 'apellido_materno', 'posicion', 'nombre', 'nombre_club', 'estado');

		$this->order = array('id_jugador' => 'asc' );
		$this->id = 'id_jugador';

		$this->column_jugador = array('jugador.id_jugador', 'persona.id_persona', 'persona.nombres', 'persona.apellido_paterno', 'persona.apellido_materno', 'inscripcionjugador.posicion', 'nombre', 'club.nombre_club', 'jugador.estado');
		$this->order_jugador = array('id_jugador' => 'asc' );

	}

	public function get_jugador_by_id($id)
	{
		$this->db->select();
		$this->db->from('v_ficha_kardex');
		$this->db->where('id_jugador', $id);
		$query = $this->db->get();
		return $query->result();
	}
}