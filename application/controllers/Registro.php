<?php defined('BASEPATH') OR exit('No direct script access allowed');


class Registro extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('grocery_CRUD');
        // $this->load->library('ajax_grocery_CRUD');
    }

    public function _viewOutPut($vista) {
        $data['vista'] = $vista;
        $data['controlador'] = 'Registro';
        $this->load->view('plantilla/header');
        $this->load->view('crud/contenido',$data);
        $this->load->view('plantilla/footer');
    }

    public function __salida_output($output = null) {
        $this->load->view('crud/crud.php', $output);
    }

    public function index()
    {
    }
    //------------------ Modulo Cargo ----------------------------------------
    function cargo(){
        $this->_viewOutPut('cargoCrud');
    }
    function cargoCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Cargo');
            $crud->set_table('cargo');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo Cargo ----------------------------------------

    //------------------ Modulo Usuario // cambiar contraseña ----------------------------------------
    function usuario(){
        $this->_viewOutPut('usuarioCrud');
    }
    function usuarioCrud() {
        try {
            $crud = new grocery_CRUD();
            // $crud->set_theme('bootstrap');
            $crud->set_subject('Persona');
            $crud->set_table('persona');
            $crud->columns('apellido_paterno','apellido_materno','nombres','fecha_nacimiento','celular','direccion','foto');
            $crud->display_as('ci','CI');       
            $crud->set_rules('email', 'Email', 'trim|valid_email|max_length[255]');
            $crud->set_rules('nombres', 'Nombre(s)', 'trim|callback_alpha_dash_space');
            $crud->set_rules('apellido_paterno', 'apellido_paterno', 'trim|callback_alpha_dash_space');
            $crud->set_rules('apellido_materno', 'apellido_paterno', 'trim|callback_alpha_dash_space');
            $crud->required_fields('usuario','password');


            $crud->set_field_upload('foto','upload');
            $crud->callback_before_upload(array($this,'image_callback_before_upload'));

            $crud->edit_fields(array('usuario','password'));

            $crud->change_field_type('password', 'password');
            $crud->callback_before_insert(array($this,'encrypt_password'));
            $crud->callback_before_update(array($this,'encrypt_password'));

            $crud->unset_print();
            $crud->unset_add();
            $crud->unset_read();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    // ------------------fin cambiar usuario y contraseña ----------------------

    //------------------ Modulo Persona ----------------------------------------
    function persona(){
        $this->_viewOutPut('personaCrud');
    }
    function personaCrud() {
        try {
            $crud = new grocery_CRUD();
            // $crud->set_theme('bootstrap');
            $crud->set_subject('Persona');
            $crud->set_table('persona');
            $crud->columns('apellido_paterno','apellido_materno','nombres','fecha_nacimiento','celular','direccion','foto');
            $crud->display_as('ci','CI');       
            $crud->set_rules('email', 'Email', 'trim|valid_email|max_length[255]');
            $crud->set_rules('nombres', 'Nombre(s)', 'trim|callback_alpha_dash_space');
            $crud->set_rules('apellido_paterno', 'apellido_paterno', 'trim|callback_alpha_dash_space');
            $crud->set_rules('apellido_materno', 'apellido_paterno', 'trim|callback_alpha_dash_space');
            $crud->required_fields('nombres','apellido_paterno','email','ci','fecha_nacimiento','direccion', 'sexo', 'nacionalidad');

            $crud->field_type('ciudad','dropdown',array('La Paz'=>'La Paz', 'Chuquisaca'=>'Chuquisaca', 'Oruro'=>'Oruro', 'Potosi'=>'Potosi',
                'Santa Cruz'=>'Santa Cruz', 'Beni'=>'Beni', 'Pando'=>'Pando', 'Tarija'=>'Tarija', 'Cochabamba'=>'Cochabamba'));
            $crud->field_type('sexo','dropdown',array('M'=>'MASCULINO', 'F'=>'FEMENINO'));


            $crud->set_field_upload('foto','upload');
            $crud->callback_before_upload(array($this,'image_callback_before_upload'));
            $crud->order_by('id_persona','desc');

            $crud->edit_fields(array('apellido_paterno','apellido_materno','nombres', 'foto','telefono','celular','direccion','ciudad','fecha_nacimiento','sexo','profesion','nacionalidad','email'));
            $crud->add_fields(array('apellido_paterno','apellido_materno','nombres', 'foto','telefono','celular','direccion','ciudad','fecha_nacimiento','sexo','profesion','nacionalidad','email'));

            // $crud->callback_edit_field('password',array($this,'set_password_input_to_empty'));
            // $crud->callback_add_field('password',array($this,'set_password_input_to_empty'));
            
            // $crud->change_field_type('password', 'password');
            // $crud->callback_before_insert(array($this,'encrypt_password'));
            // $crud->callback_before_update(array($this,'encrypt_password'));

            $crud->unset_print();
            $crud->unset_read();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    function encrypt_password($post_array, $primary_key = null){
        $this->load->helper('security');
        $post_array['password'] = do_hash($post_array['password'], 'sha1');
        return $post_array;
    }
    function image_callback_before_upload($files_to_upload,$field_info)
    {
        foreach($files_to_upload as $value) {
            $ext = pathinfo($value['name'], PATHINFO_EXTENSION);
        }

        $allowed_formats = array("jpg", "png", "jpeg");
        if(in_array($ext,$allowed_formats))
        {
            return true;
        }
        else
        {
            return 'Formato de imagen invalido';
        }

    }
    function alpha_dash_space($str)
    {
        return ( ! preg_match("/^([-a-z_ ])+$/i", $str)) ? FALSE : TRUE;
    }
    function set_password_input_to_empty() {
        return "<input type='password' name='password' value='' />";
    }
    //------------------ Fin Modulo persona ----------------------------------------
     
    //------------------ Modulo Persona_Cargo ----------------------------------------
    function persona_cargo(){
        $this->_viewOutPut('persona_cargoCrud');
    }
    function persona_cargoCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Asignacion');
            $crud->set_table('persona_cargo');
            $crud->columns('id_persona','fecha_asignacion','id_cargo','usuario','password');

            $crud->display_as('id_persona','Persona');
            $crud->display_as('id_cargo','Cargo');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));

            //relacion con la tabla 1:n set_relation(id_campo_foraneo,tabla_foranea,nombre_campo_foraneo)
            $crud->set_relation('id_cargo','cargo','{nombre}');
            $crud->set_relation('id_persona','persona','{apellido_paterno} {apellido_materno} {nombres}');

            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo Persona_Cargo -------------------------------------------

    //------------------ Modulo Roles ----------------------------------------
    function roles(){
        $this->_viewOutPut('rolesCrud');
    }
    function rolesCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Roles');
            $crud->set_table('roles');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo Roles ----------------------------------------

    //------------------ Modulo peronsa_roles ----------------------------------------
    function persona_roles(){
        $this->_viewOutPut('persona_rolesCrud');
    }
    function persona_rolesCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Asignar Roles');
            $crud->set_table('personas_roles');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            
            $crud->display_as('id_persona','Persona');
            $crud->display_as('id_rol','Rol');
            $crud->set_relation('id_rol','roles','{nombre}');
            $crud->set_relation('id_persona','persona','{apellido_paterno} {apellido_materno} {nombres}');

            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo peronsa_roles ----------------------------------------    
    
    //------------------ Modulo menus_principales ----------------------------------------
     function menus_principales(){
        $this->_viewOutPut('menus_principalesCrud');
    }
    function menus_principalesCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Menus Principales');
            $crud->set_table('menus_principales');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo menus_principales ----------------------------------------   

    //------------------ Modulo Menus ----------------------------------------
    function menus(){
        $this->_viewOutPut('menusCrud');
    }
    function menusCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Menus');
            $crud->set_table('menus');
            $crud->add_fields('nombre', 'directorio', 'icono', 'imagen','color','orden','estado');
            $crud->columns('nombre', 'directorio', 'icono', 'imagen','color','orden','estado');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo Menus ----------------------------------------   

    //------------------ Modulo roles_menus_principales ----------------------------------------
    function roles_menus_principales(){
        $this->_viewOutPut('roles_menus_principalesCrud');
    }
    function roles_menus_principalesCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Roles Menus Principales');
            $crud->set_table('roles_menus_principales');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            
            $crud->display_as('id_persona','Persona');
            $crud->display_as('id_rol','Rol');
            $crud->set_relation('id_rol','roles','{nombre}');
            $crud->set_relation('id_menu_principal','menus_principales','{nombre}');

            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo roles_menus_principales ----------------------------------------      


    //------------------ Modulo arbitro ----------------------------------------
    function arbitro(){
        $this->_viewOutPut('arbitroCrud');
    }
    function arbitroCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Arbitro');
            $crud->set_table('arbitro');
            // $crud->add_fields('id_persona', 'id_catarbitro', 'disciplina', 'observaciones','estado');
            // $crud->columns('id_persona','id_catarbitro','disciplina');
            $crud->display_as('id_persona','Persona');
            $crud->display_as('id_catarbitro','Categoria Arbitro');
            $crud->set_relation('id_persona','persona','{apellido_paterno} {apellido_materno} {nombres}');
            $crud->set_relation('id_catarbitro','categoria_arbitro','{nombre}');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->field_type('disciplina','dropdown',array('FÚTBOL'=>'FÚTBOL', 'FUTSAL'=>'FUTSAL'));

            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo arbitro ----------------------------------------      

    //------------------ Modulo categoria_arbitro ----------------------------------------
    function categoria_arbitro(){
        $this->_viewOutPut('categoria_arbitroCrud');
    }
    function categoria_arbitroCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Categoria Arbitro');
            $crud->set_table('categoria_arbitro');
            // $crud->columns('id_persona','id_catarbitro','disciplina');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo arbitro ----------------------------------------       

    //------------------ Modulo partidos_arbitro ----------------------------------------
    function partidos_arbitro(){
        $this->_viewOutPut('partidos_arbitroCrud');
    }
    function partidos_arbitroCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Partidos arbitro');
            $crud->set_table('arbitro');
            $crud->display_as('id_persona','Persona');
            $crud->set_relation('id_persona','persona','{apellido_paterno} {apellido_materno} {nombres}');
            $crud->display_as('id_arbitro','Arbitro');
            $crud->set_relation('id_catarbitro','categoria_arbitro','{nombre}');

            // $crud->set_primary_key('id_arbitro','v_partidos_arbitro');
            
            // $crud->field_type('cargo','dropdown',array('REFERI'=>'REFERI', 'REFERI ASISTENTE'=>'REFERI ASISTENTE'));

            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    /*    CREATE VIEW v_partidos_arbitro as 
          SELECT CONCAT(persona.apellido_paterno,' ',persona.apellido_materno,' ',persona.nombres) AS arbitro, arbitro.id_arbitro, persona.id_persona
          FROM persona, arbitro, partidos_arbitro
		  WHERE persona.id_persona=arbitro.id_persona
          AND   partidos_arbitro.id_arbitro=arbitro.id_arbitro */

    //------------------ Fin Modulo partidos_arbitro ----------------------------------------   
    
     //------------------ Modulo planillero ----------------------------------------
    function planillero(){
        $this->_viewOutPut('planilleroCrud');
    }
    function planilleroCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Planillero');
            $crud->set_table('planillero');
            $crud->display_as('id_persona','Planillero');
            $crud->set_relation('id_persona','persona','{apellido_paterno} {apellido_materno} {nombres}');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->field_type('disciplinas','dropdown',array('FUTBOL'=>'FUTBOL', 'FUTSAL'=>'FUTSAL'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo planillero ----------------------------------------       

     //------------------ Modulo jugador ----------------------------------------
     function jugador(){
        $this->_viewOutPut('jugadorCrud');
    }
    function jugadorCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Jugador');
            $crud->set_table('jugador');
            // $crud->columns('id_persona','n_registro_fbf','lfpb_asociacion_liga_provincial','categoria','club','posicion');
            $crud->display_as('id_persona','Persona');
            $crud->display_as('n_registro_fbf','Nº Registro');
            $crud->display_as('lfpb_asociacion_liga_provincial','Asociación o liga pronvial');
            $crud->display_as('nombre_padre','Nombre del padre');
            $crud->display_as('nombre_madre','Nombre del madre');
            $crud->display_as('estado_civil','Estado civil');
            $crud->display_as('c_i','C. I.');
            $crud->display_as('estatura','Estatura');
            $crud->set_relation('id_persona','persona','{apellido_paterno} {apellido_materno} {nombres}');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->field_type('posicion','dropdown',array('Arquero'=>'Arquero', 'Defensa'=>'Defensa','Medio campo'=>'Medio campo','Carrilero o lateral'=>'Carrilero o lateral','Volante extremo'=>'Volante extremo','Segundo delantero'=>'Segundo delantero','Centro delantero'=>'Centro delantero','Mixto'=>'Mixto'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo jugador ----------------------------------------         

     //------------------ Modulo categoria ----------------------------------------
     function categoria(){
        $this->_viewOutPut('categoriaCrud');
    }
    function categoriaCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Categoria');
            $crud->set_table('categoria');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo categoria ----------------------------------------      
      
    //------------------ Modulo jugador_categoria ----------------------------------------
    // function jugador_categoria(){
    //     $this->_viewOutPut('jugador_categoriaCrud');
    // }
    // function jugador_categoriaCrud() {
    //     try {
    //         $crud = new grocery_CRUD();
    //         $crud->set_theme('bootstrap');
    //         $crud->set_subject('Jugador categoria');
    //         $crud->set_table('jugador_categoria');
    //         $crud->set_primary_key('id_jugador','v_jugador_categoria');
    //         $crud->set_relation('id_jugador','v_jugador_categoria','{jugador}');
    //         $crud->display_as('id_jugador','Jugador');
    //         $crud->display_as('id_categoria','Categoria');
    //         $crud->set_relation('id_categoria','categoria','{nombre}');
    //         $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
    //         $crud->unset_print();
    //         $crud->unset_export();
    //         $output = $crud->render();
    //         $this->__salida_output($output);
    //     } catch (Exception $e) {
    //         show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
    //     }
    // }
        /*    CREATE VIEW v_jugador_categoria as 
          		SELECT CONCAT(persona.apellido_paterno,' ',persona.apellido_materno,' ',persona.nombres) AS jugador, jugador.id_jugador, persona.id_persona, categoria.id_categoria
                FROM persona, jugador, jugador_categoria,categoria
                WHERE persona.id_persona=jugador.id_persona
                AND   jugador_categoria.id_jugador=jugador.id_jugador 
                AND   jugador_categoria.id_categoria=categoria.id_categoria*/
    //------------------ Fin Modulo arbitro ----------------------------------------    

    //---------- Modulo jugador_categoria cambio a inscripcionjugador ------------
    function jugador_categoria(){
        $this->_viewOutPut('inscripcionjugadorcrud');
    }
    function inscripcionjugadorcrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Inscripcion del jugador');
            $crud->set_table('inscripcionjugador');
            
            $crud->set_relation_n_n('id_jugador', 'jugador', 'persona', 'id_jugador', 'id_jugador', '{nombres} {apellido_paterno} {apellido_materno}');
            $crud->display_as('id_jugador','Jugador');

            $crud->set_relation_n_n('id_equipo', 'equipo', 'categoria', 'id_equipo', 'id_categoria', '{nombre} ');
            $crud->display_as('id_equipo','Categoria');


            // $crud = new ajax_grocery_CRUD();

            // club -> equipos -> categoria
            // country -> address -> state
            // $crud->set_table('equipos');
            // print_r('<pre>');
            // $crud->set_relation('id_club','club','nombre_club');

            // $crud->set_relation('id_categoria','categoria','id_equipo');

            // $crud->set_relation_dependency('id_categoria','id_club', 'id_club');
            




            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //---------- Modulo jugador_categoria cambio a inscripcionjugador ------------    

    //------------------ Modulo equipo ----------------------------------------
      function equipo(){
        $this->_viewOutPut('equipoCrud');
    }
    // function equipoCrud() {
    //     try {
    //         $crud = new grocery_CRUD();
    //         $crud->set_theme('bootstrap');
    //         $crud->set_subject('Equipo');
    //         $crud->set_table('inscripcionequipo');
    //         $crud->columns('id_personacargo','id_club','genero','id_categoria','fecha');
    //         $crud->add_fields('id_personacargo','id_club','genero','id_categoria','fecha');
    //         $crud->edit_fields('id_personacargo','id_club','genero','id_categoria','fecha');

    //         $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
    //         $crud->field_type('genero','dropdown',array('M'=>'Masculino', 'F'=>'Femenino'));
    //         $crud->set_field_upload('escudo','upload/equipo');
    //         $crud->callback_before_upload(array($this,'image_callback_before_upload'));

    //         $crud->display_as('id_personacargo','Entrenador');
    //         $crud->set_relation('id_personacargo','persona','{apellido_paterno} {apellido_materno} {nombres}');

    //         $crud->display_as('id_club','Club');
    //         $crud->set_relation('id_club','club','{nombre_club}');

    //         $crud->display_as('id_categoria','Categoria');
    //         $crud->set_relation('id_categoria','categoria','{nombre}');

    //         // $crud->field_type('ciudad','dropdown',array('La Paz'=>'La Paz', 'Chuquisaca'=>'Chuquisaca', 'Oruro'=>'Oruro', 'Potosi'=>'Potosi','Santa Cruz'=>'Santa Cruz', 'Beni'=>'Beni', 'Pando'=>'Pando', 'Tarija'=>'Tarija', 'Cochabamba'=>'Cochabamba'));
    //         $crud->unset_print();
    //         $crud->unset_export();
    //         $output = $crud->render();
    //         $this->__salida_output($output);
    //     } catch (Exception $e) {
    //         show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
    //     }
    // }
    function equipoCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Equipo');
            $crud->set_table('equipo');
            $crud->columns('id_personacargo','id_club','genero','id_categoria');
            $crud->add_fields('id_personacargo','id_club','genero','id_categoria');
            $crud->edit_fields('id_personacargo','id_club','genero','id_categoria');

            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->field_type('genero','dropdown',array('M'=>'Masculino', 'F'=>'Femenino'));
            $crud->set_field_upload('escudo','upload/equipo');
            $crud->callback_before_upload(array($this,'image_callback_before_upload'));

            $crud->display_as('id_personacargo','Entrenador');
            $crud->set_relation('id_personacargo','persona','{apellido_paterno} {apellido_materno} {nombres}');

            $crud->display_as('id_club','Club');
            $crud->set_relation('id_club','club','{nombre_club}');

            $crud->display_as('id_categoria','Categoria');
            $crud->set_relation('id_categoria','categoria','{nombre}');

            // $crud->field_type('ciudad','dropdown',array('La Paz'=>'La Paz', 'Chuquisaca'=>'Chuquisaca', 'Oruro'=>'Oruro', 'Potosi'=>'Potosi','Santa Cruz'=>'Santa Cruz', 'Beni'=>'Beni', 'Pando'=>'Pando', 'Tarija'=>'Tarija', 'Cochabamba'=>'Cochabamba'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo equipo ----------------------------------------    
    
    //------------------ Modulo equipo ----------------------------------------
    function equipo_jugador_CCCCambio_de_nombre(){
        $this->_viewOutPut('equipo_jugadorCrud');
    }
    function equipo_jugadorCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Inscripcion Jugador');
            $crud->set_table('inscripcionjugador');
            
            $crud->set_relation_n_n('id_jugador', 'jugador', 'persona', 'id_jugador', 'id_persona', '{nombres} {apellido_paterno} {apellido_materno}');
            $crud->display_as('id_jugador','Jugador');

            $crud->set_primary_key('id_equipo','v_equipo');
            $crud->set_relation('id_inscripcionequipo','v_equipo','{nombre_club} - {nombre}');
            $crud->display_as('id_inscripcionequipo','Equipo');

            // $crud->set_primary_key('id_jugador','v_jugador_categoria');
            // $crud->set_relation('id_jugador','v_jugador_categoria','{jugador}');
            // $crud->display_as('id_jugador','Jugador');
            // $crud->set_primary_key('id_equipo','v_equipo');
            // $crud->set_relation('id_equipo','v_equipo','{nombre_club} ');
            // $crud->display_as('id_equipo','Equipo');


            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo equipo ----------------------------------------    

    //------------------ Modulo club ----------------------------------------
    function club(){
        $this->_viewOutPut('clubCrud');
    }
    function clubCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Club');
            $crud->set_table('club');
            $crud->set_relation('id_personacargo','persona','{nombres} {apellido_paterno} {apellido_materno}');
            $crud->display_as('id_personacargo','Presidente');
            $crud->set_field_upload('escudo','upload/escudo');
            $crud->callback_before_upload(array($this,'image_callback_before_upload'));

            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo club ----------------------------------------        

    //------------------ Modulo transferencia ----------------------------------------
    function transferencia(){
        $this->_viewOutPut('transferenciaCrud');
    }
    function transferenciaCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Transferencias');
            $crud->set_table('transferencias');
            $crud->set_relation('id_equipo','equipo','{nombre_equipo}');
            $crud->display_as('id_equipo','Equipo');

            $crud->set_relation('id_equipo_destino','equipo','{nombre_equipo}');
            $crud->display_as('id_equipo_destino','Equipo');

            $crud->set_primary_key('id_jugador','v_jugador_categoria');
            $crud->set_relation('id_jugador','v_jugador_categoria','{jugador}');
            $crud->display_as('id_jugador','Jugador');
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo transferencia ----------------------------------------      
    
     //------------------ Modulo torneo ----------------------------------------
     function torneo(){
        $this->_viewOutPut('torneoCrud');
    }
    function torneoCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Torneo');
            $crud->set_table('torneo');
            
            // $crud->set_relation('id_categoria','categoria','{nombre}');
            // $crud->display_as('id_categoria','Categoria');

            $crud->display_as('nombretorneo','Nombre del Torneo');
            $crud->display_as('fecha_inicio','Inicia');
            $crud->display_as('fecha_fin','Termina');

            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo torneo ----------------------------------------    
    
     //------------------ Modulo torneo_equipo ----------------------------------------
    function torneo_equipo(){
        $this->_viewOutPut('torneo_equipoCrud');
    }
    function torneo_equipoCrud() {
        try {
            $crud = new grocery_CRUD();
            // $crud->set_theme('bootstrap');
            $crud->set_subject('Inscripcion de equipos');
            $crud->set_table('inscripcionequipo');

            $crud->set_relation('id_personacargo','persona','{nombres} {apellido_paterno} {apellido_materno}');
            $crud->display_as('id_personacargo','Director técnico');

            $crud->set_relation('id_club','club','{nombre_club}');
            $crud->display_as('id_club','Club');

            $crud->set_relation('id_categoria','categoria','{nombre}');
            $crud->display_as('id_categoria','Categoria');

            $crud->set_primary_key('id_torneo','v_torneo_activo');
            $crud->set_relation('id_torneo','v_torneo_activo','{nombretorneo}');
            $crud->display_as('id_torneo','Torneo');

            $crud->field_type('genero','dropdown',array('M'=>'Masculino', 'F'=>'Femenino'));

            if( $crud->getState() == 'add' ) { //add these only in add form
                $crud->set_css('assets/grocery_crud/css/ui/simple/'.grocery_CRUD::JQUERY_UI_CSS);
                $crud->set_js('assets/grocery_crud/js/jquery_plugins/config/jquery.datepicker.config.js');
            }
            $crud->display_as('fecha','Fecha inscripción');

            $crud->callback_add_field('fecha',array($this,'_add_default_date_value'));

            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }

    function _add_default_date_value(){
        $value = !empty($value) ? $value : date("d/m/Y");
        $return = '<input type="text" name="date" value="'.$value.'" class="datepicker-input" /> ';
        $return .= '<a class="datepicker-input-clear" tabindex="-1"></a> (dd/mm/yyyy)';
        return $return;
    }

    //------------------ Fin Modulo torneo_equipo ----------------------------------------    

     //------------------ Modulo costos_torneo ----------------------------------------
     function costos_torneo(){
        $this->_viewOutPut('costos_torneoCrud');
    }
    function costos_torneoCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Costos Torneo');
            $crud->set_table('costos_torneo');
            $crud->set_relation('id_concepto','concepto','{nombre}');
            $crud->display_as('id_concepto','Concepto');
            $crud->set_relation('id_torneo','torneo','{nombre}');
            $crud->display_as('id_torneo','Torneo');

            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo costos_torneo ---------------------------------------- 
    
     //------------------ Modulo concepto ----------------------------------------
     function concepto(){
        $this->_viewOutPut('conceptoCrud');
    }
    function conceptoCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Concepto');
            $crud->set_table('concepto');
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo concepto ---------------------------------------- 
 
     //------------------ Modulo transacciones ----------------------------------------
     function transacciones(){
        $this->_viewOutPut('transaccionesCrud');
    }
    function transaccionesCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Transacciones');
            $crud->set_table('transacciones');

            $crud->set_primary_key('id_torneoEquipo','v_torneo_equipo');
            $crud->set_relation('id_torneoequipo','v_torneo_equipo','{equipo_torneo}');
            $crud->display_as('id_torneoequipo','Equipo Torneo');

            
            $crud->set_primary_key('id_costostorneo','v_costo_torneo');
            $crud->set_relation('id_costostorneo','v_costo_torneo','{torneo_costo}');
            $crud->display_as('id_costostorneo','Costo Torneo');

            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
        /*      CREATE VIEW v_torneo_equipo as 
          		SELECT torneo_equipo.id_torneoEquipo,CONCAT(equipo.nombre_equipo,' -> ',torneo.nombre) AS equipo_torneo
                FROM torneo_equipo, equipo, torneo
                WHERE torneo_equipo.id_equipo=equipo.id_equipo
                AND	  torneo_equipo.id_torneo=torneo.id_torneo
                
                CREATE VIEW v_costo_torneo as 
          		SELECT costos_torneo.id_costostorneo,CONCAT('Bs. ',costos_torneo.costo,' - ',concepto.nombre,' -> ',torneo.nombre) AS torneo_costo
                FROM costos_torneo, torneo, concepto
                WHERE costos_torneo.id_torneo=torneo.id_torneo
                AND	  costos_torneo.id_concepto=concepto.id_concepto*/


    //------------------ Fin Modulo transacciones ---------------------------------------- 
    
     //------------------ Modulo estadio ----------------------------------------
     function estadio(){
        $this->_viewOutPut('estadioCrud');
    }
    function estadioCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Estadio');
            $crud->set_table('estadio');
            $crud->set_field_upload('foto','upload/estadio');
            $crud->callback_before_upload(array($this,'image_callback_before_upload'));
            $crud->field_type('ciudad','dropdown',array('La Paz'=>'La Paz', 'Chuquisaca'=>'Chuquisaca', 'Oruro'=>'Oruro', 'Potosi'=>'Potosi',
            'Santa Cruz'=>'Santa Cruz', 'Beni'=>'Beni', 'Pando'=>'Pando', 'Tarija'=>'Tarija', 'Cochabamba'=>'Cochabamba'));            
            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));

            $crud->display_as('nombreestadio','Nombre Estadio');

            //añadiendo campos
            // $state = $crud->getState();
            // $state_info = $crud->getStateInfo();
            // if($state == 'add')
            // {
            //     // $crud->callback_add_field('id_estadio',array($this,'_add_default_date_value1'));
            //     // $crud->callback_add_field('capacidad',array($this,'capacidad'));
            //     // $crud->callback_add_field('capacidad',array($this,'amount_field_add_callback'));
            //     print_r($state_info);
            // }
            //añadiendo campos
            // $crud->callbackAddField('capacidad', function ($fieldType, $fieldName) {
            //     return '<input class="form-control" name="' . $fieldName . '" type="text" value="">';
            // });

            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }

//     function amount_field_add_callback()
// {
//   return '<input type="text" maxlength="50" value="" name="amount">';
// }
    //------------------ Fin Modulo estadio ---------------------------------------- 

    //------------------ Modulo estadio ---------------------------------------- 
    public function partidos()
    {
        $this->_viewOutPut('partidosCrud');
    }

    // TODO: verificar si es necesario eliminar
    public function get_equipos_by_torneo($id_torneo)
    {
        $this->db->select('torneo_equipo.id_torneoEquipo, equipo.nombre_equipo');
        $this->db->from('torneo_equipo');
        $this->db->join('equipo', 'equipo.id_equipo = torneo_equipo.id_equipo');
        $this->db->join('torneo', 'torneo.id_torneo = torneo_equipo.id_torneo');
        $this->db->where('torneo_equipo.id_torneo', $id_torneo);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_planillero()
    {
        $this->db->select('planillero.id_planillero, persona.nombres, persona.apellido_paterno, persona.apellido_materno');
        $this->db->from('planillero');
        // $this->db->join('planillero', 'planillero.id_planillero = partidos.id_planillero');
        $this->db->join('persona', 'persona.id_persona = planillero.id_persona');
        // $this->db->where('torneo_equipo.id_torneo', $id_torneo);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function partidosCrud()
    {


        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Partido');
            $crud->set_table('partidos');

            // print_r('<pre>');
            // print_r($this->get_equipos_by_torneo(1));
            $equipo = $this->get_equipos_by_torneo(1);

            foreach ($equipo as $key => $value) {
                $arraye1[$value['id_torneoEquipo']] = $value['nombre_equipo'];
                $arraye2[$value['id_torneoEquipo']] = $value['nombre_equipo'];
            }


            $planillero = $this->get_planillero();
            // print_r($planillero);
            // exit();
            foreach ($planillero as $key => $value) {
                $plani[$value['id_planillero']] = $value['nombres'].' '.$value['apellido_paterno'].' '.$value['apellido_materno'];
            }
            // print_r($plani);

            // $crud->set_relation_n_n('PlanilleroNombre', 'planillero', 'persona', 'id_planillero', 'id_persona', '{nombres} {apellido_paterno} {apellido_materno}');
            $crud->field_type('id_planillero','dropdown', $plani);
            $crud->field_type('id_torneoequipo1','dropdown', $arraye1);
            $crud->display_as('id_torneoequipo1','Equipo Local');
            $crud->field_type('id_torneoequipo2','dropdown', $arraye1);
            $crud->display_as('id_torneoequipo2','Equipo Visitante');
            $crud->set_relation('id_jornadas','jornadas','{fecha} {año} {horas}');
            $crud->set_relation('id_estadio','estadio','{nombreestadio}'.' - '.' {ciudad}');
            $crud->set_relation('id_partarbitro','partidos_arbitro','{cargo}');

            $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));

            // $crud->field_type('PlanilleroNombre','dropdown',array($crud->set_relation_n_n('PlanilleroNombre', 'planillero', 'persona', 'id_planillero', 'id_persona', 'nombres','disciplinas')));
            // $crud->set_relation_n_n('id_planillero','planillero','{nombre}');
            // $crud->set_relation('id_persona','persona','{apellido_paterno} {apellido_materno} {nombres}');


            // $crud->set_field_upload('foto','upload/partidos');
            // $crud->callback_before_upload(array($this,'image_callback_before_upload'));
            // $crud->field_type('ciudad','dropdown',array('La Paz'=>'La Paz', 'Chuquisaca'=>'Chuquisaca', 'Oruro'=>'Oruro', 'Potosi'=>'Potosi',
            // 'Santa Cruz'=>'Santa Cruz', 'Beni'=>'Beni', 'Pando'=>'Pando', 'Tarija'=>'Tarija', 'Cochabamba'=>'Cochabamba'));            
            // $crud->field_type('estado','dropdown',array('1'=>'Activo', '0'=>'Inactivo'));

            // $crud->display_as('nombreestadio','Nombre Estadio');
            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo estadio ---------------------------------------- 

     function precio_concepto(){
        $this->_viewOutPut('precio_conceptoCrud');
    }
    function precio_conceptoCrud() {
        try {
            $crud = new grocery_CRUD();
            $crud->set_theme('bootstrap');
            $crud->set_subject('Precio');
            $crud->set_table('precio_concepto');

            // para mostrar la ordenacion de los campo en la lista 
            $crud->columns('precio', 'id_categoria', 'id_concepto', 'id_motivo');
            // ordenacion al añadir y al editar
            $crud->fields('precio', 'id_categoria', 'id_concepto', 'id_motivo');

            $crud->set_relation('id_categoria','categoria','{nombre}');
            $crud->display_as('id_categoria','Categoria');
            // $crud->add_fields('precio', 'id_categoria', 'id_concepto', 'id_motivo');
            // $crud->edit_fields('precio', 'id_categoria', 'id_concepto', 'id_motivo');
            // $crud->order_by('id_categoria','desc');



            $crud->set_relation('id_concepto','concepto','{nombre}');
            $crud->display_as('id_concepto','Concepto');

            $crud->set_relation('id_motivo','motivo','{descripcion}');
            $crud->display_as('id_motivo','Motivo');

            $crud->required_fields('precio', 'id_categoria', 'id_concepto', 'id_motivo');


            $crud->unset_print();
            $crud->unset_export();
            $output = $crud->render();
            $this->__salida_output($output);
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    //------------------ Fin Modulo precio_concepto ----------------------------------------
    
    

    //------------------------- View  ------------------------------------------------------
    public function salida($data)
    {
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }


}