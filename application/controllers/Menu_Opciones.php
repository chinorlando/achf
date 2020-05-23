<?php
class Menu_Opciones extends CI_Controller {

    public function __construct()
    {
        parent::__construct();

    }


    public function index()
    {

    }

    function asignacion()
    {
        $this->load->model('Menu_Opciones_model');
        $data['mensaje'] = 'LISTA DE USUARIOS';
        $data['datos'] = $this->Menu_Opciones_model->get_users();

        $this->load->view('plantilla/header');
        $this->load->view('v_menu_usuarios',$data);
        $this->load->view('plantilla/footer');
    }
    function menu_asignado()
    {
        $this->load->model('Menu_Opciones_model');

        $id_rol = $this->input->post('id_rol');
        
        $datos = $this->Menu_Opciones_model->get_menu();
        $num   = count($datos);
        $cad ="<div class='box-body'>";
        $cad ="<form  name='form' method='POST' action='".base_url()."Menu_Opciones/guardar'>";
        $cad .= "<input type='hidden' name='id_rol' value='$id_rol'>";
        $cad .= "<div class='form-group'>";
        $i = 1;
        foreach($datos as $d){
            //$id_rol = $d->id_rol;
            $id_menu = $d->id_menu_principal;
            $nombre  = $d->nombre;

            $item = $this->Menu_Opciones_model->get_menu_item($id_rol,$id_menu);
            if($item>0){
                $cad .= "<div class='checkbox'><label><input type='checkbox' class='flat-red' name='id_menu[]' id='id_menu".$i."' value='$id_menu' checked>  $nombre</label></div>";
            }else{
                $cad .= "<div class='checkbox'><label><input type='checkbox'  name='id_menu[]' id='id_menu".$i."' value='$id_menu'>  $nombre</label></div>";
            }
            $i++;
            
        }
        $cad .= "</div>";
        $cad .= "<input type='submit' class='btn btn-primary' name='Guardar' value='Guardar'>";
        $cad .= "</form>";
        $cad .= "</div>";
        $cad .= "</div>";


        echo $cad;
    }
    public function guardar(){
        $this->load->model('Menu_Opciones_model');
        $id_rol = $this->input->post('id_rol');
        $this->Menu_Opciones_model->delete_menu_usuario($id_rol);

        foreach($_POST['id_menu'] as $id_menu) {
            $datos = array('id_menu_principal'=>$id_menu,'id_rol'=>$id_rol,'fecha'=>date("Y-m-d"),'estado'=>1);
            //echo  $id_menu."</br>";
            $this->Menu_Opciones_model->insertar_menu_usuario($datos); 
        }
        $this->asignacion();
    }
}