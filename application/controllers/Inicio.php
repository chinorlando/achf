<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inicio extends CI_Controller {

	public function __construct() {

        parent::__construct();
        //$this->load->Model('Cargo_model','dbase');  
        $this->load->library('Window');
        //isLoggedIn();
    }

	public function index()
	{
		//$this->load->view('welcome_message');
        $data = array(
            'opcion'            => 'Inicio',
            'controllerajax'    => 'Inicio/',
            'titulo_navegacion' => $this->window->titulo_navegacion('bienvenido','Inicio')
        );
    	$data['vista']  = 'v_inicio';
    	
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
	}

}
