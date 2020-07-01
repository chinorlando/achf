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

		// $this->column_jugador = array('ij.dorsal', 'p.nombres', 'p.apellido_paterno', 'p.apellido_materno', 'p.foto', 'ij.posicion', 'nombre_categoria', 'c.nombre_club', 'j.estado');
        $this->column_jugador = array('j.id_jugador', 'ij.dorsal', 'p.nombres', 'p.apellido_paterno', 'p.apellido_materno', 'p.foto', 'ij.posicion', 'nombre_club', 'j.estado', 'p.fecha_nacimiento', 'j.c_i', 'j.n_registro_fbf', 'p.sexo', 'p.nacionalidad');

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

	public function save_ju($data, $dataJugador)
    {

    	$this->db->trans_start(true);
		
        $data = $this->security->xss_clean($data);
        $this->db->insert('persona', $data);
        $id_persona = $this->db->insert_id();

        $dataJugador['id_persona'] = $id_persona;
        $this->db->insert('jugador', $dataJugador);
        $id_jugador = $this->db->insert_id();

        $this->db->trans_complete();
    }

    public function get_by_id($id)
    {
        $id = $this->security->xss_clean($id);
        //$this->db->where('id', $id);
        $this->db->from('persona');
        $this->db->join('jugador', 'jugador.id_persona = persona.id_persona');
        $this->db->where('jugador.id_jugador', $id);
        $query = $this->db->get();
        return $query->row();        
    }

    public function count_all_ju()
    {
        $this->_get_datatables_query_jugador();
        return $this->db->count_all_results();
    }

    public function count_filtered_ju()
    {
        $this->_get_datatables_query_jugador();
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function update_ju($id,$data, $dataJugador)
    {    
    	$this->db->trans_start();
	        $id = $this->security->xss_clean($id);
	        $dataJugador = $this->security->xss_clean($dataJugador);

	        $this->db->where('id_jugador', $id);
	        $this->db->update('jugador', $dataJugador);

	        $this->db->from('jugador');
	        $this->db->where('id_jugador', $id);
	        $query = $this->db->get();
	        $id_persona = $query->row()->id_persona;

	        $data = $this->security->xss_clean($data);
	        $this->db->where('id_persona', $id_persona);
	        $res = $this->db->update('persona', $data);
        $this->db->trans_complete();
    }

    public function delete_by_id_ju($id)
    {
        $id = $this->security->xss_clean($id);
        //$this->db->where('id', $id);
        $this->db->where('id_jugador', $id);
        $res = $this->db->delete('jugador');

        $this->db->from('jugador');
        $this->db->where('id_jugador', $id);
        $query = $this->db->get();
        $id_persona = $query->row()->id_persona;

        $this->db->where('id_persona', $id_persona);
        $res = $this->db->delete('persona');
    }

    public function get_concepto_transferencia()
    {
        $query = $this->db->get('concepto', 2, 4);
        return $query->result();
    }


}