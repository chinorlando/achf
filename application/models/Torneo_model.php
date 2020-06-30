<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Torneo_model extends MY_Model {

    public function __construct()
    {
        parent::__construct();

        $this->table  = 'torneo';
        $this->column = array('id_torneo', 'nombretorneo', 'fecha_inicio','fecha_fin', 'estado');
        $this->order  = array('id_torneo' => 'asc');
        $this->id = 'id_torneo';

    }
    
}