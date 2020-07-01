<?php


class Reporte_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

	public function get_categoria()
    {   
        $this->db->select('*');
        $this->db->from('categoria');
    	$query = $this->db->get();
        return $query->result();
    }
	public function get_torneo()
    {   
        $this->db->select('*');
        $this->db->from('torneo');
    	$query = $this->db->get();
        return $query->result();
    }
	public function get_inscripcion_equipo($id_categoria)
    {   
        $this->db->select('*');
        $this->db->from('inscripcionequipo');
		$this->db->where('id_categoria', $id_categoria);
    	$query = $this->db->get();
        return $query->result();
    }

	public function get_club($id_club)
    {   
        $this->db->select('*');
        $this->db->from('club');
		$this->db->where('id_club', $id_club);
    	$query = $this->db->get();
        return $query->result();
    }
    public function get_pagos_equipo($id_club,$id_categoria, $id_torneo)
    {   
        $sql = "select * from inscripcionequipo i
join pagogeneral pg on pg.id_inscripcionequipo = i.id_inscripcionequipo 
join pago p on p.id_pagogeneral = pg.id_pagogeneral
join club c on c.id_club = i.id_club 
join torneo t on t.id_torneo = i.id_torneo 
join categoria cat on i.id_categoria =cat.id_categoria
where t.id_torneo = '$id_torneo' and i.id_categoria = '$id_categoria' and c.id_club = '$id_club' and t.estado = 0";
        
		$query = $this->db->query($sql);
        return $query->result();
    }

	public function get_pago_general($id_inscripcionequipo)
    {   
        $this->db->select('*');
        $this->db->from('pagogeneral');
		$this->db->where('id_inscripcionequipo', $id_inscripcionequipo);
    	$query = $this->db->get();
        return $query->result();
    }

   	public function get_pago($id_pagogeneral)
    {   
        $this->db->select('*');
        $this->db->from('pago');
		$this->db->where('id_pagogeneral', $id_pagogeneral);
    	$query = $this->db->get();
        return $query->result();
    }
    public function get_pagos_equipo_detalle($id_precioconcepto)
    {   
        $sql = "SELECT con.nombre as concepto, m.descripcion FROM precio_concepto prc, categoria cat, motivo m, concepto con 
		WHERE prc.id_categoria=cat.id_categoria
		AND   prc.id_motivo=m.id_motivo
		AND   prc.id_concepto=con.id_concepto 
		AND   prc.id_precioconcepto='$id_precioconcepto'";
        
		$query = $this->db->query($sql);
        return $query->result();
    }

}