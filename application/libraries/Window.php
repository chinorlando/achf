<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Window {

    public function __construct()
    {

    }

    public function titulo_navegacion($menu_principal,$opcion)
    {
        $cabeza = ' <section class="content-header">
                      <h1>                      
                        Registro del Menu Principal -
                        <small>'.$opcion.'</small>
                      </h1>
                      <ol class="breadcrumb">
                        <li><a href="#"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                        <li><a href="#">'.$menu_principal.'</a></li>
                        <li class="active">'.$opcion.'</li>
                      </ol>
                    </section>';
    	return $cabeza;
    }
}
?>