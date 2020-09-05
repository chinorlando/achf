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
        // $this->db->select('jugador.id_jugador, persona.id_persona, persona.nombres, persona.apellido_paterno, persona.apellido_materno, inscripcionjugador.posicion, categoria.nombre as nombre_categoria, club.nombre_club, jugador.estado');
        // $this->db->from('jugador');
        // $this->db->join('persona', 'persona.id_persona = jugador.id_persona');
        // $this->db->join('inscripcionjugador', 'inscripcionjugador.id_jugador = jugador.id_jugador');
        // $this->db->join('equipo', 'equipo.id_equipo = inscripcionjugador.id_equipo');
        // $this->db->join('categoria', 'categoria.id_categoria = equipo.id_categoria');
        // $this->db->join('club', 'club.id_club = equipo.id_club');
        // // $query = $this->db->get();
        // // return $query->result();


        // $this->db->select('jugador.id_jugador, persona.id_persona, persona.nombres, persona.apellido_paterno, persona.apellido_materno, i.posicion, categoria.nombre as nombre_categoria, club.nombre_club, jugador.estado');
        // $this->db->from('inscripcionjugador i');
        // $this->db->join('jugador', 'jugador.id_jugador = i.id_jugador');
        // $this->db->join('persona', 'persona.id_persona = i.id_jugador');
        // $this->db->join('equipo', 'equipo.id_equipo = i.id_equipo');
        // $this->db->join('club', 'club.id_club = equipo.id_club');
        // $this->db->join('categoria', 'categoria.id_categoria = equipo.id_categoria');

        // $this->db->select('j.id_jugador, ij.dorsal, p.nombres, p.apellido_paterno, p.apellido_materno, p.foto, ij.posicion, ct.nombre as nombre_categoria, c.nombre_club as nombre_club, j.estado');
        // $this->db->from('inscripcionjugador ij');
        // $this->db->join('equipo e', 'e.id_equipo = ij.id_equipo');
        // $this->db->join('club c', 'c.id_club = e.id_club');
        // $this->db->join('jugador j', 'j.id_jugador = ij.id_jugador');
        // $this->db->join('persona p', 'p.id_persona = j.id_persona');
        // $this->db->join('categoria ct', 'ct.id_categoria = e.id_categoria');

        // $this->db->select('j.id_jugador, ij.dorsal, p.nombres, p.apellido_paterno, p.apellido_materno, p.foto, ij.posicion, ct.nombre as nombre_categoria, c.nombre_club as nombre_club, j.estado, p.fecha_nacimiento, j.c_i, j.n_registro_fbf, p.sexo, p.nacionalidad');
        // $this->db->from('inscripcionjugador ij');
        // $this->db->join('inscripcionequipo e', 'e.id_inscripcionequipo = ij.id_inscripcionequipo');
        // $this->db->join('club c', 'c.id_club = e.id_club');
        // $this->db->join('jugador j', 'j.id_jugador = ij.id_jugador');
        // $this->db->join('persona p', 'p.id_persona = j.id_persona');
        // $this->db->join('categoria ct', 'ct.id_categoria = e.id_categoria');

        $this->db->select('j.id_jugador, ij.dorsal, p.nombres, p.apellido_paterno, p.apellido_materno, p.foto, ij.posicion, ct.nombre as nombre_categoria, c.nombre_club as nombre_club, j.estado, p.fecha_nacimiento, j.c_i, j.n_registro_fbf, p.sexo, p.nacionalidad, ct.nombre');
        $this->db->from('inscripcionjugador ij');
        $this->db->join('inscripcionequipo e', 'e.id_inscripcionequipo = ij.id_inscripcionequipo');
        $this->db->join('equipo eq', 'eq.id_equipo = e.id_equipo');
        $this->db->join('club c', 'c.id_club = eq.id_club');
        $this->db->join('jugador j', 'j.id_jugador = ij.id_jugador');
        $this->db->join('persona p', 'p.id_persona = j.id_persona');
        $this->db->join('categoria ct', 'ct.id_categoria = eq.id_categoria');
    }

    public function get_jug_pdf($id_jugador)
    {

        $this->db->select('j.id_jugador, ij.dorsal, p.nombres, p.apellido_paterno, p.apellido_materno, p.foto, ij.posicion, ct.nombre as nombre_categoria, c.nombre_club as nombre_club,
        j.estado, p.fecha_nacimiento, j.c_i, j.n_registro_fbf, p.sexo, p.nacionalidad, p.id_persona,p.fecha_nacimiento,p.ciudad,j.nombre_padre,j.nombre_madre,p.direccion,j.estado_civil');
        $this->db->from('inscripcionjugador ij');
        $this->db->join('inscripcionequipo e', 'e.id_inscripcionequipo = ij.id_inscripcionequipo');
        $this->db->join('equipo eq', 'eq.id_equipo = e.id_equipo');
        $this->db->join('club c', 'c.id_club = eq.id_club');
        $this->db->join('jugador j', 'j.id_jugador = ij.id_jugador');
        $this->db->join('persona p', 'p.id_persona = j.id_persona');
        $this->db->join('categoria ct', 'ct.id_categoria = eq.id_categoria');
        $this->db->where('j.id_jugador', $id_jugador);
        $query = $this->db->get();
        return $query->result();
    }
    public function get_jug_cat_pdf($id_club,$id_categoria)
    {

        $this->db->select('j.id_jugador, ij.dorsal, p.nombres, p.apellido_paterno, p.apellido_materno, p.foto, ij.posicion, ct.nombre as nombre_categoria, c.nombre_club as nombre_club,
        j.estado, p.fecha_nacimiento, j.c_i, j.n_registro_fbf, p.sexo, p.nacionalidad, p.id_persona,p.fecha_nacimiento,p.ciudad,j.nombre_padre,j.nombre_madre,p.direccion,j.estado_civil');
        $this->db->from('inscripcionjugador ij');
        $this->db->join('inscripcionequipo e', 'e.id_inscripcionequipo = ij.id_inscripcionequipo');
        $this->db->join('equipo eq', 'eq.id_equipo = e.id_equipo');
        $this->db->join('club c', 'c.id_club = eq.id_club');
        $this->db->join('jugador j', 'j.id_jugador = ij.id_jugador');
        $this->db->join('persona p', 'p.id_persona = j.id_persona');
        $this->db->join('categoria ct', 'ct.id_categoria = eq.id_categoria');
        $this->db->where('c.id_club', $id_club);
        $this->db->where('ct.id_categoria', $id_categoria);
        $query = $this->db->get();
        return $query->result();
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

    public function get_motivo_trasnferencia($id_concep_transf)
    {
        $this->db->select('pc.id_precioconcepto, motivo.id_motivo, motivo.descripcion');
        $this->db->from('precio_concepto pc');
        $this->db->join('motivo', 'motivo.id_motivo = pc.id_motivo');
        $this->db->where('id_concepto', $id_concep_transf);
        $this->db->where('id_categoria', 1);
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
    public function get_clubs($id_club)
    {
        // $this->db->distinct();
        $this->db->select('id_club, nombre_club');
        $this->db->from('club');
        $this->db->where('id_club <>', $id_club);
        $this->db->order_by('nombre_club', 'asc');

        $query = $this->db->get();
        return $query->result();
    }

    public function get_all_clubs()
    {
        $this->db->distinct();
        $this->db->select('c.id_club, c.nombre_club');
        $this->db->from('inscripcionequipo i');
        $this->db->join('equipo eq', 'eq.id_equipo = i.id_equipo');
        $this->db->join('club c', 'c.id_club = eq.id_club');
        $this->db->join('torneo t', 't.id_torneo = i.id_torneo');
        $this->db->order_by('c.nombre_club', 'asc');

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
        // $this->db->select();
        $this->db->from('inscripcionjugador i');
        $this->db->join('inscripcionequipo', 'inscripcionequipo.id_inscripcionequipo =i.id_inscripcionequipo');
        $this->db->join('equipo eq', 'eq.id_equipo = inscripcionequipo.id_equipo');
        $this->db->join('club', 'club.id_club  = eq.id_club');
        // $this->db->order_by('fecha', 'desc');
        // $this->db->limit(1);
        $this->db->where('i.id_jugador', $id_jugador);
        $query = $this->db->get();
        return $query->row();
    }

    public function save_transferencia($dataTransferencia)
    {
        $this->db->insert('transferencias', $dataTransferencia);
    }

    public function update_inscripcionjugador($id_jugador, $id_equipoproviene, $datos)
    {
        $this->db->where('id_jugador', $id_jugador);
        $this->db->where('id_inscripcionequipo', $id_equipoproviene);
        $this->db->update('inscripcionjugador', $datos);
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
        $this->db->select('cj.id_currijugador, cj.id_jugador, cj.informacion, cj.trayectoria, cj.logros, cj.palmares');
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
    ////////////////asignacion bolos begin ////////////////
    public function update_inscripcionequipo($id_club, $id_torneo, $id_categoria, $datos)
    {
        // $this->db->join('equipo eq', 'eq.id_equipo = i.id_equipo');
        // $this->db->where('eq.id_club', $id_club);
        // $this->db->where('i.id_torneo', $id_torneo);
        // $this->db->update('inscripcionequipo i', $datos);

        $sql = 'UPDATE inscripcionequipo i
                INNER JOIN equipo eq ON eq.id_equipo = i.id_equipo
                SET num_bolo = ?
                WHERE i.id_inscripcionequipo = ? AND i.id_torneo = ? and eq.id_categoria = ?';
        $query = $this->db->query($sql, array($datos['num_bolo'], $id_club, $id_torneo, $id_categoria));
    }

    ////////////////asignacion bolos end ////////////////    

    ////////////////fixture begin ////////////////
    public function get_equipos_by_torneo($id_torneo, $id_categoria)
    {
        // // $this->db->select('inscripcion.num_bolo, club.nombre_club');
        // $this->db->from('inscripcion');
        // $this->db->join('equipo', 'equipo.id_equipo = inscripcion.id_equipo');
        // // $this->db->join('torneo', 'torneo.id_torneo = inscripcion.id_torneo');
        // $this->db->join('club', 'club.id_club = equipo.id_club');
        // $this->db->where('inscripcion.id_torneo', $id_torneo);

        // $this->db->select('inscripcion.num_bolo, club.nombre_club');
        $this->db->from('inscripcionequipo ie');
        $this->db->join('equipo eq', 'eq.id_equipo = ie.id_equipo');
        $this->db->join('club', 'club.id_club = eq.id_club');
        $this->db->where('ie.id_torneo', $id_torneo);
        $this->db->where('eq.id_categoria', $id_categoria);

        $query = $this->db->get();
        return $query->result();
    }

    public function get_equipos_by_torneo_1($id_torneo, $id_categoria)
    {
        // $this->db->select('inscripcion.num_bolo, club.nombre_club');
        $this->db->from('inscripcionequipo ie');
        $this->db->join('equipo eq', 'eq.id_equipo = ie.id_equipo');
        // $this->db->join('equipo', 'equipo.id_equipo = inscripcion.id_equipo');
        // $this->db->join('torneo', 'torneo.id_torneo = inscripcion.id_torneo');
        $this->db->join('club', 'club.id_club = eq.id_club');
        // $this->db->join('categoriasorteado', 'categoriasorteado.id_torneo = ie.id_torneo');
        // $this->db->join('campeonato', 'campeonato.id_campeonato = torneosorteado.id_campeonato');
        $this->db->where('ie.id_torneo', $id_torneo);
        $this->db->where('eq.id_categoria', $id_categoria);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_campeonato_actual()
    {
        $this->db->select('id_campeonato');
        $this->db->from('campeonato');
        $this->db->where('estado', '0');
        $this->db->order_by('id_campeonato', 'desc');
        $this->db->limit(1);
        $query = $this->db->get();
        return $query->row();
    }

    public function counttorneo($id_torneo, $id_categoria) // , $id_campeonato
    {
        $this->db->from('categoriasorteado');
        $this->db->where('id_torneo', $id_torneo);
        $this->db->where('id_categoria', $id_categoria);
        // $this->db->where('accion', $accion);
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function save_categoriasorteo($date)
    {
        $this->db->insert('categoriasorteado', $date);
    }

    public function update_categoriasorteado($id_torneo, $id_categoria, $data)
    {
        $this->db->where('id_torneo', $id_torneo);
        $this->db->where('id_categoria', $id_categoria);
        $this->db->update('categoriasorteado', $data);
    }

    public function save_partido($e1, $e2, $i, $id_torneo)
    {
        $data = array(
            'id_inscripcion1' => $e1,
            'id_inscripcion2' => $e2,
            'jornada' => $i,
            'id_torneo' => $id_torneo,
            // 'id_inscripcion1' => date("Y-m-d H:i:s"),
        );
        // print_r($data);
        // exit();

        // TODO: descomentara la siguiente linea para guardar los partidos sorteados
        $this->db->insert('partidos', $data);
        // $idcab=$this->db->insert_id();
    }
    ////////////////fixture end //////////////////

    /////////////////////////rol de partidos begin ////////////////////////////////
    public function get_all_partidos()
    {
        $this->db->select('partidos.id_partidos, partidos.fecha, c1.nombre_club as local, c2.nombre_club as visitante, partidos.jornada, i1.id_inscripcionequipo as id_eq1, i2.id_inscripcionequipo as id_eq2,partidos.id_estadio,partidos.id_planillero, e1.id_categoria');
        $this->db->from('partidos');
        $this->db->join('inscripcionequipo i1', 'i1.id_inscripcionequipo = partidos.id_inscripcion1');
        $this->db->join('inscripcionequipo i2', 'i2.id_inscripcionequipo = partidos.id_inscripcion2');
        $this->db->join('equipo e1', 'e1.id_equipo = i1.id_equipo');
        $this->db->join('equipo e2', 'e2.id_equipo = i2.id_equipo');
        $this->db->join('club c1', 'c1.id_club = e1.id_club');
        $this->db->join('club c2', 'c2.id_club = e2.id_club');
        // $this->db->where('e1.id_categoria', $id_categoria);
        // $this->db->where('e2.id_categoria', $id_categoria);
        $this->db->order_by('partidos.jornada');
        $this->db->order_by('partidos.fecha');
        $query = $this->db->get();
        return $query->result();
    }
    public function get_partidos($id_categoria)
    {
        // $this->db->select('partidos.id_partidos, partidos.fecha, c1.nombre_club as local, c2.nombre_club as visitante, partidos.jornada, e1.id_equipo as id_eq1, e2.id_equipo id_eq2');
        // $this->db->from('partidos');
        // $this->db->join('inscripcion i1', 'i1.id_inscripcion = partidos.id_inscripcion1');
        // $this->db->join('inscripcion i2', 'i2.id_inscripcion = partidos.id_inscripcion2');
        // $this->db->join('equipo e1', 'e1.id_equipo = i1.id_equipo');
        // $this->db->join('equipo e2', 'e2.id_equipo = i2.id_equipo');
        // $this->db->join('club c1', 'c1.id_club = e1.id_club');
        // $this->db->join('club c2', 'c2.id_club = e2.id_club');
        // $this->db->order_by('partidos.jornada, partidos.fecha');
        // // $this->db->where('inscripcion.id_torneo', $id_torneo);

        $this->db->select('partidos.id_partidos, partidos.fecha, c1.nombre_club as local, c2.nombre_club as visitante, partidos.jornada, i1.id_inscripcionequipo as id_eq1, i2.id_inscripcionequipo as id_eq2,partidos.id_estadio,partidos.id_planillero, e1.id_categoria');
        $this->db->from('partidos');
        $this->db->join('inscripcionequipo i1', 'i1.id_inscripcionequipo = partidos.id_inscripcion1');
        $this->db->join('inscripcionequipo i2', 'i2.id_inscripcionequipo = partidos.id_inscripcion2');
        $this->db->join('equipo e1', 'e1.id_equipo = i1.id_equipo');
        $this->db->join('equipo e2', 'e2.id_equipo = i2.id_equipo');
        $this->db->join('club c1', 'c1.id_club = e1.id_club');
        $this->db->join('club c2', 'c2.id_club = e2.id_club');
        $this->db->where('e1.id_categoria', $id_categoria);
        $this->db->where('e2.id_categoria', $id_categoria);
        $this->db->order_by('partidos.jornada');
        $this->db->order_by('partidos.fecha');
        $query = $this->db->get();
        return $query->result();
    }
    public function get_partidos_by_id($id_partidos)
    {
        $this->db->select('partidos.id_partidos, partidos.fecha, c1.nombre_club as local, c2.nombre_club as visitante, partidos.jornada, i1.id_inscripcionequipo as id_eq1, i2.id_inscripcionequipo as id_eq2,partidos.id_estadio,partidos.id_planillero,partidos.observaciones');
        $this->db->from('partidos');
        $this->db->join('inscripcionequipo i1', 'i1.id_inscripcionequipo = partidos.id_inscripcion1');
        $this->db->join('inscripcionequipo i2', 'i2.id_inscripcionequipo = partidos.id_inscripcion2');
        $this->db->join('equipo e1', 'e1.id_equipo = i1.id_equipo');
        $this->db->join('equipo e2', 'e2.id_equipo = i2.id_equipo');
        $this->db->join('club c1', 'c1.id_club = e1.id_club');
        $this->db->join('club c2', 'c2.id_club = e2.id_club');
        $this->db->where('partidos.id_partidos', $id_partidos);
        $this->db->order_by('partidos.jornada');
        $this->db->order_by('partidos.fecha');
        $query = $this->db->get();
        return $query->result();
    }

    public function get_club_equipo($id_equipo)
    {
        $this->db->from('inscripcionequipo ie');
        $this->db->join('equipo eq', 'eq.id_equipo = ie.id_equipo');
        $this->db->join('club', 'club.id_club = eq.id_club');
        
        $this->db->where('ie.id_inscripcionequipo', $id_equipo);
        $query = $this->db->get();
        return $query->row();
    }
    public function get_jugadores_por_equipo($id_equipo, $id_partidos, $id_categoria)
    {
        // $this->db->from('inscripcionequipo');
        // $this->db->join('inscripcionjugador', 'inscripcionjugador.id_inscripcionequipo = inscripcionequipo.id_inscripcionequipo');
        // $this->db->join('equipo eq', 'eq.id_equipo = inscripcionequipo.id_equipo');
        // $this->db->join('habilitado', 'habilitado.id_jugador = inscripcionjugador.id_jugador');
        // $this->db->where('inscripcionequipo.id_inscripcionequipo', $id_equipo);
        // $this->db->where('habilitado.id_partidos', $id_partidos);
        // $this->db->order_by('inscripcionjugador.posicion');

        $this->db->from('jugador j');
        $this->db->join('inscripcionjugador ij', 'ij.id_jugador = j.id_jugador');
        $this->db->join('inscripcionequipo ie', 'ie.id_equipo = ij.id_inscripcionequipo');
        $this->db->join('equipo e', 'e.id_equipo = ie.id_equipo');
        $this->db->join('club c', 'c.id_club = e.id_club');
        // $this->db->where('c.id_club', $id_equipo);
        $this->db->where('ie.id_inscripcionequipo', $id_equipo);
        $this->db->where('e.id_categoria', $id_categoria);
        $this->db->order_by('ij.dorsal');

        $query = $this->db->get();
        return $query->result();
    }

    public function get_jugadores_por_equipo_hab($id_equipo, $id_partidos)
    {
        // $this->db->from('inscripcionequipo');
        // $this->db->join('equipo eq', 'eq.id_equipo = inscripcionequipo.id_equipo');
        // $this->db->join('inscripcionjugador', 'inscripcionjugador.id_inscripcionequipo = inscripcionequipo.id_inscripcionequipo');
        // // $this->db->join('habilitado', 'habilitado.id_jugador = inscripcionjugador.id_jugador');
        // $this->db->where('inscripcionequipo.id_inscripcionequipo', $id_equipo);
        // // $this->db->where('habilitado.id_partidos', $id_partidos);
        // $this->db->order_by('inscripcionjugador.posicion');

        $this->db->from('inscripcionequipo');
        $this->db->join('inscripcionjugador', 'inscripcionjugador.id_inscripcionequipo = inscripcionequipo.id_inscripcionequipo');
        $this->db->join('equipo eq', 'eq.id_equipo = inscripcionequipo.id_equipo');
        $this->db->join('habilitado', 'habilitado.id_jugador = inscripcionjugador.id_jugador');
        $this->db->where('inscripcionequipo.id_inscripcionequipo', $id_equipo);
        $this->db->where('habilitado.id_partidos', $id_partidos);
        $this->db->order_by('inscripcionjugador.posicion');

        $query = $this->db->get();
        return $query->result();
    }

    /////////////////////////rol de partidos end //////////////////////////////////


    //////////////guardado de amarillas, rojas y goles begin ////////////////////////
    public function guardar_accion_model($acciones)
    {
        $this->db->insert('resultado_partido', $acciones);
    }

    public function update_cont_yellow($id_jugador, $add_or_rest)
    {
        $cont_y = $this->db->get_where('jugador', array('id_jugador' => $id_jugador,))->row()->cont_amarilla;

        $cont_y = ($add_or_rest == 'add') ? $cont_y + 1 : $cont_y - 1;

        $cont_y = ($cont_y == 11) ? 1 : $cont_y;

        $datos = [
            'cont_amarilla' => $cont_y,
        ];

        $this->db->where('id_jugador', $id_jugador);
        $res = $this->db->update('jugador', $datos);
    }
    //////////////guardado de amarillas, rojas y goles end //////////////////////////

    //////////////////pago de amarillas///////////////////
    public function players_yellow($id_partido, $id_e)
    {
        $sql = "select rp.id_jugador, inscripcionjugador.dorsal, persona.nombres, persona.apellido_paterno, persona.apellido_materno 
            from resultado_partido rp
            join inscripcionjugador on inscripcionjugador.id_jugador = rp.id_jugador 
            join jugador on jugador.id_jugador = rp.id_jugador 
            join persona on persona.id_persona = jugador.id_persona 
            where accion = 1 and pagado = 0 and rp.id_partidos = ? and inscripcionjugador.id_inscripcionequipo = ?
            group BY rp.id_jugador, inscripcionjugador.dorsal, persona.nombres, persona.apellido_paterno, persona.apellido_materno";

        $query = $this->db->query($sql, array($id_partido, $id_e)); 
        return $query->result();
    }

    public function id_categoria_jugador($id_jugador)
    {
        // $sql = 'select c.id_categoria from inscripcionjugador i 
        //     join equipo e on  e.id_equipo  = i.id_equipo 
        //     join categoria c on c.id_categoria = e.id_categoria
        //     where i.id_jugador = ?';
        $sql = 'select c.id_categoria 
            from inscripcionjugador i 
            join inscripcionequipo e on  e.id_inscripcionequipo  = i.id_inscripcionequipo
            join equipo eq on eq.id_equipo = e.id_equipo
            join categoria c on c.id_categoria = eq.id_categoria
            where i.id_jugador = ?';
        $query = $this->db->query($sql, array($id_jugador));
        return $query->row();
    }

    public function get_precio_by_categoria_and_concepto($id_categoria, $id_concepto, $i)
    {
        $sql = 'select * from precio_concepto pc
            join motivo m on m.id_motivo = pc.id_motivo 
            where pc.id_categoria = ? and pc.id_concepto = ? and m.descripcion = "'.$i.' AMARILLA"';
        $query = $this->db->query($sql, array($id_categoria, $id_concepto));
        return $query->row();
    }


    public function list_yc_by_player($id_jugador, $accion)
    {
        $this->db->from('resultado_partido');
        $this->db->where('id_jugador', $id_jugador);
        $this->db->where('accion', $accion);
        $this->db->order_by('id_resultadopartido', 'asc');
        $query = $this->db->get();
        return $query->result();
    }

    // ya no necesitamos este metodo
    // public function lista_yellos_db()
    // {
    //     $sql = 'select  * from precio_concepto pc
    //         join categoria on categoria.id_categoria = pc.id_categoria
    //         join motivo on motivo.id_motivo = pc.id_motivo 
    //         where categoria.id_categoria = ? and pc.id_concepto = ?';
    //     $query = $this->db->query($sql, array(1, 7)); 
    //     return $query->result();
    // }

    public function lista_yellos_db_pago_concepto($id_categoria, $id_concepto)
    {
        $sql = 'select  * from precio_concepto pc
            join categoria on categoria.id_categoria = pc.id_categoria
            join motivo on motivo.id_motivo = pc.id_motivo 
            where categoria.id_categoria = ? and pc.id_concepto = ?';
        $query = $this->db->query($sql, array($id_categoria, $id_concepto)); 
        return $query->result();
    }

    public function update_resultado_partido($id_ju, $id_partidos, $datos)
    {
        // $this->db->limit(1);
        // $this->db->where('id_jugador', $id_ju);
        // $this->db->where('id_partidos', $id_partidos);
        // $this->db->where('accion', 1);
        // $this->db->where('pagado', 0);
        // $res = $this->db->update('jugador', $datos);

        $sql = "UPDATE resultado_partido
                set pagado = 1
                WHERE id_jugador = ? and id_partidos = ? and accion = 1 and pagado = 0
                limit 1";

        $this->db->query($sql, array($id_ju, $id_partidos)); 
        // return $query->result();
    }

    //////////////////pago de amarillas///////////////////

    

    //// editar planilla
    public function verificar_partido($id_partido, $id_jugador, $accion)
    {
        $this->db->from('resultado_partido');
        $this->db->where('id_partidos', $id_partido);
        $this->db->where('id_jugador', $id_jugador);
        $this->db->where('accion', $accion);
        $query = $this->db->get();
        return $query->num_rows();
    }
    //// editar planilla

    ///// contador de amarillas de jugador
    public function count_y_c($id_partido, $id_jugador, $accion)
    {
        $this->db->from('resultado_partido');
        $this->db->where('id_partidos', $id_partido);
        $this->db->where('id_jugador', $id_jugador);
        $this->db->where('accion', $accion);
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function save_suspencion($cantpart, $motivo, $id_jugador, $id_partido)
    {
        $datos = [
            'cantpart' => $cantpart,
            'motivo' => $motivo,
            'id_jugador' => $id_jugador,
            'id_partidos' => $id_partido,
        ];
        $this->db->insert('suspencion', $datos);
    }

    ///// contador de amarillas de jugadro

    public function get_yellow_jugador($id_jugador, $id_partido, $accion)
    {
        // $this->db->select('partidos.id_partidos, c1.nombre_club as local, c2.nombre_club as visitante, partidos.jornada, e1.id_equipo as id_eq1, e2.id_equipo id_eq2');
        $this->db->from('resultado_partido');
        $this->db->where('id_jugador', $id_jugador);
        $this->db->where('id_partidos', $id_partido);
        $this->db->where('accion', $accion);
        $query = $this->db->get();
        return $query->result();
    }

    //////////////eliminacion de amarillas, rojas y goles end //////////////////////////
    public function delete_accion($id_partido, $id_jugador, $accion)
    {
        $this->db->order_by('id_resultadopartido', 'desc');
        $this->db->limit(1);
        $this->db->where('id_jugador', $id_jugador);
        $this->db->where('id_partidos', $id_partido);
        $this->db->where('accion', $accion);
        $this->db->delete('resultado_partido');
    }
    //////////////eliminacion de amarillas, rojas y goles end //////////////////////////

    /////////////////////// tabla de posiciones ////////////////////
    public function obtener_goles($id_partido, $equipo)
    {
        // $sql = "select count(*) as score
        //         from resultado_partido
        //         join inscripcionjugador on inscripcionjugador.id_jugador = resultado_partido.id_jugador
        //         join equipo on equipo.id_equipo = inscripcionjugador.id_equipo
        //         join club on club.id_club = equipo.id_club
        //         where resultado_partido.id_partidos = ? and club.id_club = ? and resultado_partido.accion = 3";

        $sql = "select count(*) as score
            from resultado_partido
            join inscripcionjugador on inscripcionjugador.id_jugador = resultado_partido.id_jugador
            join inscripcionequipo e on e.id_inscripcionequipo = inscripcionjugador.id_inscripcionequipo
            join equipo eq on eq.id_equipo = e.id_equipo
            join club on club.id_club = eq.id_club
            where resultado_partido.id_partidos = ? and club.id_club = ? and resultado_partido.accion = 3";
        $query = $this->db->query($sql, array($id_partido, $equipo)); 
        return $query->result();
    }

    public function get_fin($id_partidos)
    {
        $this->db->from('partidos');
        $this->db->where('id_partidos', $id_partidos);
        $this->db->where('estado', 1);
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function update_partido($id_partido)
    {   //$data = 
        $this->db->where('id_partidos', $id_partido);
        $res = $this->db->update('partidos', ['estado'=>1]);
        return $res;
    }

    public function save_game($game)
    {
        $this->db->insert('games', $game);
    }

    public function get_nombre_club($id_equipo)
    {
        // $this->db->select('club.id_club');
        $this->db->from('inscripcionequipo i');
        $this->db->join('equipo e', 'e.id_equipo = i.id_equipo');
        $this->db->join('club', 'club.id_club = e.id_club');
        $this->db->where('i.id_inscripcionequipo', $id_equipo);
        $query = $this->db->get();
        return $query->row();
    }

    public function get_table()
    {
        // $sql = "SELECT
        //       nombre_club AS equipo, Sum(P) AS PJ,Sum(W) AS G,Sum(D) AS E,Sum(L) AS P,
        //       SUM(F) as GF,SUM(A) AS GC,SUM(GD) AS GD,SUM(Pts) AS Pts
        //     FROM(
        //       SELECT
        //         id_equipo_h,
        //         1 P,
        //         IF(hscore > ascore,1,0) W,
        //         IF(hscore = ascore,1,0) D,
        //         IF(hscore < ascore,1,0) L,
        //         hscore F,
        //         ascore A,
        //         hscore-ascore GD,
        //         CASE WHEN hscore > ascore THEN 3 WHEN hscore = ascore THEN 1 ELSE 0 END PTS
        //       FROM games
        //       UNION ALL
        //       SELECT
        //         id_equipo_a,
        //         1,
        //         IF(hscore < ascore,1,0),
        //         IF(hscore = ascore,1,0),
        //         IF(hscore > ascore,1,0),
        //         ascore,
        //         hscore,
        //         ascore-hscore GD,
        //         CASE WHEN hscore < ascore THEN 3 WHEN hscore = ascore THEN 1 ELSE 0 END
        //       FROM games
        //     ) as tot
        //     JOIN equipo t ON tot.id_equipo_h=t.id_equipo
        //     JOIN club cl on cl.id_club = t.id_club

        //     GROUP BY equipo
        //     ORDER BY SUM(Pts) DESC ";

        $sql = "SELECT
              nombre_club AS equipo, Sum(P) AS PJ,Sum(W) AS G,Sum(D) AS E,Sum(L) AS P,
              SUM(F) as GF,SUM(A) AS GC,SUM(GD) AS GD,SUM(Pts) AS Pts
            FROM(
              SELECT
                id_equipo_h,
                1 P,
                IF(hscore > ascore,1,0) W,
                IF(hscore = ascore,1,0) D,
                IF(hscore < ascore,1,0) L,
                hscore F,
                ascore A,
                hscore-ascore GD,
                CASE WHEN hscore > ascore THEN 3 WHEN hscore = ascore THEN 1 ELSE 0 END PTS
              FROM games
              UNION ALL
              SELECT
                id_equipo_a,
                1,
                IF(hscore < ascore,1,0),
                IF(hscore = ascore,1,0),
                IF(hscore > ascore,1,0),
                ascore,
                hscore,
                ascore-hscore GD,
                CASE WHEN hscore < ascore THEN 3 WHEN hscore = ascore THEN 1 ELSE 0 END
              FROM games
            ) as tot
            JOIN inscripcionequipo t ON tot.id_equipo_h=t.id_inscripcionequipo
            JOIN equipo e ON e.id_equipo = t.id_equipo
            JOIN club cl on cl.id_club = e.id_club

            GROUP BY equipo
            ORDER BY SUM(Pts) DESC ";
        $query = $this->db->query($sql); 
        return $query->result();
    }

    public function get_gol_equipo($id_partidos, $id_e)
    {
        // $sql = 'select count(*) as gol
        //         from resultado_partido
        //         join inscripcionjugador on inscripcionjugador.id_jugador = resultado_partido.id_jugador
        //         join equipo on equipo.id_equipo = inscripcionjugador.id_equipo
        //         join club on club.id_club = equipo.id_club
        //         where resultado_partido.id_partidos = ? and club.id_club = ? and resultado_partido.accion = 3
        //         ';
        $sql = 'select count(*) as gol
            from resultado_partido
            join inscripcionjugador on inscripcionjugador.id_jugador = resultado_partido.id_jugador
            join inscripcionequipo e on e.id_inscripcionequipo = inscripcionjugador.id_inscripcionequipo
            join equipo eq on eq.id_equipo = e.id_equipo
            join club on club.id_club = eq.id_club
            where resultado_partido.id_partidos = ? and club.id_club = ? and resultado_partido.accion = 3';
        $query = $this->db->query($sql,array($id_partidos, $id_e)); 
        return $query->result();
    }
    /////////////////////// tabla de posiciones ////////////////////

    /////////////////////// asignacion de arbitros begin  ////////////////////

    public function get_arbitro($where)
    {
        $this->db->from('arbitro');
        $this->db->join('persona', 'persona.id_persona = arbitro.id_persona');
        $this->db->join('categoria_arbitro ca', 'ca.id_catarbitro = arbitro.id_catarbitro');
        $this->db->where('ca.nombre', $where);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_planillero()
    {
        $this->db->from('planillero');
        $this->db->join('persona', 'persona.id_persona = planillero.id_persona');
        $query = $this->db->get();
        return $query->result();
    }

    public function get_estadio()
    {
        $this->db->from('estadio');
        $query = $this->db->get();
        return $query->result();
    }
    public function get_estadio_by_id($id_estadio)
    {
        $this->db->select('nombreestadio');
        $this->db->from('estadio');
        $this->db->where('id_estadio',$id_estadio);
        $query = $this->db->get();
        return $query->result();
    }
    public function get_arbitro_by_id($id_arbitro)
    {
        $this->db->select('p.nombres,p.apellido_paterno,p.apellido_materno');
        $this->db->from('arbitro');
        $this->db->join('persona p', 'p.id_persona = arbitro.id_persona');
        $this->db->join('categoria_arbitro ca', 'ca.id_catarbitro = arbitro.id_catarbitro');
        $this->db->where('arbitro.id_arbitro', $id_arbitro);
        $query = $this->db->get();
        return $query->result();
    }
    public function get_planillero_by_id($id_planillero)
    {
        $this->db->select('p.nombres,p.apellido_paterno,p.apellido_materno,planillero.observaciones');
        $this->db->from('planillero');
        $this->db->join('persona p', 'p.id_persona = planillero.id_persona');
        $this->db->where('planillero.id_planillero', $id_planillero);
        $query = $this->db->get();
        return $query->result();
    }
    public function save_arbitro($datos)
    {
        $this->db->insert('arbitro_partido', $datos);
    }

    public function update_planillero($where, $datos)
    {
        $this->db->where('id_partidos', $where);
        $this->db->update('partidos', $datos);
    }

    public function get_siexiste($id_partido)
    {
        $this->db->from('arbitro_partido');
        $this->db->where('id_partidos',$id_partido);
        $query = $this->db->get();

        if ($query->row()) {
            return true;
        } else {
            return false;
        }
    }

    public function get_arbitropartido($id_partido)
    {
        $this->db->from('arbitro_partido');
        $this->db->where('id_partidos',$id_partido);
        $query = $this->db->get();

        // return $query->row();
        return $query->result();
    }

    public function get_planille($id_partido)
    {
        $this->db->from('partidos');
        $this->db->where('id_partidos',$id_partido);
        $query = $this->db->get();

        return $query->row();
        // return $query->result();
    }

    public function delete_arbitro($id_partido)
    {
        $this->db->where('id_partidos', $id_partido);
        $this->db->delete('arbitro_partido');
    }
    /////////////////////// asignacion de arbitros end ///////////////////////

    ///////////////////// pagos begin ///////////////////////
    public function get_categoria($id_club)
    {
        $this->db->from('categoria c');
        $this->db->join('equipo eq', 'eq.id_categoria = c.id_categoria');
        $this->db->join('inscripcionequipo e', 'e.id_equipo = eq.id_equipo');
        $this->db->join('club', 'club.id_club = eq.id_club');
        $this->db->where('club.id_club',$id_club);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_categoria_inscripcion($id_club)
    {
        $this->db->from('equipo eq');
        $this->db->join('categoria c', 'c.id_categoria = eq.id_categoria');
        // $this->db->join('inscripcionequipo e', 'e.id_equipo = eq.id_equipo');
        // $this->db->join('club', 'club.id_club = eq.id_club');
        $this->db->where('eq.id_club',$id_club);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_categoria_by_jugador($id_jugador, $id_club)
    {
        $this->db->from('equipo eq');
        $this->db->join('inscripcionequipo e', 'e.id_equipo = eq.id_equipo');
        $this->db->join('inscripcionjugador j', 'j.id_inscripcionequipo = e.id_inscripcionequipo');
        $this->db->where('eq.id_club', $id_club);
        $this->db->where('j.id_jugador',$id_jugador);
        $query = $this->db->get();
        return $query->row();
    }

    public function get_conceptos()
    {
        $this->db->from('concepto');
        // $this->db->join('equipo', 'equipo.id_categoria = categoria.id_categoria');
        // $this->db->join('club', 'club.id_club = equipo.id_club');
        // $this->db->where('club.id_club',$id_club);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_monto($id_categoria, $id_concepto)
    {
        $this->db->from('precio_concepto');
        // $this->db->join('equipo', 'equipo.id_categoria = categoria.id_categoria');
        // $this->db->join('club', 'club.id_club = equipo.id_club');
        $this->db->where('id_concepto',$id_concepto);
        $this->db->where('id_categoria',$id_categoria);
        $query = $this->db->get();
        return $query->row();
    }

    public function get_motivo($id_categoria, $id_concepto)
    {
        $sql = "select pc.id_precioconcepto, motivo.id_motivo, pc.precio, motivo.descripcion from precio_concepto pc
            join motivo on motivo.id_motivo = pc.id_motivo 
            where pc.id_categoria = ? and pc.id_concepto = ?";
        $query = $this->db->query($sql, array($id_categoria, $id_concepto)); 
        return $query->result();
    }

    public function get_idtorneo_by_club_categoria($id_club, $id_categoria)
    {
        $sql = "select t.id_torneo from inscripcionequipo i 
            join equipo eq on eq.id_equipo = i.id_equipo
            join torneo t on t.id_torneo = i.id_torneo
            join categoria c on c.id_categoria = eq.id_categoria 
            where t.estado = 1 and eq.id_club = ? and eq.id_categoria = ?";
        $query = $this->db->query($sql, array($id_club, $id_categoria));
        return $query->row();
    }

    public function list_jugadoresby_clubequipo($id_club)
    {
//         $sql = "select j.id_jugador, rp.id_partidos, ij.dorsal, p.nombres, p.apellido_paterno, p.apellido_materno from equipo e 
// join inscripcionjugador ij on ij.id_equipo = e.id_equipo 
// join jugador j on j.id_jugador = ij.id_jugador 
// join club c on c.id_club = e.id_club
// join persona p on p.id_persona = j.id_persona
// join resultado_partido rp on rp.id_jugador = j.id_jugador 
// where c.id_club = ? and rp.accion = 1
// group by j.id_jugador, rp.id_partidos, ij.dorsal";
        $sql = 'select j.id_jugador, rp.id_partidos, ij.dorsal, p.nombres, p.apellido_paterno, p.apellido_materno 
            from inscripcionequipo e 
            join equipo eq on eq.id_equipo = e.id_equipo
            join inscripcionjugador ij on ij.id_inscripcionequipo = e.id_inscripcionequipo 
            join jugador j on j.id_jugador = ij.id_jugador 
            join club c on c.id_club = eq.id_club
            join persona p on p.id_persona = j.id_persona
            join resultado_partido rp on rp.id_jugador = j.id_jugador 
            where c.id_club = ? and rp.accion = 1 and rp.pagado = 0
            group by j.id_jugador, rp.id_partidos, ij.dorsal';
        $query = $this->db->query($sql, array($id_club));
        return $query->result();
    }

    public function get_inscripcionequipo($id_torneo, $id_categoria, $id_club)
    {
        $this->db->select('id_inscripcionequipo');
        $this->db->from('inscripcionequipo i');
        $this->db->from('equipo eq', 'eq.id_equipo = i.id_equipo');
        $this->db->where('i.id_torneo',$id_torneo);
        $this->db->where('eq.id_categoria', $id_categoria);
        $this->db->where('eq.id_club', $id_club);
        $query = $this->db->get();
        return $query->row();

        // $sql = 'select id_inscripcionequipo from inscripcionequipo i 
        //     where id_torneo = ? and id_categoria = ? and id_club = ?';
        // $query = $this->db->query($sql, array($id_torneo, $id_categoria, $id_club));
        // return $query->result();
    }

    public function update_transferencia($id_club, $id_jugador, $preconc, $datostrasnf)
    {
        $this->db->where('id_club_destino', $id_club);
        $this->db->where('id_jugador', $id_jugador);
        $this->db->where('id_precioconcepto', $preconc);
        $this->db->update('transferencias', $datostrasnf);
    }

    public function insert_montogeneral($datosmontogeneral)
    {
        $this->db->insert('pagogeneral', $datosmontogeneral);
        return $this->db->insert_id();
    }

    public function save_pago_yellow($datos)
    {
        $this->db->insert('pago', $datos);
    }

    public function save_pago($datos)
    {
        $this->db->insert('pago', $datos);
    }

    // public function get_cant_veces()
    // {
    //     $this->db->from('cantidad');
    //     $query = $this->db->get();
    //     return $query->result();
    // }
    ///////////////////// pagos end /////////////////////////

    // sorteo de equipos begin //
    public function get_torneo_almost_four_teams()
    {
        // $sql = 'select t2.id_torneo, c.nombre, count(i2.id_torneo) as inscritos
        //     FROM inscripcionequipo i2, torneo t2, categoria c
        //     where t2.id_torneo = i2.id_torneo and t2.id_categoria = c.id_categoria and t2.estado = 0
        //     GROUP BY c.nombre, t2.id_torneo
        //     HAVING COUNT(i2.id_torneo) >=4';

        $sql = 'select t.id_torneo, c.id_categoria, c.nombre, count(i.id_torneo) as inscritos
            FROM inscripcionequipo i, torneo t, categoria c, equipo eq
            where t.id_torneo = i.id_torneo and eq.id_equipo = i.id_equipo and eq.id_categoria = c.id_categoria and t.estado = 1
            GROUP BY c.nombre, t.id_torneo
            HAVING COUNT(i.id_torneo) >=4';
        $query = $this->db->query($sql); 
        return $query->result();
    }
    // sorteo de equipos end //

    public function only_categorias()
    {
        $this->db->from('categoria');
        $query = $this->db->get();
        return $query->result();
    }

    ///////////////////// habilitacion de jugadores para el partido end  ///////////////////////
    public function verificar_habilitado($id_partido, $id_jugador)
    {
        $this->db->from('habilitado');
        $this->db->where('id_partidos', $id_partido);
        $this->db->where('id_jugador', $id_jugador);
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function eliminar_habilitacion($id_partido, $id_jugador)
    {
        $this->db->where('id_jugador', $id_jugador);
        $this->db->where('id_partidos', $id_partido);
        $this->db->delete('habilitado');
    }

    public function guardar_habilitacion($data)
    {
        $this->db->insert('habilitado', $data);
    }
    ///////////////////// habilitacion de jugadores para el partido end  ///////////////////////

    ////////// suspencion de partidos begin  ///////////////
    public function save_suspencion_partido($data)
    {
        $this->db->insert('suspencion_partido', $data);
    }

    public function update_suspencion_partido($where, $datos)
    {
        $this->db->where('id_partidos', $where);
        $this->db->update('suspencion_partido', $datos);
    }
    ////////// suspencion de partidos end  ///////////////

    // inscripcionequipo //
    public function obtenerclub()
    {
        $this->db->from('club c');
        // $this->db->join('club c', 'c.id_club = e.id_club');
        $query = $this->db->get();
        return $query->result();
    }

    public function obtenertorneo()
    {
        $this->db->from('torneo');
        $this->db->where('estado', 1);
        $query = $this->db->get();
        return $query->result();
    }

    public function obtener_categoria_rol_partido()
    {
        $sql = 'select t.id_torneo, c.id_categoria, c.nombre, count(i.id_torneo) as inscritos
            FROM inscripcionequipo i, torneo t, categoria c, equipo eq
            where t.id_torneo = i.id_torneo and eq.id_equipo = i.id_equipo and eq.id_categoria = c.id_categoria and t.estado = 1
            GROUP BY c.nombre, t.id_torneo
            HAVING COUNT(i.id_torneo) >=4';
        $query = $this->db->query($sql); 
        return $query->result();
    }

    public function saveInscripcion($data)
    {
        $id_equipo = $this->db->get_where('equipo', array(
            'id_club' => $data['id_club'],
            'id_categoria' => $data['id_categoria'],
        ))->row()->id_equipo;

        $data_inscripcion = [
            'fecha' => date('YYYY-MM-DD'),
            'id_equipo' => $id_equipo,
            'id_torneo' => $data['id_torneo']
        ];
        $this->db->insert('inscripcionequipo', $data_inscripcion);
    }
    // inscripcionequipo //

    ////////////////asignacion a jugador a un equipo ///////////////////////
    public function saveInscripcionJugadorEquipo($data)
    {
        $this->db->insert('inscripcionjugador', $data);
    }

    public function get_by_id_asignacion($id)
    {
        $id = $this->security->xss_clean($id);
        $this->db->where('id_jugador', $id);
        $query = $this->db->get('inscripcionjugador');
        return $query->row();
    }

    public function update_ju_asignacion($where, $data)
    {   
        $this->db->where('id_inscripcionjugador', $where);
        $this->db->update('inscripcionjugador', $data);
    }

    public function delete_by_id_asignacion($id_inscripcionjugador)
    {
        $this->db->where('id_inscripcionjugador', $id_inscripcionjugador);
        $res = $this->db->delete('inscripcionjugador');
        return $res;
    }
    ////////////////asignacion a jugador a un equipo ///////////////////////














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