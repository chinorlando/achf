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
        $data = array();
        $no = isset($_POST['start'])? $_POST['start'] : 0;
        foreach ($list as $d) {
            $no++;
            $row = array();

            $row[] = $no;
            // $row[] = $d->id_persona;
            $row[] = $d->nombres;
            $row[] = $d->apellido_paterno;
            $row[] = $d->apellido_materno;
            $row[] = $d->posicion;
            $row[] = $d->categoria;
            $row[] = $d->club;
            $row[] = ($d->estado==1)? 'Activo':'Inactivo';

            if ($title == 'Transferencia') {
                $row[] = ' <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="view_trasferencia('.$d->id_jugador.')">
                        <i class="fa fa-eye"></i>
                    </button>
                    <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="add_transferencia('.$d->id_jugador.')">
                        <i class="fa fa-eye"></i>
                    </button>';
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
            } elseif (TRUE){
                $row[] = '.';
            }

            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->dbase->count_all(),
            "recordsFiltered" => $this->dbase->count_filtered(),
            "data" => $data,
        );
        echo json_encode($output);
    }

     public function post_data()
    {
        $data = array(
                'n_registro_fbf'   => $this->input->post('n_registro_fbf'),
                'nombres'          => $this->input->post('nombres'),
                'apellido_paterno' => $this->input->post('apellido_paterno'),
                'apellido_materno' => $this->input->post('apellido_materno'),
                'categoria'        => $this->input->post('categoria'),
                'lfpb_asociacion_liga_provincial' => $this->input->post('lfpb_asociacion_liga_provincial'),
                'nacionalidad'     => $this->input->post('nacionalidad'),
                'estado_civil'     => $this->input->post('estado_civil'),
                'ciudad'           => $this->input->post('ciudad'),
                'fecha_nacimiento' => $this->input->post('fecha_nacimiento'),
                'foto'             => $this->input->post('foto'),
                'nombre_padre'     => $this->input->post('nombre_padre'),
                'nombre_madre'     => $this->input->post('nombre_madre'),
                'edad'             => $this->input->post('edad'),
                'c_i'              => $this->input->post('c_i'),
                'sexo'             => $this->input->post('sexo'),
                'domicilio'        => $this->input->post('domicilio'),
                'procede_del_club' => $this->input->post('procede_del_club'),
                'posicion'         => $this->input->post('posicion'),
                'estatura'         => $this->input->post('estatura'),
                'peso'             => $this->input->post('peso'),
                'estado'           => $this->input->post('estado'),
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
        $this->_validate();
        $data = $this->post_data();
        $insert = $this->dbase->save($data);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
        $this->_validate();
        $data = $this->post_data();
        $this->dbase->update($this->input->post('id_jugador'), $data);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_delete($id)
    {
        $this->dbase->delete_by_id($id);
        echo json_encode(array("status" => TRUE));
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
        // print_r($transferencias);
        // exit();


        $equipos = $this->dbase->get_equipos();
        $id_equipo_actual_jugador = $this->dbase->get_equipo_actual($this->input->post('id_jugador'));
        $equipo_actual_jugador = $this->db->get_where('equipo', array('id_equipo' => $id_equipo_actual_jugador->id_equipo_destino))->row()->nombre_equipo;

        // print_r($equipos);

        // print_r($equipo_actual_jugador);

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
                          $transferencia->nombre_equipo_proviene
                        .'</td>
                        <td>'.
                          $transferencia->nombre_equipo_destino
                        .'</td>
                      </tr>';
                  }
        $jug_tr .= '</tbody>
            </table>';
        echo json_encode(array('jug_tr' => $jug_tr, 'id_equipo' => $id_equipo_actual_jugador->id_equipo_destino, 'equipo_actual' => $equipo_actual_jugador, 'equipos' => $equipos, 'id_jugador'=>$this->input->post('id_jugador')));
    }

    public function categorias()
    {
        $opcion = 'Categorias';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Jugador/',
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

        $dataTransferencia = array(
            'fecha' => date("Y/m/d"),
            'id_jugador' => $id_jugador,
            'id_equipo' => $proviene,
            'id_equipo_destino' => $destino,
        );

        // print_r($dataTransferencia);

        $this->dbase->save_transferencia($dataTransferencia);

        echo json_encode(array('status' => TRUE));
    }

    /////////////////////////////////////////////////////////////
    
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



}