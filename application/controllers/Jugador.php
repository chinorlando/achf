<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jugador extends CI_Controller {

    private $funcion;

    public function __construct() {

        parent::__construct();
        $this->load->Model('Jugador_model','dbase');
        $this->load->library('Window');

        $this->funcion = $this->uri->segment(2);
        // $funcion = $funcion;
        // print_r($funcion);
        // exit();
    }

    public function index()
    {       
        $opcion = 'Jugador';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Jugador/',
            'titulo_navegation' => $this->window->titulo_navegacion('A.CH.F',$opcion)
        );
        $data['vista']  = 'v_jugador';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    function salida($data)
    {
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function ajax_list($title)
    {
        // print_r($title);
        $list = $this->dbase->get_datatables_jugador();
        // print_r($list);
        // exit();
        $data = array();
        $no = isset($_POST['start'])? $_POST['start'] : 0;
        foreach ($list as $d) {
            $no++;
            $row = array();

            $row[] = $no;
            $row[] = $d->nombres.' '.$d->apellido_paterno.' '.$d->apellido_materno;
            $row[] = $d->fecha_nacimiento;
            $row[] = $d->c_i;
            $row[] = $d->n_registro_fbf;
            if($d->foto)
                $row[] = '<a href="'.base_url('upload/'.$d->foto).'" target="_blank"><img src="'.base_url('upload/'.$d->foto).'" class="img-responsive" /></a>';
            else
                $row[] = '(Sin foto)';
            $row[] = ($d->sexo=='M')? 'Masculino':'Femenino';
            $row[] = $d->nacionalidad;
            // aqui aqui
            $row[] = $d->nombre_club.' - '.$d->nombre ;
            // $row[] = $d->nombre;
            $row[] = ($d->estado==1)? 'Activo':'Inactivo';
            // $row[] = $d->nombre_categoria;

            // $row[] = ($d->estado==1)? 'Activo':'Inactivo';

            if ($title == 'Transferencia') {
                $row[] = ' <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="view_trasferencia('.$d->id_jugador.')">
                        <i class="fa fa-eye"></i>
                    </button>';
                    // <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="add_transferencia('.$d->id_jugador.')">
                    //     <i class="fa fa-eye"></i>
                    // </button>';
            } elseif ($title == 'Jugador') {
                $row[] = ' <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="view_row('.$d->id_jugador.')">
                        <i class="fa fa-eye"></i>
                    </button>       
                    <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="edit_row('.$d->id_jugador.')">
                        <i class="fa fa-pencil"></i>
                    </button>    
                    <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="delete_row('.$d->id_jugador.')">
                        <i class="fa fa-trash-o"></i>
                    </button>
                    <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="print_row('.$d->id_jugador.')">
                        <i class="fa fa-print"></i>
                    </button>';
            } elseif ($title == 'Asignacion') {
                $row[] = '
                    <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="edit_row_asignacion('.$d->id_jugador.')">
                        <i class="fa fa-pencil"></i>
                    </button>    
                    <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="delete_row_asignacion('.$d->id_jugador.')">
                        <i class="fa fa-trash-o"></i>
                    </button>';
            } elseif (TRUE){
                $row[] = '.';
            }

            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->dbase->count_all_ju(),
            "recordsFiltered" => $this->dbase->count_filtered_ju(),
            "data" => $data,
        );
        echo json_encode($output);
    }

     public function post_data()
    {
        // datos de persona
        
        $a = $this->input->post('usuario');
        $b = $this->input->post('password');
        if (isset($a) && isset($b)) {
            $usuario = $a;
            $password = sha1($b);
        } else {
            $usuario = '';
            $password = '';
        }
        
        $data = array(
            'nombres'          => $this->input->post('nombres'),
            'apellido_paterno' => $this->input->post('apellido_paterno'),
            'apellido_materno' => $this->input->post('apellido_materno'),
            'foto'             => $this->input->post('foto'),
            'telefono'         => $this->input->post('telefono'),
            'celular'          => $this->input->post('celular'),
            'direccion'        => $this->input->post('direccion'),
            'ciudad'           => $this->input->post('ciudad'),
            'fecha_nacimiento' => $this->input->post('fecha_nacimiento'),
            'sexo'             => $this->input->post('sexo'),
            'profesion'        => $this->input->post('profesion'),
            'nacionalidad'     => $this->input->post('nacionalidad'),
            'email'            => $this->input->post('email'),
            'usuario'          => $usuario,
            'password'         => $password,
        ); 
       
        return $data;
    }

    public function post_data_jugador()
    {
        $data = array(
            'n_registro_fbf'   => $this->input->post('n_registro_fbf'),
            'lfpb_asociacion_liga_provincial' => $this->input->post('lfpb_asociacion_liga_provincial'),
            'nombre_padre'     => $this->input->post('nombre_padre'),
            'nombre_madre'     => $this->input->post('nombre_madre'),
            'estado_civil'     => $this->input->post('estado_civil'),
            'c_i'              => $this->input->post('c_i'),
            'estatura'         => $this->input->post('estatura'),
            'cont_amarilla'    => $this->input->post('cont_amarilla'),
            'estado'           => $this->input->post('estado'),

            // 'n_registro_fbf'   => $this->input->post('n_registro_fbf'),
            // 'categoria'        => $this->input->post('categoria'),
            // 'edad'             => $this->input->post('edad'),
            // 'domicilio'        => $this->input->post('domicilio'),
            // 'procede_del_club' => $this->input->post('procede_del_club'),
            // 'posicion'         => $this->input->post('posicion'),
            // 'peso'             => $this->input->post('peso'),
        );

        return $data;
    }

    public function ajax_edit($id)
    {
        $data = $this->dbase->get_by_id($id);
        echo json_encode($data);
    }

    public function ajax_add()
    {
        // $this->_validate();
        $data = $this->post_data();
        $dataJugador = $this->post_data_jugador();

        if(!empty($_FILES['foto']['name']))
        {
            $upload = $this->_do_upload();
            $data['foto'] = $upload;
        }
        $insert = $this->dbase->save_ju($data, $dataJugador);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
        //$this->_validate();
        $data = $this->post_data();
        $dataJugador = $this->post_data_jugador();
        
        if($this->input->post('remove_photo')){
            if(file_exists('upload/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
                unlink('upload/'.$this->input->post('remove_photo'));
            $data['foto'] = '';
        }
        if(!empty($_FILES['photo']['name'])){
            $upload = $this->_do_upload();

            //delete file
            $person = $this->dbase->get_by_id($this->input->post('id_jugador'));
            if(file_exists('upload/'.$person->photo) && $person->photo)
                unlink('upload/'.$person->photo);
 
            $data['foto'] = $upload;
        }

        $this->dbase->update_ju($this->input->post('id_jugador'), $data, $dataJugador);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_delete($id)
    {
        $person = $this->dbase->get_by_id($id);
        if(file_exists('upload/'.$person->photo) && $person->photo)
            unlink('upload/'.$person->photo);
        $this->dbase->delete_by_id($id);
        echo json_encode(array("status" => TRUE));
    }

    private function _do_upload()
    {
        $config['upload_path']          = 'upload/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 5000; //set max size allowed in Kilobyte
        $config['max_width']            = 1000; // set max width image allowed
        $config['max_height']           = 1000; // set max height allowed
        $config['file_name']            = round(microtime(true) * 1000); //just milisecond timestamp fot unique name
 
        $this->load->library('upload', $config);
 
        if(!$this->upload->do_upload('photo')) //upload and validate
        {
            $data['inputerror'][] = 'photo';
            $data['error_string'][] = 'Upload error: '.$this->upload->display_errors('',''); //show ajax error
            $data['status'] = FALSE;
            echo json_encode($data);
            exit();
        }
        return $this->upload->data('file_name');
    }

    public function get_jugador($id)
    {
        $datos = $this->dbase->get_jugador_by_id($id);
        echo json_encode(array('datos_jugador' => $datos));
    }

    /////////////////////////////////////////////////////////////
    public function transferencias()
    {
        $opcion = 'Transferencia';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Jugador/',
            'titulo_navegation' => $this->window->titulo_navegacion('A.CH.F',$opcion)
        );
        $data['vista'] = 'v_jugador_transferencias';
        $this->salida($data);
    }

    public function get_transferencias()
    {
        $transferencias = $this->dbase->get_transferencias($this->input->post('id_jugador'));
        // print_r($this->input->post('id_jugador'));
        // exit();


        // $equipos = $this->dbase->get_equipos();
        $club_actual_jugador = $this->dbase->get_club_actual($this->input->post('id_jugador'));
        // print_r($club_actual_jugador->id_club);
        // exit();
        $clubs = $this->dbase->get_clubs($club_actual_jugador->id_club);

        // 5 y 6 son los conceptos de transferencia
        $conc_transf = $this->dbase->get_concepto_transferencia();
        // if (!isset($id_club_actual_jugador)) {
        //     $club_actual_jugador = $this->db->get_where('club', array('id_club' => $id_club_actual_jugador->id_club_destino))->row()->nombre_club;
        // }

        // print_r($clubs);

        // print_r($club_actual_jugador);
        // exit();

        $jug_tr = '';
        $jug_tr .= '<table class="table table-bordered text-center">
                  <tbody><tr>
                    <th>FECHA</th>
                    <th>PROVIENE</th>
                    <th>DESTINO</th>
                  </tr>';
                  foreach ($transferencias as $transferencia) {
                      $jug_tr .= '<tr>
                        <td>'.
                          $transferencia->fecha
                        .'</td>
                        <td>'.
                          $transferencia->nombre_club_proviene
                        .'</td>
                        <td>'.
                          $transferencia->nombre_club_destino
                        .'</td>
                      </tr>';
                  }
        $jug_tr .= '</tbody>
            </table>';
        echo json_encode(array('jug_tr' => $jug_tr, 'equipo_actual' => $club_actual_jugador, 'clubs' => $clubs, 'id_jugador'=>$this->input->post('id_jugador'), 'c_t' => $conc_transf));
    }

    public function get_tipo_transf()
    {
        $id_conc_transf = $this->input->post('id_conc_transf');
        // print_r($id_conc_transf);
        // exit();
        // $motivo_trans = $this->db->get_where('precio_concepto', array(
        //     'id_concepto' => $id_conc_transf,
        //     'id_categoria' => 1,
        // ))->result();
        // print_r($motivo_trans);
        $motivo_trans = $this->dbase->get_motivo_trasnferencia($id_conc_transf);
        echo json_encode(array('m_t' => $motivo_trans));
    }

    public function categorias()
    {
        $opcion = 'Categorias';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'jugador/',
            'titulo_navegation' => $this->window->titulo_navegacion('A.CH.F',$opcion)
        );
        $data['vista'] = 'v_jugador_categoria';
        $this->salida($data);
    }

    public function save_transferencia()
    {
        $proviene = $this->input->post('proviene');
        $destino = $this->input->post('destino');
        $id_jugador = $this->input->post('id_jugador');
        $concep_transf = $this->input->post('concep_transf');
        $id_precioconcepto = $this->input->post('motivo_transf');

        if ($destino == -1 || $id_precioconcepto == -1 || $concep_transf == -1) {
            echo json_encode(array('status' => FALSE));
        } else {
            $dataTransferencia = array(
                'fecha' => date("Y/m/d"),
                'id_jugador' => $id_jugador,
                'id_club' => $proviene,
                'id_club_destino' => $destino,
                'id_precioconcepto' => $id_precioconcepto,
            );

            $data = [
                'id_inscripcionequipo' => $destino,
            ];
            // print_r($data);
            $this->dbase->update_inscripcionjugador($id_jugador, $proviene, $data);
            // $this->dbase->update_inscripcionjugador(1, 9, $data);

            $this->dbase->save_transferencia($dataTransferencia);

            echo json_encode(array('status' => TRUE));
        }

    }

    /////////////////////////////////////////////////////////////

    /////////////// asignacion de jugador a un equipo //////////////////////
    // public function equipo_jugador()
    // {
    //     $opcion = 'Asignacion de jugador';
    //     $data = array(
    //         'opcion'            => $opcion,
    //         'controllerajax'    => 'jugador',
    //         'titulo_navegation' => $this->window->titulo_navegacion('A.CH.F',$opcion)
    //     );
    //     $data['vista'] = 'v_jugador_asignacion_equipo';
    //     $this->salida($data);
    // }

    public function equipo_jugador()
    {
        $opcion = 'Asignacion';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'jugador/',
            'titulo_navegation' => $this->window->titulo_navegacion('A.CH.F',$opcion)
        );
        $data['vista'] = 'v_jugador_asignacion_equipo';
        $this->salida($data);
    }

    public function get_all_jugadores()
    {
        $this->dbase->get_datatables_jug_all();
        $query = $this->db->get();
        $list = $query->result();
        echo json_encode($list);
    }

    public function ajax_guardar_inscripcionjugador()
    {
        $this->_validate_asignacion();
        $dorsal = $this->input->post('dorsal');
        $posicion = $this->input->post('posicion');
        $peso = $this->input->post('peso');
        $id_jugadores = $this->input->post('jugadores');
        $id_club = $this->input->post('club');
        $id_categoria = $this->input->post('categorias');

        $id_equipo = $this->db->get_where('equipo', array('id_club' => $id_club, 'id_categoria' => $id_categoria))->row()->id_equipo;

        $id_inscripcionequipo = $this->db->get_where('inscripcionequipo', array('id_equipo' => $id_equipo))->row()->id_inscripcionequipo;

        $data = [
            'dorsal' => $dorsal,
            'posicion' => $posicion,
            'peso' => $peso,
            'id_jugador' => $id_jugadores,
            'id_inscripcionequipo' => $id_inscripcionequipo,
        ];

        $this->dbase->saveInscripcionJugadorEquipo($data);
        echo json_encode(array('status' => TRUE));
    }

    public function ajax_edit_asignacion($id)
    {
        $data_asignacion = $this->dbase->get_by_id_asignacion($id);
        $id_inscripcionequipo = $this->db->get_where('inscripcionjugador', array('id_jugador' => $id))->row()->id_inscripcionequipo;
        $id_inscripcionjugador = $this->db->get_where('inscripcionjugador', array('id_jugador' => $id))->row()->id_inscripcionjugador;
        $id_equipo = $this->db->get_where('inscripcionequipo', array('id_inscripcionequipo' => $id_inscripcionequipo))->row()->id_equipo;
        $id_club = $this->db->get_where('equipo', array('id_equipo' => $id_equipo))->row()->id_club;
        $nombre_club = $this->db->get_where('club', array('id_club' => $id_club))->row()->nombre_club;
        $id_categoria = $this->db->get_where('equipo', array('id_equipo' => $id_equipo))->row()->id_categoria;

        $categorias = $this->dbase->get_categoria_inscripcion($id_club);

        echo json_encode(array('data_asignacion' => $data_asignacion, 'id_club' => $id_club, 'categorias' => $categorias, 'id_categoria' => $id_categoria, 'id_inscripcionjugador' => $id_inscripcionjugador));
    }

    public function ajax_update_inscripcionjugador()
    {
        $this->_validate_asignacion();
        $dorsal = $this->input->post('dorsal');
        $posicion = $this->input->post('posicion');
        $peso = $this->input->post('peso');
        $id_jugadores = $this->input->post('jugadores');
        $id_club = $this->input->post('club');
        $id_categoria = $this->input->post('categorias');

        $id_equipo = $this->db->get_where('equipo', array('id_club' => $id_club, 'id_categoria' => $id_categoria))->row()->id_equipo;
        $id_inscripcionequipo = $this->db->get_where('inscripcionequipo', array('id_equipo' => $id_equipo))->row()->id_inscripcionequipo;

        $data = [
            'dorsal' => $dorsal,
            'posicion' => $posicion,
            'peso' => $peso,
            'id_jugador' => $id_jugadores,
            'id_inscripcionequipo' => $id_inscripcionequipo,
        ];

        $this->dbase->update_ju_asignacion($this->input->post('id_inscripcionjugador'), $data);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_delete_asignacion($id)
    {
        $id_inscripcionjugador = $this->db->get_where('inscripcionjugador', array('id_jugador' => $id))->row()->id_inscripcionjugador;
        $this->dbase->delete_by_id_asignacion($id_inscripcionjugador);
        echo json_encode(array("status" => TRUE));
    }
    /////////////// asignacion de jugador a un equipo //////////////////////
    
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('nombre') == '')
        {
            $data['inputerror'][] = 'c_i';
            $data['error_string'][] = 'El Carnet de Identidad es requerido';
            $data['status'] = FALSE;
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }

    private function _validate_asignacion()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('dorsal') == '')
        {
            $data['inputerror'][] = 'dorsal';
            $data['error_string'][] = 'El numero de jugador es obligatorio';
            $data['status'] = FALSE;
        }
        if($this->input->post('posicion') == '')
        {
            $data['inputerror'][] = 'posicion';
            $data['error_string'][] = 'La posición es obligatoria.';
            $data['status'] = FALSE;
        }
        if($this->input->post('peso') == '')
        {
            $data['inputerror'][] = 'peso';
            $data['error_string'][] = 'El peso es obligatorio';
            $data['status'] = FALSE;
        }
        if($this->input->post('jugadores') == 'Seleccione...')
        {
            $data['inputerror'][] = 'jugadores';
            $data['error_string'][] = 'Seleccione el jugador';
            $data['status'] = FALSE;
        }
        if($this->input->post('club') == 'Seleccione...')
        {
            $data['inputerror'][] = 'club';
            $data['error_string'][] = 'El club es requerido';
            $data['status'] = FALSE;
        }
        if($this->input->post('categorias') == '')
        {
            $data['inputerror'][] = 'categorias';
            $data['error_string'][] = 'La categoria es requerido';
            $data['status'] = FALSE;
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }



}