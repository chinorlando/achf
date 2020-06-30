<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Equipo_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'Equipo';
        $this->column = array('id_club', 'nombre_completo', 'nombre_club', 'direccion', 'ciudad', 'escudo', 'fecha_fundación', 'estado');
        $this->order  = array('id_club' => 'asc');
        // $this->id = 'id_equipo';
    }

    public function get_datatables_equipo()
    {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }

    public function _get_datatables_query()
    {
        // $this->db->from($this->table);
        $this->get_club_query();
        $i = 0;
        foreach ($this->column as $item) // loop column 
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                if($i===0) // first loop
                {
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND. 
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }

                if(count($this->column) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $column[$i] = $item; // set column array variable to order processing
            $i++;
        }
        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($column[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }

    public function get_club_query()
    {
    	$this->db->select('c.id_club, concat(p.nombres, " ", p.apellido_paterno, " ", p.apellido_materno) as nombre_completo,  c.nombre_club, c.direccion, c.ciudad, c.escudo, c.fecha_fundacion, c.estado');
        $this->db->from('club c');
        $this->db->join('persona p', 'p.id_persona = c.id_personacargo');
    }

    public function count_all()
    {
        // $this->db->from($this->table);
        $this->get_club_query();
        return $this->db->count_all_results();
    }

    public function count_filtered()
    {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function get_by_id_equi($id)
    {
        $id = $this->security->xss_clean($id);
        //$this->db->where('id', $id);
        $this->db->where('id_club', $id);
        $query = $this->db->get('club');
        return $query->row();        
    }

    public function get_persona_pre()
    {
    	$this->db->select('id_persona, nombres, apellido_paterno, apellido_materno');
        $this->db->from('persona');
        $this->db->order_by('nombres', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

}