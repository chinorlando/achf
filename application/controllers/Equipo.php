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
        $list = $this->dbase->get_datatables_equipo();
        // print_r($list);
        // exit();
        $data = array();
        $no = isset($_POST['start'])? $_POST['start'] : 0;
        foreach ($list as $d) {
            $no++;
            $row = array();

            $row[] = $no;
            $row[] = $d->nombre_completo;
            $row[] = $d->nombre_club;
            $row[] = $d->direccion;
            $row[] = $d->ciudad;
            $row[] = $d->fecha_fundacion;
            if($d->escudo)
                $row[] = '<a href="'.base_url('upload/'.$d->escudo).'" target="_blank"><img src="'.base_url('upload/'.$d->escudo).'" class="img-responsive" /></a>';
            else
                $row[] = '(Sin foto)';
            // $row[] = $d->entrenador;
            // $row[] = $d->observaciones;
            $row[] = ($d->estado==1)? 'Activo':'Inactivo';

            $row[] = '  <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="view_row('.$d->id_club.')">
                            <i class="fa fa-eye"></i>
                        </button>       
                        <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="edit_row('.$d->id_club.')">
                            <i class="fa fa-pencil"></i>
                        </button>    
                        <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="delete_row('.$d->id_club.')">
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
                'id_persona' => $this->input->post('id_persona'),
                'nombre_club'  => $this->input->post('nombre_club'),
                'direccion' => $this->input->post('direccion'),
                'ciudad' => $this->input->post('ciudad'),
                'escudo' => $this->input->post('photo'),
                'fecha_fundación' => $this->input->post('fecha_fundación'),
                'estado' => $this->input->post('estado'),
                // 'presidente' => $this->input->post('presidente'),
                // 'entrenador' => $this->input->post('entrenador'),
                // 'observaciones' => $this->input->post('observaciones'),
            );
       
        return $data;
    }

    public function ajax_edit($id)
    {
        $data = $this->dbase->get_by_id_equi($id);
        // print_r($data);
        // exit();
        echo json_encode($data);
    }

    public function ajax_add()
    {
        $this->_validate();
        $data = $this->post_data();
        if(!empty($_FILES['photo']['name']))
        {
            $upload = $this->_do_upload();
            $data['foto'] = $upload;
        }
        $insert = $this->dbase->save($data);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_update()
    {
        // $this->_validate();
        $data = $this->post_data();

        if($this->input->post('remove_photo')){
            if(file_exists('upload/'.$this->input->post('remove_photo')) && $this->input->post('remove_photo'))
                unlink('upload/'.$this->input->post('remove_photo'));
            $data['escudo'] = '';
        }
        if(!empty($_FILES['photo']['name'])){
            $upload = $this->_do_upload();

            //delete file
            $person = $this->dbase->get_by_id($this->input->post('id_club'));
            if(file_exists('upload/'.$person->escudo) && $person->escudo)
                unlink('upload/'.$person->escudo);
 
            $data['escudo'] = $upload;
        }

        $this->dbase->update($this->input->post('id_equipo'), $data);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_delete($id)
    {
        $this->dbase->delete_by_id($id);
        if(file_exists('upload/'.$person->escudo) && $person->escudo)
            unlink('upload/'.$person->escudo);
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

    public function get_persona_presi()
    {
        // optien todos lo torneos que por lo menos tengan 4 equipos inscritos
        $torneos = $this->dbase->get_persona_pre();
        // print_r($torneo);
        echo json_encode($torneos);

        // $nivel_curso = $this->db->get('torneo')->result();
        // echo json_encode($nivel_curso);
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