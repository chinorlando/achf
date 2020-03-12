<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Curriculo extends CI_Controller {

    public function __construct() {

        parent::__construct();
        $this->load->Model('Jugador_model','dbase');
        $this->load->library('Window');
        //isLoggedIn();
    }

    public function index()
    {       
        $opcion = 'Curriculo';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Curriculo/',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion)
        );
        $data['vista']  = 'v_curriculo';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function ajax_list()
    {
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
            // $row[] = $d->categoria;
            // $row[] = $d->club;
            $row[] = ($d->estado==1)? 'Activo':'Inactivo';

            $row[] = '  <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="view_curriculum('.$d->id_jugador.')">
                            <i class="fa fa-eye"></i>
                        </button>       
                        <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="edit_row('.$d->id_jugador.')">
                            <i class="fa fa-pencil"></i>
                        </button>    
                        <!--
                        <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="delete_row('.$d->id_jugador.')">
                            <i class="fa fa-trash-o"></i>
                        </button>
                        -->
                        ';
            $data[] = $row;
        }

        $output = array(
                        "draw"              => $_POST['draw'],
                        "recordsTotal"      => $this->dbase->count_all(),
                        "recordsFiltered"   => $this->dbase->count_filtered(),
                        "data"              => $data,
                );
        echo json_encode($output);
    }

    public function get_curriculum()
    {
        $curriculum = $this->dbase->get_curriculum($this->input->post('id_jugador'));
        $jug_tr = '';
        $jug_tr .= '<table class="table table-bordered text-center">
                  <tbody><tr>
                    <th>INFORMACIÓN</th>
                    <th>TRAYECTORIA</th>
                    <th>LOGROS</th>
                    <th>PALMARES</th>
                  </tr>';
                  foreach ($curriculum as $curri) {
                      $jug_tr .= '<tr>
                        <td>'.
                          $curri->informacion
                        .'</td>
                        <td>'.
                          $curri->trayectoria
                        .'</td>
                        <td>'.
                          $curri->logros
                        .'</td>
                        <td>'.
                          $curri->palmares
                        .'</td>
                      </tr>';
                  }
        $jug_tr .= '</tbody>
            </table>';
        echo json_encode($jug_tr);
    }

     public function post_data()
    {
        $data = array(
                'nombre'        => $this->input->post('nombre'),
                'informacion'   =>$this->input->post('informacion'),
                'trayectoria'   =>$this->input->post('trayectoria'),
                'logros'        =>$this->input->post('logros'),
                'palmares'      =>$this->input->post('palmares'),
                'foto'          =>$this->input->post('foto'),
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
        $this->dbase->update($this->input->post('id_currijugador'), $data);
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
            $data['error_string'][] = 'El nombre es requerido';
            $data['status'] = FALSE;
        }      

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }

}