<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Torneo extends CI_Controller {

    public function __construct() {

        parent::__construct();
        $this->load->Model('Torneo_model','dbase');
        $this->load->library('Window');
        //isLoggedIn();
    }

    public function index()
    {       
        $opcion = 'Torneo';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'torneo/',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion)
        );
        $data['vista']  = 'v_torneo';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function ajax_list()
    {
        $list = $this->dbase->get_datatables();
        $data = array();
        $no = isset($_POST['start'])? $_POST['start'] : 0;
        foreach ($list as $d) {
            $no++;
            $row = array();

            $row[] = $no;
            $row[] = $d->nombre;
            $row[] = $d->fecha_inicio;
            $row[] = $d->fecha_fin;
            $row[] = ($d->estado==1)? 'Activo':'Inactivo';

            $row[] = '  <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="view_row('.$d->id_torneo.')">
                            <i class="fa fa-eye"></i>
                        </button>       
                        <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="edit_row('.$d->id_torneo.')">
                            <i class="fa fa-pencil"></i>
                        </button>    
                        <!--
                        <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="delete_row('.$d->id_torneo.')">
                            <i class="fa fa-trash-o"></i>
                        </button>
                        -->
                        ';
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

    public function get_categorias()
    {
        $torneos = $this->dbase->only_categorias();
        echo json_encode($torneos);
    }

    public function post_data()
    {
        $data = array(
            'id_categoria' => $this->input->post('categoria'),
            'fecha_inicio'     => $this->input->post('fecha_inicio'),
            'fecha_fin'        => $this->input->post('fecha_fin'),
            'estado'        => $this->input->post('estado'),
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
        $this->dbase->update($this->input->post('id_torneo'), $data);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_delete($id)
    {
        $this->dbase->delete_by_id($id);
        echo json_encode(array("status" => TRUE));
    }
    
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('nombre') == '')
        {
            $data['inputerror'][] = 'nombre';
            $data['error_string'][] = 'El nombre del torneo es requerido';
            $data['status'] = FALSE;
        }

        if($this->input->post('fecha_inicio') == '')
        {
            $data['inputerror'][] = 'fecha_inicio';
            $data['error_string'][] = 'La Fecha de Inicio del Torneo es requerida';
            $data['status'] = FALSE;
        }
        
        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }

}