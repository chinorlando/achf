<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Persona_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'persona';
        $this->column = array('id_persona','nombres','apellido_paterno','apellido_materno','foto','telefono','celular','dirección','ciudad','fecha_nacimiento','sexo','profesión','nacionalidad','edad','estado','email','usuario','password');
        $this->order  = array('id_persona' => 'asc');
        $this->id = 'id_persona';
    }
    
}