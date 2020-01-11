
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct() {

        parent::__construct();
        $this->load->Model('Persona_model','dbper');  
        $this->load->Model('Vpersonamenuprincipal_model','pmenup');
        $this->load->Model('Menu_model','menu');
    }

	public function index()
	{
        //echo sha1('admin');
    	// echo sha1('123');
        // echo sha1('12345');
        $data = array(
            'opcion'            => 'Login',
            'controllerajax'    => 'Login/',
            'titulo_navegacion' => $this->window->titulo_navegacion('Bienvenido','Login')
        );
        $data['vista']  = 'v_login';
        
        $this->load->view($data['vista'],$data);
	}

    public function inicio()
    {
        //isLoggedIn();
        
        $data['vista']  = 'v_inicio';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }
    
    public function valida()
    {
        
        $username = $this->input->post("username");
        $password = sha1($this->input->post("clave"));
        $where = array('usuario'=>$username,'password'=>$password);
        $datos = $this->dbper->get_row_by_field($where);
        $num_rows = count($datos);
        //print_r($datos);
        
        $login_status = '0';
        $redirect_url = '';

        if($num_rows > 0){
            $login_status = '1';
            $redirect_url = 'Login/inicio';
            $this->menu($datos->id_persona);
        }
        echo $login_status;
    }

    public function logout()
    {
        $this->session->sess_destroy();
        $this->session->set_flashdata('logout_notification', 'logged_out');
        redirect(base_url() , 'refresh');
        exit;
    }
    /*
    private function menu($id_persona)
    {
        $where = array('id_persona'=>$id_persona);

        $datos = $this->pmenup->get_all_by_field($where);
        $menu  = '';
        //<i class="'.$d->icono.'" aria-hidden="true"></i>
        foreach ($datos as $d) {
            $menu .= '<li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">person</i>
                            <span>'.$d->nombre_menu_principal.'</span>
                        </a>

                        <ul class="ml-menu">';
            $where = array('id_menu_principal' => $d->id_menu_principal);
            $menudatos = $this->menu->get_all_by_field($where);
            $subm = '';
            foreach ($menudatos as $m) {
                //$subm .= '<li><a href="'.base_url().$m->directorio.'">'.$m->nombre.'</a></li>';
                $subm .= '<li><a href="'.base_url().$m->directorio.'">'.$m->nombre.'</a></li>';
            }

            $menu .= $subm.'</ul>
                    </li>';
        }

        $data = array(
                    'usuario'         => $datos[0]->usuario,
                    'id_persona'      => $id_persona,
                    'id_rol'          => $datos[0]->id_rol,
                    'nombre_rol'      => $datos[0]->nombre_rol,
                    'nombre_persona'  => $datos[0]->nombre_persona,
                    'nombre_completo' => $datos[0]->paterno.' '.$datos[0]->materno.', '.$datos[0]->nombre_persona,
                    'fotografia'      => $datos[0]->fotografia,
                    'menu'            => $menu,
                    'logged_in'       => TRUE
                );
        $this->session->set_userdata($data);
    }
    */
    public function menu($id_persona)
    {
        $where = array('id_persona'=>$id_persona);

        $datos = $this->pmenup->get_all_by_field($where);
        $menu  = '';
        /*
            <i class="'.$d->icono.'" aria-hidden="true"></i>                
        */
        foreach ($datos as $d) {
            $menu .= '<li class="treeview">
                        <a href="#">
                            <i class="fa fa-fw fa-bars"></i> <span>'.$d->nombre_menu_principal.'</span>
                            <span class="pull-right-container">
                              <i class="fa fa-angle-left pull-right"></i>
                            </span>
                          </a>

                        <ul class="treeview-menu">';
            $where = array('id_menu_principal' => $d->id_menu_principal);
            $menudatos = $this->menu->get_all_by_field($where);
            $subm = '';
            foreach ($menudatos as $m) {
                $subm .= '<li><a href="'.base_url().$m->directorio.'"><i class="fa fa-circle-o"></i>'.$m->nombre.'</a></li>';
            }

            $menu .= $subm.'</ul>
                    </li>';
        }
        //return $menu;
        
        $data = array(
                    'usuario'         => $datos[0]->usuario,
                    'id_persona'      => $id_persona,
                    'id_rol'          => $datos[0]->id_rol,
                    'nombre_rol'      => $datos[0]->nombre_rol,
                    'nombre_persona'  => $datos[0]->nombre_persona,
                    'nombre_completo' => $datos[0]->apellido_paterno.' '.$datos[0]->apellido_materno.' '.$datos[0]->nombre_persona,
                    'fotografia'      => $datos[0]->foto,
                    'menu'            => $menu,
                    'logged_in'       => TRUE
                );
        print_r($data);
        $this->session->set_userdata($data);
    }
}