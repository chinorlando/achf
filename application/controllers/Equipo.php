<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Equipo extends CI_Controller {

    public function __construct() {

        parent::__construct();
        $this->load->Model('Equipo_model','dbase');
        $this->load->library('Window');
        //isLoggedIn();
    }

    public function index()
    {       
        $opcion = 'Equipo';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Equipo/',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion)
        );
        $data['vista']  = 'v_equipo';
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
            $row[] = $d->nombre_equipo;
            $row[] = $d->direccion;
            $row[] = $d->ciudad;
            $row[] = $d->escudo;
            $row[] = $d->fecha_fundación;
            $row[] = $d->presidente;
            $row[] = $d->entrenador;
            $row[] = $d->observaciones;
            $row[] = ($d->estado==1)? 'Activo':'Inactivo';

            $row[] = '  <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="view_row('.$d->id_equipo.')">
                            <i class="fa fa-eye"></i>
                        </button>       
                        <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="edit_row('.$d->id_equipo.')">
                            <i class="fa fa-pencil"></i>
                        </button>    
                        <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="delete_row('.$d->id_equipo.')">
                            <i class="fa fa-trash-o"></i>
                        </button>';
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
                'nombre_equipo'  => $this->input->post('nombre_equipo'),
                'direccion' => $this->input->post('direccion'),
                'ciudad' => $this->input->post('ciudad'),
                'escudo' => $this->input->post('escudo'),
                'fecha_fundación' => $this->input->post('fecha_fundación'),
                'presidente' => $this->input->post('presidente'),
                'entrenador' => $this->input->post('entrenador'),
                'observaciones' => $this->input->post('observaciones'),
                'estado' => $this->input->post('estado'),
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
        $this->dbase->update($this->input->post('id_equipo'), $data);
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
            $data['inputerror'][] = 'c_i';
            $data['error_string'][] = 'El nombre del equipo es requerido';
            $data['status'] = FALSE;
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }

}