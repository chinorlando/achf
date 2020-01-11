<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Vpersonamenuprincipal_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'v_personas_menus_principales';
        $this->column = array('nro_identificacion_persona','nombre_persona','paterno','materno','fecha_nacimiento','fotografia','domicilio','latitud','longitud','sexo','telefono','celular','usuario','contrasenia','fecha_hora','id_persona_rol','id_persona','id_rol','nombre_rol','id_menu_principal','nombre_menu_principal','icono','color','orden','estado');  
        $this->order  = array('id_persona' => 'asc');
    }

}