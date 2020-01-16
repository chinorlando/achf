<?php

class MY_Model extends CI_Model
{
	public $table;
    public $column;
    public $order;
    public $id;

    public $column_jugador;
    public $order_jugador;

    public $column_curriculum;
    public $order_curriculum;

    function __construct()
    {
        parent::__construct();
    }

    public function _get_datatables_query_where($where)
    {
        $this->db->where($where);
        $this->db->from($this->table);
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

    public function _get_datatables_query()
    {
        $this->db->from($this->table);
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

    public function get_datatables()
    {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }





    //////////////////////////////////////////////////////////////////////

    public function get_datatables_jugador()
    {
        $this->_get_datatables_query_jugador();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }

    public function _get_datatables_query_jugador()
    {
        // $this->db->from($this->table);
        $this->get_datatables_jug();
        // print_r($this->get_datatables_jug());
        // exit();
        $i = 0;
        foreach ($this->column_jugador as $item) // loop column_jugador 
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

                if(count($this->column_jugador) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $column_jugador[$i] = $item; // set column_jugador array variable to order processing
            $i++;
        }
        if(isset($_POST['order'])) // here order_jugador processing
        {
            $this->db->order_by($column_jugador[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order_jugador))
        {
            $order_jugador = $this->order_jugador;
            $this->db->order_by(key($order_jugador), $order_jugador[key($order_jugador)]);
        }
    }

    public function get_datatables_jug()
    {
        $this->db->select('jugador.id_jugador, persona.id_persona, persona.nombres, persona.apellido_paterno, persona.apellido_materno, inscripcionjugador.posicion, categoria.nombre as nombre_categoria, club.nombre_club, jugador.estado');
        $this->db->from('jugador');
        $this->db->join('persona', 'persona.id_persona = jugador.id_persona');
        $this->db->join('inscripcionjugador', 'inscripcionjugador.id_jugador = jugador.id_jugador');
        $this->db->join('equipo', 'equipo.id_equipo = inscripcionjugador.id_equipo');
        $this->db->join('categoria', 'categoria.id_categoria = equipo.id_categoria');
        $this->db->join('club', 'club.id_club = equipo.id_club');
        // $query = $this->db->get();
        // return $query->result();
    }

    public function get_transferencias($id_jugador)
    {
        $this->db->select('transferencias.fecha, cp.nombre_club as nombre_club_proviene, cd.nombre_club as nombre_club_destino');
        $this->db->from('transferencias');
        $this->db->join('club cp', 'cp.id_club = transferencias.id_club');
        $this->db->join('club cd', 'cd.id_club = transferencias.id_club_destino');
        // $this->db->join('equipo ep', 'ep.id_equipo = transferencias.id_equipo');
        // $this->db->join('equipo ed', 'ed.id_equipo = transferencias.id_equipo_destino');
        $this->db->where('id_jugador', $id_jugador);
        $this->db->order_by('fecha', 'desc');
        $query = $this->db->get();
        return $query->result();
    }

    // public function get_equipos()
    // {
    //     $this->db->select('id_equipo, nombre_equipo');
    //     $this->db->from('equipo');
    //     $this->db->order_by('nombre_equipo', 'asc');
    //     $query = $this->db->get();
    //     return $query->result();
    // }
    public function get_clubs()
    {
        $this->db->select('id_club, nombre_club');
        $this->db->from('club');
        $this->db->order_by('nombre_club', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    // public function get_equipo_actual($id_jugador)
    // {
    //     $this->db->select('id_equipo_destino');
    //     $this->db->from('transferencias');
    //     $this->db->order_by('fecha', 'desc');
    //     $this->db->limit(1);
    //     $this->db->where('id_jugador', $id_jugador);
    //     $query = $this->db->get();
    //     return $query->row();
    // }
    public function get_club_actual($id_jugador)
    {
        $this->db->select('id_club_destino');
        $this->db->from('transferencias');
        $this->db->order_by('fecha', 'desc');
        $this->db->limit(1);
        $this->db->where('id_jugador', $id_jugador);
        $query = $this->db->get();
        return $query->row();
    }

    public function save_transferencia($dataTransferencia)
    {
        $this->db->insert('transferencias', $dataTransferencia);
    }

    ////////curriculum
    // public function get_datatables_curriculum()
    // {
    //     $this->_get_datatables_query_curriculum();
    //     if($_POST['length'] != -1)
    //     $this->db->limit($_POST['length'], $_POST['start']);
    //     $query = $this->db->get();
    //     return $query->result();
    // }

    // public function _get_datatables_query_curriculum()
    // {
    //     // $this->db->from($this->table);
    //     $this->get_datatables_curricu();
    //     // print_r($this->get_datatables_curricu());
    //     // exit();
    //     $i = 0;
    //     foreach ($this->column_curriculum as $item) // loop column_curriculum 
    //     {
    //         if($_POST['search']['value']) // if datatable send POST for search
    //         {
    //             if($i===0) // first loop
    //             {
    //                 $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND. 
    //                 $this->db->like($item, $_POST['search']['value']);
    //             }
    //             else
    //             {
    //                 $this->db->or_like($item, $_POST['search']['value']);
    //             }

    //             if(count($this->column_curriculum) - 1 == $i) //last loop
    //                 $this->db->group_end(); //close bracket
    //         }
    //         $column_curriculum[$i] = $item; // set column_curriculum array variable to order processing
    //         $i++;
    //     }
    //     if(isset($_POST['order'])) // here order_curriculum processing
    //     {
    //         $this->db->order_by($column_curriculum[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    //     } 
    //     else if(isset($this->order_curriculum))
    //     {
    //         $order_curriculum = $this->order_curriculum;
    //         $this->db->order_by(key($order_curriculum), $order_curriculum[key($order_curriculum)]);
    //     }
    // }

    // public function get_datatables_curricu()
    // {
    //     $this->db->select('jugador.id_jugador, persona.id_persona, persona.nombres, persona.apellido_paterno, persona.apellido_materno, jugador.posicion, jugador.categoria, jugador.club, jugador.estado');
    //     $this->db->from('jugador');
    //     $this->db->join('persona', 'persona.id_persona = jugador.id_persona');
    //     // $query = $this->db->get();
    //     // return $query->result();
    // }

    public function get_curriculum($id_jugador)
    {
        $this->db->select('cj.id_jugador, cj.informacion, cj.trayectoria, cj.logros, cj.palmares');
        $this->db->from('curriculo_jugador cj');
        $this->db->join('jugador', 'jugador.id_jugador = cj.id_jugador');
        $this->db->join('persona', 'persona.id_persona = jugador.id_persona');
        // $this->db->join('equipo ep', 'ep.id_equipo = cp.id_equipo');
        // $this->db->join('equipo ed', 'ed.id_equipo = cd.id_equipo');
        $this->db->where('jugador.id_jugador', $id_jugador);
        $this->db->order_by('cj.id_currijugador', 'desc');
        $query = $this->db->get();
        return $query->result();
    }

//     SELECT transferencias.fecha, ep.nombre_equipo as nombre_equipo_proviene, ed.nombre_equipo as nombre_equipo_destino from transferencias
//         JOIN club cp on cp.id_club = transferencias.id_club
//         JOIN club cd on cd.id_club = transferencias.id_club_destino
//         join equipo ep on ep.id_equipo = cp.id_equipo
//         join equipo ed on ed.id_equipo = cd.id_equipo
// WHERE id_jugador = 1
// ORDER BY fecha DESC


    // menu judador_categoria -> lista de jugador con su cateroria
    // curriculu_jugador -> lista dlo logros clubres que ha estado, 










    ///////////////////////////////////////////////////////////////////////

    ////////////////fixture begin ////////////////
    public function get_equipos_by_torneo($id_torneo)
    {
        // $this->db->select('inscripcion.num_bolo, club.nombre_club');
        $this->db->from('inscripcion');
        $this->db->join('equipo', 'equipo.id_equipo = inscripcion.id_equipo');
        // $this->db->join('torneo', 'torneo.id_torneo = inscripcion.id_torneo');
        $this->db->join('club', 'club.id_club = equipo.id_club');
        $this->db->where('inscripcion.id_torneo', $id_torneo);
        $query = $this->db->get();
        return $query->result();
    }

    public function save_partido($e1, $e2, $i)
    {
        $data = array(
            'id_inscripcion1' => $e1,
            'id_inscripcion2' => $e2,
            'jornada' => $i,
            // 'id_inscripcion1' => date("Y-m-d H:i:s"),
        );
        // print_r($data);

        // $this->db->insert('partidos', $data);
        // $idcab=$this->db->insert_id();
    }
    ////////////////fixture end //////////////////

    /////////////////////////rol de partidos begin ////////////////////////////////
    public function get_partidos()
    {
        $this->db->select('partidos.id_partidos, c1.nombre_club as local, c2.nombre_club as visitante, partidos.jornada, e1.id_equipo as id_eq1, e2.id_equipo id_eq2');
        $this->db->from('partidos');
        $this->db->join('inscripcion i1', 'i1.id_inscripcion = partidos.id_inscripcion1');
        $this->db->join('inscripcion i2', 'i2.id_inscripcion = partidos.id_inscripcion2');
        $this->db->join('equipo e1', 'e1.id_equipo = i1.id_equipo');
        $this->db->join('equipo e2', 'e2.id_equipo = i2.id_equipo');
        $this->db->join('club c1', 'c1.id_club = e1.id_club');
        $this->db->join('club c2', 'c2.id_club = e2.id_club');
        // $this->db->where('inscripcion.id_torneo', $id_torneo);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_jugadores_por_equipo($id_equipo)
    {
        // $this->db->select('partidos.id_partidos, c1.nombre_club as local, c2.nombre_club as visitante, partidos.jornada, e1.id_equipo as id_eq1, e2.id_equipo id_eq2');
        $this->db->from('equipo');
        $this->db->join('inscripcionjugador', 'inscripcionjugador.id_equipo = equipo.id_equipo');
        $this->db->where('equipo.id_equipo', $id_equipo);
        $query = $this->db->get();
        return $query->result();
    }
    /////////////////////////rol de partidos end //////////////////////////////////


    //////////////guardado de amarillas, rojas y goles begin ////////////////////////
    public function guardar_accion_model($acciones)
    {
        $this->db->insert('resultado_partido', $acciones);
    }
    //////////////guardado de amarillas, rojas y goles end //////////////////////////














    public function get_datatables_where($where)
    {
        $this->security->xss_clean($where);
        $this->_get_datatables_query_where($where);
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function count_filtered()
    {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function count_all()
    {
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    public function count_all_fechas($campo,$fecha1,$fecha2)
    {
        $this->db->from($this->table);
        $this->db->where($campo.' BETWEEN "'. date('Y-m-d', strtotime($fecha1)). '" and "'. date('Y-m-d', strtotime($fecha2)).'"');
        return $this->db->count_all_results();
    }

     public function count_all_where($where)
    {
        $this->db->from($this->table);
        $this->db->where($where);
        return $this->db->count_all_results();
    }

    public function count_all_where_fechas($where,$campo,$fecha1,$fecha2)
    {
        $this->db->from($this->table);
        $this->db->where($where);
        $this->db->where($campo.' BETWEEN "'. date('Y-m-d', strtotime($fecha1)). '" and "'. date('Y-m-d', strtotime($fecha2)).'"');
        return $this->db->count_all_results();
    }

    public function save($data)
    {
        $data = $this->security->xss_clean($data);
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }
    
    public function update($id,$data)
    {    
        $id = $this->security->xss_clean($id);
        $data = $this->security->xss_clean($data);
        //$this->db->where('id', $id);
        $this->db->where($this->id, $id);
        $res = $this->db->update($this->table, $data);
        return $res;
    }
    public function update_by_field($where,$data)
    {    
        $id = $this->security->xss_clean($where);
        $data = $this->security->xss_clean($data);
        $this->db->where($where);
        $res = $this->db->update($this->table, $data);
        return $res;
    }
    
    public function delete_by_id($id)
    {
        $id = $this->security->xss_clean($id);
        //$this->db->where('id', $id);
        $this->db->where($this->id, $id);
        $res = $this->db->delete($this->table);
        return $res;
    }
    
    public function delete_by_field($where)
    {
        $where = $this->security->xss_clean($where);
        $this->db->where($where);
        $res = $this->db->delete($this->table);
        return $res;
    }

    public function get_by_id($id)
    {
        $id = $this->security->xss_clean($id);
        //$this->db->where('id', $id);
        $this->db->where($this->id, $id);
        $query = $this->db->get($this->table);
        return $query->row();        
    }

    public function get_by_field_id($campo,$id)
    {
        $campo = $this->security->xss_clean($campo);
        $id = $this->security->xss_clean($id);
        $this->db->where($campo, $id);
        $query = $this->db->get($this->table);
        return $query->row();        
    }
    
    public function get_all()
    {    
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function get_all_by_desc($field,$type)
    {   
        $field = $this->security->xss_clean($field);
        $type  = $this->security->xss_clean($type);
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->order_by($field, $type);
        $query = $this->db->get(); 
        return $query->result();
    }

    public function get_row_by_field($where)
    {   
        $campo = $this->security->xss_clean($where);
        $this->db->where($where);
        $query = $this->db->get($this->table);
        return $query->row();
    }

    public function get_all_by_field_fechas($where,$campo,$fecha1,$fecha2)
    {   
        //$campo = $this->security->xss_clean($where);
        $this->db->where($where);
        $this->db->where($campo.' BETWEEN "'. date('Y-m-d', strtotime($fecha1)). '" and "'. date('Y-m-d', strtotime($fecha2)).'"');
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function get_all_by_fechas($campo,$fecha1,$fecha2)
    {   
        //$campo = $this->security->xss_clean($where);
        //$this->db->where($where);
        $this->db->where($campo.' BETWEEN "'. date('Y-m-d', strtotime($fecha1)). '" and "'. date('Y-m-d', strtotime($fecha2)).'"');
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function get_all_by_field($where)
    {   
        $campo = $this->security->xss_clean($where);
        $this->db->where($where);
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function get_all_by_field_order($where,$order)
    {   
        $campo = $this->security->xss_clean($where);
        $this->db->where($where);
        $this->db->order_by($order, "asc");
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function get_all_by_field_order_desc($where,$order)
    {   
        $campo = $this->security->xss_clean($where);
        $this->db->where($where);
        $this->db->order_by($order, "desc");
        $query = $this->db->get($this->table);
        return $query->result();
    }

    public function get_all_by_field_like($campo,$dato)
    {
        $campo = $this->security->xss_clean($campo);
        $dato  = $this->security->xss_clean($dato);
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->like($campo, $dato, 'both');
        $query = $this->db->get();
        return $query->result();
    }

    public function get_all_by_field_like_order($campo,$dato,$order)
    {
        $campo = $this->security->xss_clean($campo);
        $dato  = $this->security->xss_clean($dato);
        $order = $this->security->xss_clean($order);
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->like($campo, $dato, 'both');
        $this->db->order_by($order, "asc");
        $query = $this->db->get();
        return $query->result();
    }

    public function get_all_by_field_distinct($campo)
    {
        $campo = $this->security->xss_clean($campo);
        $this->db->select($campo);
        $this->db->distinct();
        $this->db->from($this->table);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_all_by_field_distinct_and_where($campo,$where)
    {
        $campo = $this->security->xss_clean($campo);
        $this->db->select($campo);
        $this->db->distinct();
        $this->db->where($where);
        $this->db->from($this->table);
        $query = $this->db->get();
        return $query->result();
    }
    //-------------------- Transaccionts -------------------------------------------------
    /* el ALgoritmo es el siguiente, este algoritmo es general
            CONTADOR
            ========
            [NUMERO] [int]

            Cada inicio de año, se pone el NUMERO=0
            Para asignar un numero consecutivo:
            1.- Abrir una transaccion
            2.- UPDATE CONTADOR Set NUMERO=NUMERO+1
            3.- Select NUMERO From CONTADOR.
            4.- Insertar registro en tabla FACTURA
            5.- Cerrar la transaccion
    */
    public function begin_transaction(){
        $this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(FALSE); # See Note 01. If you wish can remove as well
        /*
           Notes
           01.  By default Codeigniter runs all transactions in Strict Mode. When strict mode is enabled, if you are running multiple groups of transactions, if one group fails all groups will be rolled back. If strict mode is disabled, each group is treated independently, meaning a failure of one group will not affect any others.
        */
    }
    public function end_transaction(){
        $this->db->trans_complete(); # Completing transaction

        /*Optional*/

        if ($this->db->trans_status() === FALSE) {
            # Something went wrong.
            $this->db->trans_rollback();
            return FALSE;
        } 
        else {
            # Everything is Perfect. 
            # Committing data to the database.
            $this->db->trans_commit();
            return TRUE;
        }
    }
    //-------------------- Other get results sum, avg, count -----------------------------
    public function get_row_sum_where($campo,$where)
    {
        $campo = $this->security->xss_clean($campo);
        $where = $this->security->xss_clean($where);
        $this->db->select_sum($campo);
        $this->db->where($where);
        $this->db->from($this->table);
        $query = $this->db->get();
        return $query->row();
    }

    public function get_row_count_where($campo,$where)
    {
        $campo = $this->security->xss_clean($campo);
        $where = $this->security->xss_clean($where);
        $this->db->select($campo);
        $this->db->where($where);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }


    /////////////////////////////////////////////////////////////////////////

    /////////////////////////////////////////////////////////////////////////
}