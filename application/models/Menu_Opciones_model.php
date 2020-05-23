<?php


class Menu_Opciones_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    public function get_users()
    {
        $sql = "SELECT personas_roles.id, persona.id_persona,CONCAT(persona.apellido_paterno,' ',persona.apellido_materno,' ',persona.nombres)AS nombre_completo, personas_roles.estado
                  FROM personas_roles,persona 
                 WHERE personas_roles.id_persona=persona.id_persona
                 AND   personas_roles.estado=1";
        $query = $this->db->query($sql);
        return $query->result();
    }
    public function get_menu(){
        $sql = "SELECT menus_principales.id as id_menu_principal, menus_principales.nombre, menus_principales.estado
                FROM menus_principales 
                WHERE menus_principales.estado=1";
        $query = $this->db->query($sql);
        return $query->result();       
    }
    public function get_menu_item($id_rol,$id_menu_principal){
        $this->db->from('v_personas_menus_principales');
        $this->db->where('id_menu_principal',$id_menu_principal);
        $this->db->where('id_rol',$id_rol);
        $query = $this->db->get();
        return $query->num_rows();
    }
    public function delete_menu_usuario($id_rol){
        $this->db->where('id_rol',$id_rol);
        $this->db->delete('roles_menus_principales');
    }
    public function insertar_menu_usuario($datos){
        $this->db->insert('roles_menus_principales',$datos);
    }

}