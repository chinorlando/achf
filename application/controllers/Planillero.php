<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Planillero extends CI_Controller {

    static $FechaLibre = [];
    static $intValue;
    static $Equipo = [];
    static $partido = [];
    static $libre;
    static $equipos;
    static $imaginario;
    static $bolo = [];
    static $i = 1 ;

    public function __construct() {

        parent::__construct();
        $this->load->Model('Estadio_model','dbase');
        $this->load->library('Window');
        //isLoggedIn();
    }

    public function index()
    {       
        $opcion = 'Fixture';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'planillero',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion)
        );
        $data['vista']  = 'v_sorteo';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function get_torneos()
    {
        // optien todos lo torneos que por lo menos tengan 4 equipos inscritos
        $torneos = $this->dbase->get_torneo_almost_four_teams();
        // print_r($torneos);
        echo json_encode($torneos);

        // $nivel_curso = $this->db->get('torneo')->result();
        // echo json_encode($nivel_curso);
    }

    public function get_torneo_activo()
    {
        $id_torneo = $this->db->get_where('torneo', array(
                'estado' => 1,
            ))->row()->id_torneo;
        return $id_torneo;
    }

    public function show_equipos()
    {
        // $id_torneo = $this->input->post('id_torneo');
        $id_torneo = $this->get_torneo_activo();

        $id_categoria = $this->input->post('id_categoria');
        $equipos_club = $this->dbase->get_equipos_by_torneo($id_torneo, $id_categoria);
        // print_r($equipos_club);
        // exit();

        $sorteado = FALSE;

        // si existe por lo menos un registro en tabla torneosorteado-->entonces el numero de bolos ya fue asignado a todos los equipos
        if ($this->dbase->counttorneo($id_torneo, $id_categoria)) { // , $id_camp_actual
            $dis = 'disabled';
            $num_bolos = TRUE;

            // $estado si 0 => partidos aun no serteado, 1 => partidos sorteados
            $estado = $this->db->get_where('categoriasorteado', array(
                'id_torneo' => $id_torneo,
                'id_categoria' => $id_categoria,
            ))->row()->sorteado;
            
            if ($estado) {
                $sorteado = TRUE;
            }

        } else {
            $dis = '';
            $num_bolos = FALSE;
        }
        

        

        // print_r($eso);
        // exit();


        // if ($estado) {
        //     $sorteado = TRUE;
        // } else {
        //     $sorteado = FALSE;
        // }
        $codhtml = '';
        $codhtml .= '<div class="row">';
          $codhtml.='<div class="col-md-12">';
            $codhtml.='<div class="box">';
              $codhtml.='<div class="box-header with-border">';
                $codhtml.='<h3 class="box-title">Asignación de bolos Table</h3>';
              $codhtml.='</div>';
              $codhtml.='<div class="box-body">';
                $codhtml.='<table class="table table-bordered">';
                $codhtml .= '<form id="form_bolo">';
                  $codhtml.='<tbody>';
                    $codhtml.='<tr>';
                      $codhtml.='<th style="width: 10px">#</th>';
                      $codhtml.='<th>Club</th>';
                      $codhtml.='<th>Num. de bolo</th>';
                      // $codhtml.='<th style="width: 40px">Label</th>';
                    $codhtml.='</tr>';
                    $i=1;
                    foreach ($equipos_club as $equipo => $value) {
                        $codhtml.= '<tr>';
                          $codhtml.='<td>'.$i++.'</td>';
                          $codhtml.='<td>'.$value->nombre_club.'</td>';
                          $codhtml.='<td>';
                            $codhtml.='<input type="text" id="bolo'.$value->id_club.'" name="bolo" value="'.$value->num_bolo.'"'.$dis.'>';
                          $codhtml.='</td>';
                          // $codhtml.='<input type="hidden" id="campeonato" name="campeonato" value="'.$id_camp_actual.'">';
                          // $codhtml.='<input type="hidden" id="torneo'.$value->id_club.'" name="torneo" value="'.$id_torneo.'">';
                          
                        $codhtml.='</tr>';
                    }
                  $codhtml.='</tbody>';
                $codhtml.='</table>';
                $codhtml.='</form>';
              $codhtml.='</div>';
              $codhtml.='<div class="box-footer clearfix">';
                $codhtml.='<button id="btn_fin_bolos" type="submit" onclick="fin_bolos()" class="btn btn-info btn-flat">Terminar asignación de número de bolos</button>';
                $codhtml.='<button id="btn_sort" type="submit" onclick="sorteo_equipos()" class="btn btn-success btn-flat">Sortear equipos</button>';
              $codhtml.='</div>';
            $codhtml.='</div>';
          $codhtml.='</div>';
        $codhtml.='</div>';

        $data = array('status'=>TRUE, 'cent' => $codhtml, 'num_bolos' => $num_bolos, 'sorteado' => $sorteado);
        echo json_encode($data);

    }

    public function if_save_num_bolos()
    {
        $id_torneo = $this->get_torneo_activo();
        $id_club = $_POST["id_club"];
        // $id_torneo = $_POST["id_torneo"];
        $num_bolo = json_decode($_POST["datos"])->num_bolo;

        $data =['num_bolo' => $num_bolo];
        $id_categoria = $_POST["id_categoria"];
        
        $this->dbase->update_inscripcionequipo($id_club, $id_torneo, $id_categoria, $data);

        echo json_encode(array('status' => TRUE));

    }

    public function save_categoriasorteado()
    {
        $id_torneo = $this->get_torneo_activo();
        $data = [
            'fecha_sorteo' => date('Y-m-d'),
            'id_categoria' => $this->input->post('id_categoria'),
            'id_torneo' => $id_torneo,
            'sorteado' => 0
        ];
        $this->dbase->save_categoriasorteo($data);

        echo json_encode(array('status' => TRUE));
    }

    public function update_categoriasorteado()
    {
        $id_torneo = $this->get_torneo_activo();
        $id_categoria = $this->input->post('id_categoria');

        $data = [
            'sorteado' => 1
        ];
        $this->dbase->update_categoriasorteado($id_torneo, $id_categoria, $data);
    }

    public function sorteo()
    {
        $id_torneo = $this->get_torneo_activo();
        $sorteado = $this->db->get_where('categoriasorteado', array(
            'id_torneo' => $id_torneo,
            'id_categoria' => $this->input->post('id_categoria'),
        ))->row()->sorteado;

        if ($sorteado == 1) {
            echo json_encode(array('status'=>'ya esta sorteado '));
        } else {
            
        
        
        
        // $torneo = 1;
        // $torneo = $this->input->post('id_torneo');
        $torneo = $this->get_torneo_activo();
        $id_categoria = $this->input->post('id_categoria');
        self::$equipos = $this->dbase->get_equipos_by_torneo($torneo, $id_categoria);
        // self::$equipos = array('A','B','C','D','E','F','G','H','I','J','K');

        // print_r('<pre>');
        // print_r(self::$equipos);
        // exit();

        $cantidad = count(self::$equipos);

        if (count(self::$equipos) < 4) {
            // if ($this->input->post('id_torneo') == -1) {
            if ($this->input->post('id_categoria') == -1) {
                echo json_encode(array('status'=>'negativo'));
            } else{
                echo json_encode(array('status'=>FALSE));
            }
        } else {
            // ordenacion
            foreach (self::$equipos as $key => $value) {
                $aux[] = $value->num_bolo;
            }
            array_multisort($aux,SORT_ASC, self::$equipos);
            // ordenacion

            foreach (self::$equipos as $key => $value) {
                self::$Equipo[$value->num_bolo] = $value->nombre_club;
                self::$bolo[$value->num_bolo] = $value->num_bolo;
            // foreach (self::$equipos as $key ) {
            //     self::$Equipo[] = $key;
            }

            // print_r(self::$Equipo);
            // exit();


            if ($cantidad % 2 == 0){
                $intWeeks = $cantidad - 1;
            } else {
                $intWeeks = $cantidad;
            }

            $this->fillauxiliar1($cantidad, $intWeeks);
            $jornada = $this->FillList1($cantidad, $intWeeks);
            // print_r('<pre>');
            // print_r($jornada);
            // print_r(self::$libre);
            // exit();

            $i=1;
            $cent = '';

            foreach ($jornada as $key => $item) {
                $cent .= '<div class="box box-default">';
                $cent .= '<div class="box-header with-border">';
                  $cent .= '<div class="box-tools pull-right">';
                    $cent .= '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>';
                    $cent .= '<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>';
                  $cent .= '</div>';
                $cent .= '</div>';
                $cent .= '<div class="box-body">';
                  $cent .= '<div class="row">';
                    
                        $cent .= '<div class="col-md-12">';
                            $cent .= '<div class="box">';
                                $cent .= '<div class="box-header">';
                                  $cent .= '<h3 class="box-title">Fecha: '.$i.'</h3>';
                                $cent .= '</div>';
                                $cent .= '<div class="box-body no-padding">';
                                  $cent .= '<table class="table table-condensed">';
                                    $cent .= '<thead>';
                                        $cent .= '<tr>';
                                            $cent .= '<th class="col-lg-4 text-right">Local</th>';
                                            // $cent .= '<th class="col-lg-1 text-center">Score</th>';
                                            $cent .= '<th class="col-lg-1 text-center"></th>';
                                            // $cent .= '<th class="col-lg-1 text-center">Score</th>';
                                            $cent .= '<th class="col-lg-4">Visitante</th>';
                                            // $cent .= '<th class="col-lg-1">Accion</th>';
                                        $cent .= '</tr>';
                                    $cent .= '</thead>';
                                    $cent .= '<tbody>';
                                foreach ($item as $key => $value) {
                                    $cent .= '<tr>';
                                        $cent .= '<td class="col-lg-4 text-right">'.$value[0].'</td>';
                                        // $cent .= '<td class="col-lg-1 text-center">-</td>';
                                        $cent .= '<td class="col-lg-1 text-center">VS</td>';
                                        // $cent .= '<td class="col-lg-1 text-center">-</td>';
                                        $cent .= '<td class="col-lg-4">'.$value[1].'</td>';
                                        // $cent .= '<th class="col-lg-1"><button>Ver</button></th>';
                                    $cent .= '</tr>';
                                }
                                if ((self::$libre)) {
                                    $cent .= '</tbody>';
                                    $cent .= '<tfoot>';
                                        $cent .= '<tr>';
                                            $cent .= '<th>Descansa:</th>';
                                            $cent .= '<th>'.self::$libre[$i-1].'</th>';
                                            $cent .= '<th></th>';
                                        $cent .= '</tr>';
                                    $cent .= '</tfoot>';
                                }
                                  $cent .= '</table>';
                                $cent .= '</div>';
                              $cent .= '</div>';
                        $cent .= '</div>';
                        $i++;
                  $cent .= '</div>';
                $cent .= '</div>';
              $cent .= '</div>';
            }

            echo json_encode(array('status'=>TRUE, 'cent' => $cent));
        }



        }
    }

    public function fillauxiliar1($NumPlayers, $intWeeks)
    {
        for ($intRow=2; $intRow <= $NumPlayers; $intRow++) { 
            self::$intValue = $intRow-1;
            for ($intCol=1; $intCol <= $intRow-1; $intCol++) { 
                self::$imaginario[$intRow][$intCol] = self::$intValue;
                self::$intValue++;
                if (self::$intValue > $intWeeks) {
                    self::$intValue = 1;
                }
            }
        }

        

        // print_r(self::$imaginario);
        // exit();

        // arreglamos la ultima fila
        if ($NumPlayers % 2 == 0) {
            $intRow = $NumPlayers;
            for ($intCol=1; $intCol <= $intRow-1; $intCol++) { 
                self::$imaginario[$intRow][$intCol] = self::$intValue;
                self::$intValue = self::$intValue + 2;
                if (self::$intValue > $intWeeks) {
                    self::$intValue = self::$intValue-$intWeeks;
                }
            }
        }
        // print_r(self::$imaginario);
        // exit();
    }

    public function FillList1($NumPlayers, $intWeeks)
    {
        // print_r(self::$equipos);
        // exit();
        for ($intListWeek=1; $intListWeek <= $intWeeks; $intListWeek++) { 
            for ($jj=1; $jj <= count(self::$equipos); $jj++) { 
                self::$FechaLibre[$jj] = 0;
            }
            $partidosWeek[] = $this->OneWeekFixtures1($NumPlayers, $intListWeek);
            // print_r($partidosWeek);
            // exit();

            for ($jj=1; $jj <= count(self::$equipos); $jj++) { 
                if (self::$FechaLibre[$jj] == 0) {
                    self::$libre[] = self::$Equipo[$jj];
                }
            }
        }
        return $partidosWeek;
    }

    public function OneWeekFixtures1($NumPlayers, $WeekNum)
    {
        // print_r(self::$equipos);
        //     exit();
        // $torneo = $this->input->post('id_torneo');
        $torneo = $this->get_torneo_activo();
        for ($intRow=2; $intRow <= $NumPlayers; $intRow++) { 
            for ($intCol=1; $intCol <= $intRow-1; $intCol++) {
                
                if (self::$imaginario[$intRow][$intCol] == $WeekNum) {
                    $strFixture1 = self::$Equipo[$intRow];
                    $strFixture2 = self::$Equipo[$intCol];
                    $e1 = self::$bolo[$intRow];
                    $e2 = self::$bolo[$intCol];
                    $this->dbase->save_partido($e1, $e2, self::$i, $torneo);
                    self::$FechaLibre[$intRow] = 2;
                    self::$FechaLibre[$intCol] = 2;
                    $partido[] = array($strFixture1,$strFixture2);
                    
                }
            }
        }
        self::$i++;
        // print_r($strFixture1.'-'.$strFixture2);
        // exit();
        return $partido;
    }

    public function rol_partidos()
    {       
        $opcion = 'Rol de Partidos';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'planillero',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion),
            'rol_partidos'      => $this->rol_part(),
        );
        $data['vista']  = 'v_rol_partidos';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function rol_part()
    {
        // si la categoria y de un torneo ya esta sorteado entonces recien mostrar lo siguiente 
        // en otro caso solo mandar un mensaje
        $partidos = $this->dbase->get_partidos();
        // print_r('<pre>');
        // print_r($partidos);
        $cent = '';
        $torneo = 1;
        $cantidad = count($this->dbase->get_equipos_by_torneo_1($torneo));
        if ($cantidad % 2 == 0){
            $cant = $cantidad - 1;
        } else {
            $cant = $cantidad;
        }
        
        for ($i=1; $i <= $cant; $i++) { 
        // $cent .= '<div class="box box-default">';
            // $cent .= '<div class="box-header with-border">';
            //     $cent .= '<div class="box-tools pull-right">';
            //         $cent .= '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>';
            //         $cent .= '<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>';
            //     $cent .= '</div>';
            // $cent .= '</div>';
            // $cent .= '<div class="box-body">';
                // $cent .= '<div class="row">';
                //     $cent .= '<div class="col-md-12">';
                        $cent .= '<div class="box">';
                            $cent .= '<div class="box-header">';
                              $cent .= '<h3 class="box-title">Jornada: '.$i.'</h3>';
                            $cent .= '</div>';
                            $cent .= '<div class="box-body no-padding">';
                              $cent .= '<table class="table table-condensed">';
                                $cent .= '<thead>';
                                    $cent .= '<tr>';
                                        $cent .= '<th class="col-lg-2 text-left">Fecha y Hora</th>';
                                        $cent .= '<th class="col-lg-3 text-right">Local</th>';
                                        $cent .= '<th class="col-lg-1 text-center">Score</th>';
                                        $cent .= '<th class="col-lg-1 text-center"></th>';
                                        $cent .= '<th class="col-lg-1 text-center">Score</th>';
                                        $cent .= '<th class="col-lg-3">Visitante</th>';
                                        $cent .= '<th class="col-lg-1">Accion</th>';
                                    if ($this->uri->segment(2) != 'habilitacion') {
                                        $cent .= '<th class="col-lg-1">Arbitro</th>';
                                        $cent .= '<th class="col-lg-1">Planillero</th>';
                                    }
                                    $cent .= '</tr>';
                                $cent .= '</thead>';
                                $cent .= '<tbody>';
                            foreach ($partidos as $partido) {
                                $fin = $this->dbase->get_fin($partido->id_partidos);
                                $guion = ($fin == 1) ? '0' : '-' ;
                                $color = ($fin == 1) ? 'bg-green disabled color-palette' : '' ;

                                if ($partido->jornada == $i) {
                                    $cent .= '<tr class="'.$color.'">';
                                        $cent .= '<td class="col-lg-2 text-left">'.$partido->fecha.'</td>';
                                        $cent .= '<td class="col-lg-4 text-right">'.$partido->local.'</td>';
                                        $e1 = $this->dbase->get_gol_equipo($partido->id_partidos, $partido->id_eq1);
                                        $e2 = $this->dbase->get_gol_equipo($partido->id_partidos, $partido->id_eq2);

                                        // $e2 = $this->dbase->get_gol_equipo(2, $partido->id_eq2);
                                        // print_r($e2);
                                        // exit();
                                        
                                        $e1 = ($e1[0]->gol== 0) ? $guion : $e1[0]->gol;
                                        $e2 = ($e2[0]->gol== 0) ? $guion : $e2[0]->gol;
                                        $cent .= '<td class="col-lg-1 text-center">'.$e1.'</td>';
                                        $cent .= '<td class="col-lg-1 text-center">VS</td>';
                                        $cent .= '<td class="col-lg-1 text-center">'.$e2.'</td>';
                                        $cent .= '<td class="col-lg-4">'.$partido->visitante.'</td>';
                                        if ($this->uri->segment(2) == 'habilitacion') {
                                            $cent .= '<td class="col-lg-4"><a href="'.base_url().'planillero/gohabilitacion/'.$partido->id_partidos.'/'.$partido->id_eq1.'/'.$partido->id_eq2.'">Habilitación</a></td>';
                                        } else {
                                            $cent .= '<td class="col-lg-4"><a href="'.base_url().'planillero/gopartido/'.$partido->id_partidos.'/'.$partido->id_eq1.'/'.$partido->id_eq2.'">Entrar</a></td>';
                                            $cent .= '<td class="col-lg-4"><a href="'.base_url().'Reporte/pdf_informe_arbitro/'.$partido->id_partidos.'" target="_blank"><button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-danger" ">
                                            <i class="fa fa-file-pdf-o"></i>
                                        </button></a></td>';
                                        $cent .= '<td class="col-lg-4"><a href="'.base_url().'Reporte/pdf_informe_planillero/'.$partido->id_partidos.'" target="_blank"><button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-warning" ">
                                        <i class="fa fa-file-pdf-o"></i>
                                    </button></a></td>';
                                        }

                                        
                                        // $cent .= '<th class="col-lg-1"><a class="btn btn-sm btn-primary" href="javascript:void(0)" title="Ver" onclick="go_to_match('.$partido->id_partidos.'/'.$partido->id_eq1.','.$partido->id_eq2.')"><i class="glyphicon glyphicon-pencil"></i> Ver</a></th>';
                                    $cent .= '</tr>';
                                }
                            }
                              $cent .= '</table>';
                            $cent .= '</div>';
                          $cent .= '</div>';
                //     $cent .= '</div>';
                // $cent .= '</div>';
            // $cent .= '</div>';
        // $cent .= '</div>';
        }
        return $cent;
    }

    // public function mensaje_rol_partido()
    // {
    //     # code...
    // }

    public function gopartido($id_partido, $id_e1, $id_e2)
    {
        // $club_equi1 = $this->dbase->get_club_equipo($id_e1)->nombre_club;
        // $club_equi2 = $this->dbase->get_club_equipo($id_e2)->nombre_club;
        // // print_r($club_equi1);
        // // exit();
        $equipos = [$id_e1, $id_e2];

        
        // print_r('<pre>');
        // print_r($jugad_equi1);
        // // print_r($jugad_equi1[0]->id_club);
        // exit();
        // $equipos = [$jugad_equi1, $jugad_equi2];
        $cent = '';
        // $cent = '<div class="row partido_vs">';

        // $nombre_club = $this->dbase->get_nombre_club();
        $estado = $this->db->get_where('partidos', array(
            'id_partidos' => $id_partido,
        ))->row()->estado;

        $estado_suspencion = $this->db->get_where('suspencion_partido', array(
            'id_partidos' => $id_partido,
        ))->row();

        // print_r($estado_suspencion);
        // exit();

        if (empty($estado_suspencion)) {
            if ($estado == 0 || $estado == null) {
                $ena = "";
            } else {
                $ena = "disabled";
                $cent .= '<div class="row">
                    <div class="col-md-12">
                        <div class="box-header with-border">
                            <div class="callout callout-info ">
                              <h4>PARTIDO FINALIZADO</h4>
                            </div>
                        </div>
                    </div>
                </div>';
            }
        } else {
            if ($estado_suspencion->estado_sus == 0) {
                $ena = "disabled";
                $cent .= '<div class="row">
                    <div class="col-md-12">
                        <div class="box-header with-border">
                            <div class="callout callout-warning ">
                              <h4>Partido suspendido</h4>
                            </div>
                        </div>
                    </div>
                </div>';
            } else {
                if ($estado_suspencion->estado_sus == 1 && $estado == 1) {
                    $ena = "disabled";
                    $cent .= '<div class="row">
                        <div class="col-md-12">
                            <div class="box-header with-border">
                                <div class="callout callout-info ">
                                  <h4>PARTIDO FINALIZADO</h4>
                                </div>
                            </div>
                        </div>
                    </div>';
                } else {
                    $ena = "";
                }
            }
        }
        

        // print_r($equipos);
        // exit();


        foreach ($equipos as $key => $equipo) {
            $jugad_equi = $this->dbase->get_jugadores_por_equipo($equipo, $id_partido);
            // $jugad_equi2 = $this->dbase->get_jugadores_por_equipo($id_e2, $id_partido);

        //     print_r('<pre>');
        // print_r($jugad_equi);
        // exit();

            // $eso = $this->dbase->get_nombre_club($equipo[0]->id_club)->nombre_club;
            // print_r($eso);
            // exit();


            $cent .= '<div class="col-md-6">';
            $cent .= '<div class="box box-info">';
            $cent .= '<div class="box-header with-border">';
              // $cent .= '<h3 class="box-title">'.$this->dbase->get_nombre_club($equipo[0]->id_club)->nombre_club.'</h3>';
            $cent .= '<h3 class="box-title">'.$this->dbase->get_club_equipo($equipo)->nombre_club.'</h3>';

              $cent .= '<div class="box-tools pull-right">';
                $cent .= '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>';
                $cent .= '</button>';
                $cent .= '<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>';
              $cent .= '</div>';
            $cent .= '</div>';

            
            $cent .= '<div class="box-body">';
            if (empty($jugad_equi)) {
              $cent .= '<div class="row">
                <div class="col-lg-12 col-xs-12">
                  <div class="small-box bg-yellow">
                    <div class="inner">
                      <h3>'.count($jugad_equi).'</h3>

                      <p>Jugadores en este equipo</p>
                    </div>
                    <div class="icon">
                      <i class="ion ion-person-add"></i>
                    </div>
                    <a href="'.base_url('registro/equipo_jugador').'" class="small-box-footer">Inscribir jugadores <i class="fa fa-arrow-circle-right"></i></a>
                  </div>
                </div>
              </div>';
          } else {
              $cent .= '<div class="table-responsive">';
                $cent .= '<table class="table no-margin">';
                  $cent .= '<thead>';
                  $cent .= '<tr>';
                    $cent .= '<th>Dorsal</th>';
                    $cent .= '<th>Posicion</th>';
                    $cent .= '<th>Amarillas</th>';
                    $cent .= '<th>Rojas</th>';
                    $cent .= '<th>Goles</th>';
                  $cent .= '</tr>';
                  $cent .= '</thead>';
                  $cent .= '<tbody>';
                  
                      foreach ($jugad_equi as $value) {
                        // print_r('<pre>');
                        // print_r($value->id_jugador);
                        // exit();
                          $cent .= '<tr>';
                            $cent .= '<td><a href="pages/examples/invoice.html">'.$value->dorsal.'</a></td>';
                            $cent .= '<td>'.$value->posicion.'</td>';
                            $cent .= '<td>';
                                        $cent .= '<select '.$ena.' 
                                          class="form-control select2 player player_'.$value->id_jugador.'"
                                          data-placeholder="Select a State"
                                          style="width: 80%;"

                                          data-trigger
                                          name="choices-multiple-default"
                                          id="choices-multiple-default"
                                          placeholder="This is a placeholder"
                                          id_par="'.$id_partido.'"
                                          id_jug="'.$value->id_jugador.'"
                                          accion="1"
                                          multiple
                                          >';
                                          $amarillas = $this->dbase->get_yellow_jugador($value->id_jugador, $id_partido, 1);
                                          $contador = count($amarillas);
                                          if ($contador == 0) {
                                            $cent .= '<option value="1">A</option>';
                                            $cent .= '<option value="2">A</option>';
                                          } else {
                                              foreach ($amarillas as $yellow) {
                                                $seleccionar = "selected";
                                                if ($contador == 1) {
                                                    $cent .= '<option '.$seleccionar.' value="'.$yellow->accion.'">A</option>';
                                                    $cent .= '<option value="2">A</option>';
                                                } else {
                                                    $cent .= '<option '.$seleccionar.' value="'.$yellow->accion.'">A</option>';
                                                }
                                              }
                                          }
                                        $cent .= '</select>
                                      </td>';
                            $cent .= '<td>';
                                        $cent .= '<select '.$ena.'
                                          class="form-control select2 player player_r_'.$value->id_jugador.'"
                                          data-placeholder="Select a State"
                                          style="width: 80%;"

                                          data-trigger
                                          name="choices-multiple-default"
                                          id="choices-multiple-default"
                                          placeholder="This is a placeholder"
                                          id_par="'.$id_partido.'"
                                          id_jug="'.$value->id_jugador.'"
                                          accion="2"
                                          multiple
                                          >';
                                          $amarillas = $this->dbase->get_yellow_jugador($value->id_jugador, $id_partido, 2);
                                          $contador = count($amarillas);
                                          if ($contador == 0) {
                                            $cent .= '<option value="1">R</option>';
                                          } else {
                                              foreach ($amarillas as $yellow) {
                                                $cent .= '<option selected value="'.$yellow->accion.'">R</option>';
                                              }
                                          }
                                        $cent .= '</select>
                                      </td>';

                            $cent .= '<td>';
                                        $cent .= '<select '.$ena.'
                                          class="form-control select2 player player_g_'.$value->id_jugador.'"
                                          data-placeholder="Select a State"
                                          style="width: 80%;"

                                          data-trigger
                                          name="choices-multiple-default"
                                          id="choices-multiple-default"
                                          placeholder="This is a placeholder"
                                          id_par="'.$id_partido.'"
                                          id_jug="'.$value->id_jugador.'"
                                          accion="3"
                                          multiple
                                          >';
                                          $amarillas = $this->dbase->get_yellow_jugador($value->id_jugador, $id_partido, 3);
                                          $contador = count($amarillas);
                                          if ($contador == 0) {
                                            $cent .= '<option value="1">G</option>';
                                            $cent .= '<option value="2">G</option>';
                                            $cent .= '<option value="3">G</option>';
                                            $cent .= '<option value="4">G</option>';
                                            $cent .= '<option value="5">G</option>';
                                            $cent .= '<option value="6">G</option>';
                                            $cent .= '<option value="7">G</option>';
                                            $cent .= '<option value="8">G</option>';
                                            $cent .= '<option value="9">G</option>';
                                            $cent .= '<option value="10">G</option>';
                                            $cent .= '<option value="11">G</option>';
                                            $cent .= '<option value="12">G</option>';
                                            $cent .= '<option value="13">G</option>';
                                            $cent .= '<option value="14">G</option>';
                                            $cent .= '<option value="15">G</option>';
                                            $cent .= '<option value="16">G</option>';
                                          } else {
                                              foreach ($amarillas as $yellow) {
                                                $seleccionar = "selected";
                                                $cent .= '<option '.$seleccionar.' value="'.$yellow->accion.'">G</option>';
                                              }
                                              for ($i=0; $i < 16-$contador; $i++) { 
                                                $cent .= '<option value="2">G</option>';
                                              }
                                          }
                                        $cent .= '</select>
                                      </td>';
                          $cent .= '</tr>';
                      }
                  
                  $cent .= '</tbody>';
                $cent .= '</table>';
              $cent .= '</div>';
          }
            $cent .= '</div>';
            $cent .= '<div class="box-footer clearfix">';
              // $cent .= '<a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>';
            $cent .= '</div>';
          $cent .= '</div>';
          $cent .= '</div>';
        }
        
        $cent .= '</div>';
        if (!empty($jugad_equi)) {
        $cent .= '<div class="row">';
            $cent .= '<div class="col-md-2">';
                $cent .= '<button '.$ena.' class="btn btn-success" onclick="finalizar_partido('.$id_partido.','.$id_e1.','.$id_e2.')" id="finalizarb"><i class="glyphicon glyphicon-ok"></i>  Finalizar Partido</button>';
            $cent .= '</div>';
            $cent .= '<div class="col-md-3">';
            // <button '.$ena.' class="btn btn-warning" onclick="suspender_partido('.$id_partido.','.$id_e1.','.$id_e2.')"><i class="fa fa-close"></i>  Suspender partido</button>
                $cent .= '<button '.$ena.' class="btn btn-warning" data-toggle="modal" data-target="#modal-suspencion" onclick="suspender_partido('.$id_partido.','.$id_e1.','.$id_e2.')" id="suspenderb"><i class="fa fa-close"></i>
                Suspender Partido
              </button>';
            $cent .= '</div>';
        $cent .= '</div> <br>';
        $amarillas = $this->rojas_amarillas($id_partido, $id_e1, $id_e2);
        } else {
            $amarillas = "";
        }


        $data['vista']  = 'v_jugadores_partido';
        $data['jugadores_equipo1'] = $cent;
        $data['amarillas'] = $amarillas;
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function guardar_accion()
    {
        $id_partido = $this->input->post('id_partido');
        $id_jugador = $this->input->post('id_jugador');
        $accion = $this->input->post('accion');

        $acciones = [
            'id_jugador'=> $id_jugador,
            'id_partidos'=> $id_partido,
            'accion'=> $accion,
            'pagado' => 0,
            'minuto' => 12,
        ];
        $this->dbase->guardar_accion_model($acciones);

        switch ($accion) {
            case 1:
                // revisar si es necesario usar count_y_c y eliminar el metodo get_yellow_jugador()
                $count_yc = $this->dbase->count_y_c($id_partido, $id_jugador, $accion);

                // if exist one record in table resultado_partido
                if ($count_yc == 5) {
                    // 1= un partido suspendido, i=indirecta // 5 amarillas acumuladas
                    $this->dbase->save_suspencion(1, 'i', $id_jugador, $id_partido);
                }
                if ($count_yc == 10) {
                    // 2=partidos suspendidos, i=indirecta // 10 amarillas acumuladas
                    $this->dbase->save_suspencion(2, 'i', $id_jugador, $id_partido);
                }

                $this->dbase->update_cont_yellow($id_jugador, 'add');
                break;
            case 2:
                // 1=cantidad departidos suspendidos, d=directa // suspencion por roja directa
                $this->dbase->save_suspencion(1, 'd', $id_jugador, $id_partido);
                break;
        }
        
        echo json_encode(array('status'=>TRUE));
    }

/////////////////////////////////
    public function verifica_siyaexiste()
    {
        $id_partido = $this->input->post('id_partido');
        $id_jugador = $this->input->post('id_jugador');
        $accion = $this->input->post('accion');
        $cant_amari = $this->dbase->verificar_partido($id_partido, $id_jugador, $accion);
        
        echo json_encode(array('status'=>FALSE, 'cant_amari' => $cant_amari));
    }

    public function eliminar_accion()
    {
        $id_partido = $this->input->post('id_partido');
        $id_jugador = $this->input->post('id_jugador');
        $accion = $this->input->post('accion');
        $this->dbase->delete_accion($id_partido, $id_jugador, $accion);
        $this->dbase->update_cont_yellow($id_jugador, 'rest');
        echo json_encode(array('status'=>TRUE));
    }

    public function end_partido()
    {
        $id_partido = $this->input->post('id_partido');
        $id_e1 = $this->input->post('id_e1');
        $id_e2 = $this->input->post('id_e2');
        $ids_e = [$id_e1, $id_e2];
        $sw = TRUE;
        $this->dbase->update_partido($id_partido);
        foreach ($ids_e as $equipo) {
            $es = $this->dbase->obtener_goles($id_partido, $equipo);
            if ($sw) {
                $equipo_uno = [
                    "id_equipo_h" => $equipo,
                    "hscore" =>$es[0]->score,
                ];
            } else {
                $equipo_dos = [
                    "id_equipo_a" => $equipo,
                    "ascore" =>$es[0]->score,
                    "id_partidos" =>$id_partido,
                ];
            }
            $sw = FALSE;
        }

        $game = array_merge($equipo_uno, $equipo_dos);
        $this->dbase->save_game($game);
        echo json_encode(array("status" => TRUE));
    }

    public function rojas_amarillas($id_partido, $id_e1, $id_e2)
    {
        // $cards = $this->dbase->show_yellow_card();

        $players_y_1 = $this->dbase->players_yellow($id_partido, $id_e1);
        $players_y_2 = $this->dbase->players_yellow($id_partido, $id_e2);
        $players = [$players_y_1, $players_y_2];

        $html = '';
        $html .= '<div class="row">';
        foreach ($players as $players_y) {
            $html .= '<div class="col-md-6">';
                $html .= '<div class="box">';
                    $html .='<div class="box-header">';
                        $html .='<h3 class="box-title">Tarjetas amarilla</h3>';
                    $html .='</div>';
                    $html .='<div class="box-body no-padding">';
                        $html .='<table class="table table-striped">';
                            $html .='<tr>';
                                $html .='<th style="width: 10px">Nº</th>';
                                $html .='<th>Nombre</th>';
                                $html .='<th>Amarillas</th>';
                                $html .='<th style="width: 40px">Opciones</th>';
                            $html .='</tr>';
                            foreach ($players_y as $value) {
                            $html .='<tr>';
                                $html .='<td>'.$value->dorsal.'</td>';
                                $html .='<td>'.$value->nombres.'</td>';
                                $html .='<td>';
                                    $amarillas = $this->dbase->list_yc_by_player($value->id_jugador, 1);
                                    foreach ($amarillas as $amarilla) {
                                        // pagado, no pagado
                                        $p_np = ($amarilla->pagado == 1) ? 'P' : 'A' ;
                                        // $html .= '<input type="checkbox" class="flat-red" '.$checked.' disabled> ';
                                        $html .= '<small class="label bg-yellow">'.$p_np.'</small> ';
                                    }
                                    $rojas = $this->dbase->list_yc_by_player($value->id_jugador, 2);
                                    foreach ($rojas as $roja) {
                                        // $checked = ($amarilla->pagado == 1) ? 'checked' : '' ;
                                        $html .= '<small class="label bg-red">R</small> ' ;
                                        // $html .= '<span>&nbsp;</span>';
                                    }
                                $html .='</td>';
                                $html .='<td><a class="btn btn-sm btn-primary" title="Mostrar" onclick="mostrar_amarillas('.$value->id_jugador.','.$id_partido.')" data-toggle="modal" data-target="#modal-amarillas"><i class="glyphicon glyphicon-pencil"></i> Mostrar</a></td>';
                            $html .='</tr>';
                            }
                        $html .='</table>';
                    $html .='</div>';
                $html .='</div>';
            $html .='</div>';
        }
        $html .='</div>';

        return $html;



        // $data['vista']  = 'v_jugadores_partido';
        // $data['jugadores_equipo1'] = $html;
        // $this->load->view('plantilla/header');
        // $this->load->view($data['vista'],$data);
        // $this->load->view('plantilla/footer');

    }

    public function list_yellow_cards()
    {
        $id_jugador = $this->input->post('id_jugador');
        $id_partido = $this->input->post('id_partido');
        $amarillas = $this->dbase->list_yc_by_player($id_jugador, 1);

        $id_categoria = $this->dbase->id_categoria_jugador($id_jugador)->id_categoria;

        
        // print_r($id_categoria);
        // exit();

        $html_y_c = '';
        $i = 1; 
        // $precio = 0;
        // $precio2 = 5;
        $id_torneo = $this->db->get_where(
            'partidos', array(
                'id_partidos' => $id_partido,
            )
        )->row()->id_torneo;

        $html_y_c .= '<input type="text" name="id_torneo" id="id_torneo" value="'.$id_torneo.'" style="display:none;">';
        // $html_y_c .= '<input type="text" name="id_torneo" id="id_torneo" value="'.$id_torneo.'" style="">';

        foreach ($amarillas as $amarilla) {
            if ($amarilla->pagado == 1) {
                $checked = 'checked';
                $disabled = 'disabled';
            } else {
                $checked = '';
                $disabled = '';
            }

            if ($i == 5 || $i == 10){
                $checked = 'checked';
                $disabled = 'disabled';
            }
            

            $precioconcepto = $this->dbase->get_precio_by_categoria_and_concepto($id_categoria, 7, $i);
            // print_r($precioconcepto);
            // exit();

            $html_y_c .= $this->agregarinput($precioconcepto->precio, $id_jugador, $id_partido, $i, $checked, $disabled, $precioconcepto->id_precioconcepto);

            // if ($i >= 1 && $i <=4){
            //     // if ($i-1 == ) $disabled = '';
            //     $precio = $precio + 5;
            //     // $html_y_c .= '<div class="form-group">
            //     //   <label>
            //     //     <input type="hidden" value="'.$id_jugador.'" name="jugador">
            //     //     <input type="hidden" value="'.$id_partido.'" name="partido">';
            //     //     $html_y_c .= '<input type="checkbox" tu-attr-precio="'.$precio.'" class="flat-red amarilla_check" name="amarilla_check[]" value="'.$i.'" '.$checked.' '.$disabled.'> '.$i.'º amarilla
            //     //   </label>
            //     // </div>';
            //     $html_y_c .= $this->agregarinput($precio, $id_jugador, $id_partido, $i, $checked, $disabled);
            // }
            // if ($i>=6 && $i<=9){
            //     $precio2 = $precio2 + 5;
            //     // $html_y_c .= '<div class="form-group">
            //     //   <label>
            //     //     <input type="hidden" value="'.$id_jugador.'" name="jugador">
            //     //     <input type="hidden" value="'.$id_partido.'" name="partido">';
            //     //     $html_y_c .= '<input type="checkbox" tu-attr-precio="'.$precio2.'" class="flat-red amarilla_check" name="amarilla_check[]" value="'.$i.'" '.$checked.' '.$disabled.'> ' .$i.'º amarilla
            //     //   </label>
            //     // </div>';
            //     $html_y_c .= $this->agregarinput($precio2, $id_jugador, $id_partido, $i, $checked, $disabled);
            // }
            // if ($i == 5 || $i == 10){
            //     $html_y_c .= '<div class="form-group">
            //       <label>
            //         <input type="hidden" value="'.$id_jugador.'" name="jugador">
            //         <input type="hidden" value="'.$id_partido.'" name="partido">
            //         <input type="checkbox" tu-attr-precio="0" nopaga="nopaga" class="flat-red amarilla_check" name="amarilla_check[]" value="'.$i.'" checked disabled> ' .$i.'º amarilla
            //       </label>
            //     </div>';
            // }
            $i++;
        }
        $html_y_c .= '<div class="input-group input-group-sm">
            <input type="text" class="form-control" name="monto_pagar" id="monto_pagar" value="0" readonly>
                <span class="input-group-btn">
                  <button type="button" class="btn btn-success btn-flat">Bs.</button>
                </span>
          </div>';

        echo json_encode($html_y_c);
    }

    public function agregarinput($precio, $id_jugador, $id_partido, $i, $checked, $disabled, $id_precioconcepto)
    {
        $h = '<div class="form-group">
          <input type="checkbox" value="'.$id_precioconcepto.'" name="precioconcepto[]" '.$disabled.' style="display:none;">
          <label>
            <input type="hidden" value="'.$id_jugador.'" name="jugador">
            <input type="hidden" value="'.$id_partido.'" name="partido">
            <input type="checkbox" tu-attr-precio="'.$precio.'" class="flat-red amarilla_check" name="amarilla_check[]" value="'.$precio.'" '.$checked.' '.$disabled.'> '.$i.'º amarilla
          </label>
        </div>';
        return $h;
        // style="visibility: hidden;"
    }

    // public function agregacheckbox($amarillas, $id_partido)
    // {
    //     $html_y_c = '';
    //     $i = 1; 
    //     $precio = 0;
    //     $precio2 = 5;
    //     foreach ($amarillas as $amarilla) {
    //         if ($amarilla->pagado == 1) {
    //             $checked = 'checked';
    //             $disabled = 'disabled';
    //         } else {
    //             $checked = '';
    //             $disabled = '';
    //         }
    //         if ($i >= 1 && $i <=4){
    //             $precio = $precio + 5;
    //             $html_y_c .= $this->agregarinput($precio, $amarilla->id_jugador, $id_partido, $i, $checked, $disabled);
    //         }
    //         if ($i>=6 && $i<=9){
    //             $precio2 = $precio2 + 5;
    //             $html_y_c .= $this->agregarinput($precio2, $amarilla->id_jugador, $id_partido, $i, $checked, $disabled);
    //         }
    //         if ($i == 5 || $i == 10){
    //             $html_y_c .= '<div class="form-group">
    //               <label>
    //                 <input type="hidden" value="'.$amarilla->id_jugador.'" name="jugador">
    //                 <input type="hidden" value="'.$id_partido.'" name="partido">
    //                 <input type="checkbox" tu-attr-precio="0" nopaga="nopaga" class="flat-red amarilla_check" name="amarilla_check[]" value="'.$i.'" checked disabled> ' .$i.'º amarilla
    //               </label>
    //             </div>';
    //         }
    //         $i++;
    //     }
    //     $html_y_c .= '<div class="input-group input-group-sm">
    //         <input type="text" class="form-control" name="monto_pagar" id="monto_pagar" value="" readonly>
    //             <span class="input-group-btn">
    //               <button type="button" class="btn btn-success btn-flat">Bs.</button>
    //             </span>
    //       </div>';

    //     return $html_y_c;
    // }


    // // pago de amarillas desde el planillero
    public function update_yellow()
    {
        if (!empty($_POST['amarilla_check'])) {
            $i=0;
            $id_jugador = $_POST['jugador'];
            $id_partidos = $_POST['partido'];
            $precioconcepto = $_POST['precioconcepto'];
            // $id_torneo = $_POST['id_torneo'];
            $id_torneo = $this->get_torneo_activo();
            $montototal = $_POST['monto_pagar'];

            $id_categoria = $this->input->post('categoria_c');
            $id_club = $this->input->post('club_c');

            // print_r($id_torneo);
            // print_r($id_categoria);
            // print_r($id_jugador);

            // exit();

            if (empty($id_categoria) || empty($id_club)) {
                $id_club = $this->dbase->get_club_actual($id_jugador)->id_club;
                // print_r($id_club);
                // exit();
                $id_categoria = $this->dbase->get_categoria_by_jugador($id_jugador, $id_club)->id_categoria;
            }

            $id_inscripcionequipo = $this->dbase->get_inscripcionequipo($id_torneo, $id_categoria, $id_club)->id_inscripcionequipo;

            // print_r($id_inscripcionequipo);
            // exit();

            $datosmontogeneral = [
                'fecha' => date("Y-m-d"),
                'montototal' => $montototal,
                'observacion' => '',
                'id_inscripcionequipo' => $id_inscripcionequipo,
            ];
            $id_pagogeneral = $this->dbase->insert_montogeneral($datosmontogeneral);

            foreach($_POST['amarilla_check'] as $monto) {

                $datos = array(
                    'pagado' => 1,
                );
                $this->dbase->update_resultado_partido($id_jugador, $id_partidos, $datos); 

                $pago = [
                    'monto' => $monto,
                    'cantidad' => 1,
                    'id_precioconcepto' => $precioconcepto[$i],
                    'id_pagogeneral' => $id_pagogeneral,
                ];
                $this->dbase->save_pago_yellow($pago);

                $i++;
            }
            echo json_encode(array("status" => TRUE, 'id_j' => $id_jugador, 'id_p' => $id_partidos));
        } else {
            echo json_encode(array("status" => FALSE));
        }    

        // if (!empty($_POST['amarilla_check'])) {
        //     $am_de_la_db = $this->dbase->lista_yellos_db();
        //     foreach ($am_de_la_db as $value) {
        //         $explodeDato = explode(' ', $value->descripcion);
        //         $a_num_ama[] = $explodeDato[0];
        //         foreach ($_POST['amarilla_check'] as $val) {
        //             if ($val == $explodeDato[0]) {
        //                 $amarilla_pagada[] = $value->id_precioconcepto;
        //             } else {
                        
        //             }
        //         }
        //         $this->dbase->save_pago()
        //     }
        // }

    }

    // // separa numeros y letras
    // function explodeDescripcion($dato) {
    //    $delimitadores = [' '];
    //    $arreglo = [];
    //    foreach($delimitadores as $delimiter) {
    //       $explodeDato = explode($delimiter, $dato);
    //       $arreglo[] = $explodeDato[0];
    //       // $dato = isset($explodeDato[1])? $explodeDato[1] : NULL;
    //       //si usas php 7 o sueperior puedes usar para simplificar
    //       $dato = $explodeDato[1] ?? NULL;
    //    }
    //    return $arreglo;
    // }

    public function tabla_posiciones()
    {
        $tabla = $this->dbase->get_table();
        // print_r('<pre>');
        // print_r($tabla);
        $opcion = 'Tabla de posiciones';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Planillero',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion),
            'tablas_posiciones' => $tabla,
        );
        $data['vista']  = 'v_tabla_posiciones';
        // $data['tablas_posiciones']  = $tabla;
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function asignacion_arbitros()
    {
        $partidos = $this->dbase->get_partidos();
        $opcion = 'Asignacion de arbitros';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Planillero',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion),
            'partidos' => $partidos,
        );

        $cent = '';

        $i = 1;
        foreach ($partidos as $partido){
          $cent .='<tr>
            <td>'.$i++.'</td>
            <td>'.$partido->jornada.'</td>
            <td>'.$partido->local.'</td>
            <td>VS</td>
            <td>'.$partido->visitante.'</td>
            <td>';
            if (!$this->dbase->get_siexiste($partido->id_partidos)) {
                $cent .= '<a class="btn btn-sm btn-primary id_match" href="javascript:void(0)" title="Editar asignación." onclick="add_arbitros('.$partido->id_partidos.')">Agregar datos</a>';

            } else {
                $estado_suspencion = $this->db->get_where('suspencion_partido', array(
                    'id_partidos' => $partido->id_partidos,
                ))->row();
                // print_r($estado_suspencion);
                // exit();
                if (empty($estado_suspencion)) {
                    $cent .= '<a class="btn btn-sm btn-success id_match" href="javascript:void(0)" title="Añadir árbitros, cancha, fecha y hora." onclick="edit_arbitros('.$partido->id_partidos.')">Editar</a>';
                } else {
                    $cent .= '<a class="btn btn-sm btn-warning id_match" href="javascript:void(0)" title="Añadir árbitros, cancha, fecha y hora." onclick="edit_arbitros_reprogramacion('.$partido->id_partidos.')">Reprogramar Partido</a>';
                }
                

            }
            $cent .= '</td>
          </tr>';
        }

        $data['datos']  = $cent;
        $data['vista']  = 'v_asignacion_arbitros';
        // $data['tablas_posiciones']  = $tabla;
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function get_arbitro()
    {
        $tipo_arbitro = $this->input->post('tipo_arbitro');
        // $correo = $this->dbase->get_arbitro_principal('cuenta', array('id_cuenta' => $id_cuenta))->row()->email;
        $arbitro = $this->dbase->get_arbitro($tipo_arbitro);
        echo json_encode(array("status" => TRUE, "arbitro" => $arbitro));
    }

    public function get_planillero()
    {
        $planillero = $this->dbase->get_planillero();
        echo json_encode(array("status" => TRUE, "planillero" => $planillero));
    }

    public function get_cancha()
    {
        $canchas = $this->dbase->get_estadio();
        echo json_encode(array("status" => TRUE, "canchas" => $canchas));
    }

    public function add_arbitro()
    {
        $this->_validate_partido();

        $arb_pri = $this->input->post('arbitro_principal');
        $arb_as1 = $this->input->post('arbitro_asistente_1');
        $arb_as2 = $this->input->post('arbitro_asistente_2');
        $arb_as3 = $this->input->post('arbitro_asistente_3');
        $id_cancha = $this->input->post('cancha');
        $fecha_partido = $this->input->post('fecha_hora_partido');
        $id_partido = $this->input->post('id_partido');

        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_pri]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as1]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as2]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as3]);

        $datos = [
            'id_planillero' => $this->input->post('planillero'),
            'id_estadio' => $id_cancha,
            // 'id_estadio' => 1,
            'fecha' => $fecha_partido,
        ];

        // print_r($id_cancha);
        // print_r($fecha_partido);
        // exit();

        $this->dbase->update_planillero($id_partido, $datos);

        echo json_encode(array("status" => TRUE));
    }

    public function edit_arbitros($id)
    {
        if (!isset($res)) 
            $res = new stdClass();
        $arbitro = $this->dbase->get_arbitropartido($id);
        $planillero = $this->dbase->get_planille($id)->id_planillero;
        $id_estadio = $this->dbase->get_planille($id)->id_estadio;
        $jornada = $this->dbase->get_planille($id)->fecha;
        // print_r($id_estadio);
        // exit();

        echo json_encode(array('arbitro'=>$arbitro, 'plani'=>$planillero, 'id_partido'=>$id, 'id_estad' => $id_estadio, 'jornada' => $jornada, 'status' => TRUE));
    }

    public function update_arbitro()
    {
        $this->_validate_partido();
        $arb_pri = $this->input->post('arbitro_principal');
        $arb_as1 = $this->input->post('arbitro_asistente_1');
        $arb_as2 = $this->input->post('arbitro_asistente_2');
        $arb_as3 = $this->input->post('arbitro_asistente_3');
        $id_partido = $this->input->post('id_partido');
        $plani = $this->input->post('planillero');

        $id_cancha = $this->input->post('cancha');
        $fecha_partido = $this->input->post('fecha_hora_partido');


        $this->dbase->delete_arbitro($id_partido);

        $datos = array(
            'id_planillero' => $plani,
            'id_estadio' => $id_cancha,
            'fecha' => $fecha_partido,
        );

        // print_r($datos);
        // exit();
        
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_pri]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as1]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as2]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as3]);

        $this->dbase->update_planillero($id_partido, $datos);

        $sus_par = $this->db->get_where('suspencion_partido', array(
            'id_partidos' => $id_partido,
        ))->row();

        if (empty($sus_par)) {
            
        } else {
            $data_sus = [
                'estado_sus' => 1
            ];
            $this->dbase->update_suspencion_partido($id_partido, $data_sus);
        }
        

        echo json_encode(array("status" => TRUE));
    }

    ///////////////////// pagos begin///////////////////////
    public function pagos()
    {
        $concepto = $this->dbase->get_table();
        $opcion = 'Pagos por concepto';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Planillero',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion),
            'pagos' => $concepto,
        );
        $data['vista']  = 'v_pagos';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function get_clubs()
    {
        $clubs = $this->dbase->get_all_clubs();
        echo json_encode(array("status" => TRUE, 'clubs'=>$clubs));
    }

    public function get_categoria_by_club()
    {
        $id_club = $this->input->post('id_club');
        $categorias = $this->dbase->get_categoria($id_club);

        echo json_encode(array("status" => TRUE, 'categorias'=>$categorias));
    }

    public function get_categoria_by_club_inscripcion()
    {
        $id_club = $this->input->post('id_club');
        $categorias = $this->dbase->get_categoria_inscripcion($id_club);

        echo json_encode(array("status" => TRUE, 'categorias'=>$categorias));
    }

    public function get_concepto()
    {
        $conceptos = $this->dbase->get_conceptos();
        echo json_encode(array("status" => TRUE, 'conceptos'=>$conceptos));
    }

    public function get_monto()
    {
        $id_categoria = $this->input->post('id_categoria');
        $id_concepto = $this->input->post('id_concepto');
        $monto = $this->dbase->get_monto($id_categoria, $id_concepto);

        // print_r($monto);
        // exit();

        echo json_encode(array("status" => TRUE, 'monto'=>$monto));
    }

    // reemplazamos esto get_motivo() por get_valores()
    // public function get_motivo()
    // {
    //     $motivo = $this->dbase->get_motivo();
    //     echo json_encode(array("status" => TRUE, 'motivo'=>$motivo));
    // }
    public function get_valores(){
        $id_club = $this->input->post('id_club');
        $id_categoria = $this->input->post('id_categoria');
        $id_concepto = $this->input->post('id_concepto');
        // $list = $this->odeco_model->get_subreclamo($id_club, $id_categoria, $id_concepto);
        $motivos = $this->dbase->get_motivo($id_categoria, $id_concepto);
        // print_r($motivos);
        // exit();

        $torneo = $this->dbase->get_idtorneo_by_club_categoria($id_club, $id_categoria);
        // print_r($torneo);
        // exit();

        $textohtml = '<div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">Motivo por el que se paga</h3>
            </div>
            <div class="box-body">
                <div class="form-group">';
        
        $textohtml.='<input type="hidden" name="id_torneo" value="'.$torneo->id_torneo.'">';

        switch ($id_concepto) {
            case 3:
$textohtml .= '<div class="col-md-12">';
  $textohtml .= '<div class="box">';
    // $textohtml .= '<div class="box-header">';
    //   $textohtml .= '<h3 class="box-title">Condensed Full Width Table</h3>';
    // $textohtml .= '</div>';
    $textohtml .= '<div class="box-body no-padding">';
      $textohtml .= '<table class="table table-condensed">';
        $textohtml .= '<tr>';
          $textohtml .= '<th>Descripción</th>';
          $textohtml .= '<th>Precio</th>';
          $textohtml .= '<th>Cantidad</th>';
          $textohtml .= '<th>Total parcial</th>';
        $textohtml .= '</tr>';

    foreach ($motivos as $val) {
        
        $textohtml .= '<tr>';
          $textohtml .= '<td>'.$val->descripcion.'</td>';
          $textohtml .= '<td>'.$val->precio.'</td>';
          $textohtml .= '<td>
                            <div class="input-group">
                                <input type="checkbox" value="'.$val->id_precioconcepto.'" name="precioconcepto[]" style="display: none;">
                                <span class="input-group-addon">
                                  <input type="checkbox" name="check_monto[]" tu-attr-precio="'.$val->precio.'" value="'.$val->precio.'" class="flat-red concepto_valores">
                                </span>
                                <input type="number" min="1" class="form-control cantidad_num" name="cantidad[]" value="1" disabled>
                            </div>
                        </td>';
          $textohtml .= '<td><span class="badge bg-red">0</span></td>';
        $textohtml .= '</tr>';
    }

      $textohtml .= '</table>';
    $textohtml .= '</div>';
  $textohtml .= '</div>';
$textohtml .= '</div>';
                break;

            case 5:

                $precioconcepto = $this->db->get_where('precio_concepto', array(
                    'id_concepto' => $id_concepto,
                    'id_categoria' => 1,
                ))->result();

                // foreach ($precioconcepto as $value) {
                //     $trasnferencias = $this->db->get_where('transferencias', array(
                //         'id_precioconcepto' => $value->id_precioconcepto,
                //         'pagado' => 0,
                //     ))->result();
                //     count($trasnferencias);
                    
                // }


                // $trasnferencias = $this->db->get_where('transferencias', array(
                //     'id_club_destino' => $id_club,
                //     'pagado' => 0,
                // ))->result();
                // foreach ($trasnferencias as $val) {
                //     print_r($val->id_precioconcepto);

                // }
                // exit();



$textohtml .= '<div class="col-md-12">';
  $textohtml .= '<div class="box">';
    // $textohtml .= '<div class="box-header">';
    //   $textohtml .= '<h3 class="box-title">Condensed Full Width Table</h3>';
    // $textohtml .= '</div>';
    $textohtml .= '<div class="box-body no-padding">';
      $textohtml .= '<table class="table table-condensed">';
        $textohtml .= '<tr>';
          $textohtml .= '<th>Descripción</th>';
          $textohtml .= '<th>Precio</th>';
          $textohtml .= '<th>Cantidad</th>';
          $textohtml .= '<th>Total parcial</th>';
        $textohtml .= '</tr>';

    // foreach ($motivos as $val) {
        
    //     $textohtml .= '<tr>';
    //       $textohtml .= '<td>'.$val->descripcion.'</td>';
    //       $textohtml .= '<td>'.$val->precio.'</td>';
    //       $textohtml .= '<td>
    //                         <div class="input-group">
    //                             <input type="checkbox" value="'.$val->id_precioconcepto.'" name="precioconcepto[]">
    //                             <span class="input-group-addon">
    //                               <input type="checkbox" name="check_monto[]" tu-attr-precio="'.$val->precio.'" value="'.$val->precio.'" class="flat-red concepto_valores">
    //                             </span>
    //                             <input type="number" min="1" class="form-control cantidad_num" name="cantidad[]" value="1" disabled>
    //                         </div>
    //                     </td>';
    //       $textohtml .= '<td><span class="badge bg-red">0</span></td>';
    //     $textohtml .= '</tr>';
    // }
    foreach ($motivos as $val) {
        // print_r($val);
        // exit();
        $transferencias = $this->db->get_where('transferencias', array(
                'id_precioconcepto' => $val->id_precioconcepto,
                'pagado' => 0,
            ))->result();
        if (count($transferencias)>0) {
            // print_r('itero');
            foreach ($transferencias as $value) {
                // count($trasnferencias);
                $jugador = $this->db->get_where('jugador', array(
                    'id_jugador' => $value->id_jugador,
                ))->row()->id_persona;
                $persona = $this->db->get_where('persona', array(
                    'id_persona' => $jugador,
                ))->row();
                // print_r($persona);
                // exit();
            $textohtml .= '<tr>';
              $textohtml .= '<td>'.$val->descripcion.'</td>';
              $textohtml .= '<td>'.$val->precio.'</td>';
              $textohtml .= '<td>


                <div class="input-group">
                    <input type="checkbox" value="'.$val->id_precioconcepto.'" name="precioconcepto[]">
                    <span class="input-group-addon">
                      <input type="checkbox" name="check_monto[]" tu-attr-precio="'.$val->precio.'" value="'.$val->precio.'" class="flat-red concepto_valores">
                    </span>
                    <input type="hidden" min="1" class="form-control" name="cantidad[]" value="1" disabled>
                    <input type="text" class="form-control" name="'.$value->id_jugador.'" value="'.$persona->nombres.' '.$persona->apellido_paterno.' '.$persona->apellido_materno.'" disabled>
                    <input type="hidden" name="jugador[]" value="'.$value->id_jugador.'">
                </div>';


               $textohtml .= '</td>';
              $textohtml .= '<td><span class="badge bg-red">0</span></td>';
            $textohtml .= '</tr>';
            }
            
        } else {
            continue;
        }
    }

      $textohtml .= '</table>';
    $textohtml .= '</div>';
  $textohtml .= '</div>';
$textohtml .= '</div>';
                break;

            case 6:

                $precioconcepto = $this->db->get_where('precio_concepto', array(
                    'id_concepto' => $id_concepto,
                    'id_categoria' => 1,
                ))->result();

$textohtml .= '<div class="col-md-12">';
  $textohtml .= '<div class="box">';
    // $textohtml .= '<div class="box-header">';
    //   $textohtml .= '<h3 class="box-title">Condensed Full Width Table</h3>';
    // $textohtml .= '</div>';
    $textohtml .= '<div class="box-body no-padding">';
      $textohtml .= '<table class="table table-condensed">';
        $textohtml .= '<tr>';
          $textohtml .= '<th>Descripción</th>';
          $textohtml .= '<th>Precio</th>';
          $textohtml .= '<th>Cantidad</th>';
          $textohtml .= '<th>Total parcial</th>';
        $textohtml .= '</tr>';
    foreach ($motivos as $val) {
        $transferencias = $this->db->get_where('transferencias', array(
                'id_precioconcepto' => $val->id_precioconcepto,
                'pagado' => 0,
            ))->result();
        if (count($transferencias)>0) {
            foreach ($transferencias as $value) {
                $jugador = $this->db->get_where('jugador', array(
                    'id_jugador' => $value->id_jugador,
                ))->row()->id_persona;
                $persona = $this->db->get_where('persona', array(
                    'id_persona' => $jugador,
                ))->row();
            $textohtml .= '<tr>';
              $textohtml .= '<td>'.$val->descripcion.'</td>';
              $textohtml .= '<td>'.$val->precio.'</td>';
              $textohtml .= '<td>


                <div class="input-group">
                    <input type="checkbox" value="'.$val->id_precioconcepto.'" name="precioconcepto[]">
                    <span class="input-group-addon">
                      <input type="checkbox" name="check_monto[]" tu-attr-precio="'.$val->precio.'" value="'.$val->precio.'" class="flat-red concepto_valores">
                    </span>
                    <input type="hidden" min="1" class="form-control" name="cantidad[]" value="1" disabled>
                    <input type="text" class="form-control" name="'.$value->id_jugador.'" value="'.$persona->nombres.' '.$persona->apellido_paterno.' '.$persona->apellido_materno.'" disabled>
                    <input type="hidden" name="jugador[]" value="'.$value->id_jugador.'">
                </div>';


               $textohtml .= '</td>';
              $textohtml .= '<td><span class="badge bg-red">0</span></td>';
            $textohtml .= '</tr>';
            }
            
        } else {
            continue;
        }
    }

      $textohtml .= '</table>';
    $textohtml .= '</div>';
  $textohtml .= '</div>';
$textohtml .= '</div>';
                break;

            case 7:
                $players_y = $this->dbase->list_jugadoresby_clubequipo($id_club);
                $textohtml .= '<div class="col-md-12">';
                    $textohtml .= '<div class="box box-warning">';
                        $textohtml .='<div class="box-header">';
                            $textohtml .='<h3 class="box-title">Tarjetas amarilla</h3>';
                        $textohtml .='</div>';
                        $textohtml .='<div class="box-body no-padding">';
                            $textohtml .='<table class="table table-striped">';
                                $textohtml .='<tr>';
                                    $textohtml .='<th style="width: 10px">Nº</th>';
                                    $textohtml .='<th>Nombre</th>';
                                    $textohtml .='<th>Amarillas</th>';
                                    $textohtml .='<th style="width: 40px">Opciones</th>';
                                $textohtml .='</tr>';
                                foreach ($players_y as $value) {
                                $textohtml .='<tr>';
                                    $textohtml .='<td>'.$value->dorsal.'</td>';
                                    $textohtml .='<td>'.$value->nombres.'</td>';
                                    $textohtml .='<td>';
                                        $amarillas = $this->dbase->list_yc_by_player($value->id_jugador, 1);
                                        foreach ($amarillas as $amarilla) {
                                            $checked = ($amarilla->pagado == 1) ? 'checked' : '' ;
                                            $textohtml .= '<input type="checkbox" class="flat-red" '.$checked.' disabled> ';
                                        }
                                    $textohtml .='</td>';
                                    $textohtml .='<td><a class="btn btn-sm btn-primary" title="Mostrar" onclick="mostrar_amarillas_concepto('.$value->id_jugador.','.$value->id_partidos.')" data-toggle="modal" data-target="#modal-amarillas"><i class="glyphicon glyphicon-pencil"></i> Mostrar</a></td>';
                                $textohtml .='</tr>';
                                }
                            $textohtml .='</table>';
                        $textohtml .='</div>';
                    $textohtml .='</div>';
                $textohtml .='</div>';
                
                // $id_jugadores = $this->dbase->list_jugadoresby_clubequipo($id_club);
                // foreach ($id_jugadores as $value) {
                //     $amarillas = $this->dbase->list_yc_by_player($value->id_jugador);
                //     $textohtml .= $this->agregacheckbox($amarillas, $value->id_partidos);
                // }

                break;
            default:
                foreach ($motivos as $val) {
                    $textohtml.=
                    '<input type="checkbox" value="'.$val->id_precioconcepto.'" name="precioconcepto[]" style="display:none;">
                    <label>
                      <input type="hidden" name="cantidad[]" value="1">
                      <input type="checkbox" name="check_monto[]" tu-attr-precio="'.$val->precio.'" value="'.$val->precio.'" class="flat-red monto_motivo"> '  .$val->descripcion.
                    '</label><br>';
                }
                break;
        }
        $textohtml.='</div>
            </div>
        </div>';


        // $textohtml = '<div class="box box-success">
        //     <div class="box-header">
        //         <h3 class="box-title">Motivo por el que se paga</h3>
        //     </div>
        //     <div class="box-body">
        //         <div class="form-group">';
        //     foreach ($motivos as $val) {
        //         $textohtml.=
        //         '<label>
        //           <input type="checkbox" name="motivo[]" value="'.$val->id_precioconcepto.'" class="flat-red" checked> '.$val->descripcion.
        //         '</label><br>';
        //     }
        // $textohtml.='</div>
        //     </div>
        // </div>';

        echo json_encode($textohtml);
    }

    public function ajax_pagar_concepto()
    {

        // print_r($_POST['precioconcepto']);
        // print_r($_POST['cantidad']);
        // print_r($_POST['check_monto']);
        // exit();


        // $id_club = $this->input->post('club');
        // $id_concepto = $this->input->post('concepto');
        // $id_categoria = $this->input->post('categoria');
        // print_r($id_concepto);
        // exit();
        



        if (isset($_POST['precioconcepto'])) {
            if (isset($_POST['check_monto'])) {
                $i=0;
                $j=0;
                $montototal = $this->input->post('precio_motivo_total');
                // $id_torneo = $this->input->post('id_torneo');
                $id_torneo = $this->get_torneo_activo();
                $id_motivo = $this->input->post('motivo');
                
                $id_categoria = $this->input->post('categoria');
                $id_club = $this->input->post('club');

                $precioconcepto = $_POST['precioconcepto'];
                $cantidad = $_POST['cantidad'];

                $id_inscripcionequipo = $this->dbase->get_inscripcionequipo($id_torneo, $id_categoria, $id_club)->id_inscripcionequipo;

                $datosmontogeneral = [
                    'fecha' => date("Y-m-d"),
                    'montototal' => $montototal,
                    'observacion' => '',
                    'id_inscripcionequipo' => $id_inscripcionequipo,
                ];
                $id_pagogeneral = $this->dbase->insert_montogeneral($datosmontogeneral);
                // print_r($datosmontogeneral);

                foreach($_POST['check_monto'] as $monto) {
                    $datos= [
                        // 'fecha' => date("Y-m-d"),
                        'monto' => $monto * $cantidad[$i],
                        // 'descripcion' => '',
                        'cantidad' => $cantidad[$i],
                        'id_precioconcepto' => $precioconcepto[$i],
                        'id_pagogeneral' => $id_pagogeneral,
                    ];
                    // print_r($datos);
                    // exit();

                    // ya hay una funcion en el modelo save_pago_yellow() que hace los mismo borrar uno
                    $this->dbase->save_pago($datos);
                    $i++;
                }

                // print_r($_POST['jugador']);
                // exit();

                if(isset($_POST['jugador'])){
                    $id_jugador = $_POST['jugador'];
                    foreach($_POST['precioconcepto'] as $preconc) {
                        $datostrasnf= [
                            'pagado' => 1
                        ];

                        $this->dbase->update_transferencia($id_club, $id_jugador[$j], $preconc, $datostrasnf);
                        $j++;
                    }
                } 


                
            }
            echo json_encode(array("status" => TRUE));
        } else {
            echo json_encode(array("status" => FALSE));
        }
        
    }

    ///////////////////// pagos end ///////////////////////

    ///////////////////// habilitacion de jugadores para el partido begin ///////////////////////
    function habilitacion()
    {
        $opcion = 'Habilitación de jugadores para el partido.';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'planillero',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion),
            'rol_partidos'      => $this->rol_part(),
        );
        $data['vista']  = 'v_habilitaciones';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function gohabilitacion($id_partido, $id_e1, $id_e2)
    {
        // $jugad_equi1 = $this->dbase->get_jugadores_por_equipo_hab($id_e1);
        // $jugad_equi2 = $this->dbase->get_jugadores_por_equipo_hab($id_e2);

        $equipos = [$id_e1, $id_e2];

        // print_r('<pre>');
        // print_r($jugad_equi1);
        // // print_r($jugad_equi1[0]->id_club);
        // exit();
        // $equipos = [$jugad_equi1, $jugad_equi2];
        $cent = '';
        // $cent = '<div class="row partido_vs">';

        // $nombre_club = $this->dbase->get_nombre_club();
        $estado = $this->db->get_where('partidos', array(
            'id_partidos' => $id_partido,
        ))->row()->estado;

        // print_r($estado);
        // exit();



        if ($estado == 0 || $estado == null) {
            $ena = "";
        } else {
            $ena = "disabled";
            $cent .= '<div class="row">
                <div class="col-md-12">
                    <div class="box-header with-border">
                        <div class="callout callout-warning ">
                          <h4>Partido Finalizado</h4>
                        </div>
                    </div>
                </div>
            </div>'
            ;
        }

        foreach ($equipos as $key => $equipo) {
            $jugad_equi = $this->dbase->get_jugadores_por_equipo($equipo, $id_partido);
        //     print_r('<pre>');
        // print_r($jugad_equi);
        // exit();

            $cent .= '<div class="col-md-6">';
            $cent .= '<div class="box box-info">';
            $cent .= '<div class="box-header with-border">';
              // $cent .= '<h3 class="box-title">'.$this->dbase->get_nombre_club($equipo[0]->id_club)->nombre_club.'</h3>';
              $cent .= '<h3 class="box-title">'.$this->dbase->get_club_equipo($equipo)->nombre_club.'</h3>';

              $cent .= '<div class="box-tools pull-right">';
                $cent .= '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>';
                $cent .= '</button>';
                $cent .= '<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>';
              $cent .= '</div>';
            $cent .= '</div>';
            $cent .= '<div class="box-body">';
              
            if (count($jugad_equi) == 0) {
                  $cent .= '<div class="row">
                <div class="col-lg-12 col-xs-12">
                  <div class="small-box bg-yellow">
                    <div class="inner">
                      <h3>'.count($jugad_equi).'</h3>

                      <p>Jugadores en este equipo</p>
                    </div>
                    <div class="icon">
                      <i class="ion ion-person-add"></i>
                    </div>
                    <a href="'.base_url('registro/equipo_jugador').'" class="small-box-footer">Inscribir jugadores <i class="fa fa-arrow-circle-right"></i></a>
                  </div>
                </div>
              </div>';
            } else {
              $cent .= '<div class="table-responsive">';
                $cent .= '<table class="table no-margin">';
                  $cent .= '<thead>';
                  $cent .= '<tr>';
                    $cent .= '<th>Dorsal</th>';
                    $cent .= '<th>Posicion</th>';
                    $cent .= '<th>Nombre</th>';
                    $cent .= '<th>Habilitado</th>';
                    // $cent .= '<th>Goles</th>';
                  $cent .= '</tr>';
                  $cent .= '</thead>';
                  $cent .= '<tbody>';
                  foreach ($jugad_equi as $value) {
                    // print_r('<pre>');
                    // print_r($value->id_jugador);
                    // exit();
                    $jugador = $this->db->get_where('jugador', array(
                        'id_jugador' => $value->id_jugador,
                    ))->row()->id_persona;
                    $persona = $this->db->get_where('persona', array(
                        'id_persona' => $jugador,
                    ))->row();

                      $cent .= '<tr>';
                        $cent .= '<td><a href="pages/examples/invoice.html">'.$value->dorsal.'</a></td>';
                        $cent .= '<td>'.$value->posicion.'</td>';
                        $cent .= '<td>'.$persona->apellido_paterno.' '.$persona->apellido_materno.', '.$persona->nombres.'</td>';
                        $cant = $this->dbase->verificar_habilitado($id_partido, $value->id_jugador);
                        $checked = ($cant > 0) ? 'checked' : '' ;
                        $cent .= '<td><input class="playered" type="checkbox" name="jugador" id_par="'.$id_partido.'" id_jug="'.$value->id_jugador.'" value="'.$value->id_jugador.'" '.$checked.' '.$ena.'></td>';
                      $cent .= '</tr>';
                  }
                  
                  $cent .= '</tbody>';
                $cent .= '</table>';
              $cent .= '</div>';
            }
              
            $cent .= '</div>';
            $cent .= '<div class="box-footer clearfix">';
              // $cent .= '<a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>';
            $cent .= '</div>';
          $cent .= '</div>';
          $cent .= '</div>';
        }
        
        $cent .= '</div>';


        $data['vista']  = 'v_jugador_habilitacion';
        $data['jugadores_equipo'] = $cent;
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    // verificamos si el jugador ya ha sido habilitado para el partido
    public function verifica_habilitado_jugador()
    {
        $id_partido = $this->input->post('id_partido');
        $id_jugador = $this->input->post('id_jugador');
        $cant = $this->dbase->verificar_habilitado($id_partido, $id_jugador);
        if ($cant > 0) {
            $this->dbase->eliminar_habilitacion($id_partido, $id_jugador);
        } else {
            $data = [
                'id_jugador' => $id_jugador,
                'id_partidos' => $id_partido,
            ];
            $this->dbase->guardar_habilitacion($data);
        }
        
        echo json_encode(array('status'=>TRUE));
    }
    ///////////////////// habilitacion de jugadores para el partido end  ///////////////////////

    ////////// suspencion de partidos begin  ///////////////
    public function inscripcion_equipo()
    {
        $opcion = 'Inscripcion de equipo';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'planillero',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion)
        );

        $data['vista']  = 'v_torneo_equipo';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    ////////// suspencion de partidos begin  ///////////////
    public function get_club()
    {
        $clubs = $this->dbase->obtenerclub();
        echo json_encode($clubs);
    }

    public function get_torneo()
    {
        $torneos = $this->dbase->obtenertorneo();
        echo json_encode($torneos);
    }

    public function ajax_inscripcion()
    {
        $this->_validate_inscripcion();
        
        $id_club = $this->input->post('club');
        $id_categoria = $this->input->post('categorias');
        $id_torneo = $this->input->post('torneo');

        $data = [
            'id_club' => $id_club,
            'id_categoria' => $id_categoria,
            'id_torneo' => $id_torneo,
        ];

        $this->dbase->saveInscripcion($data);
        echo json_encode(array('status' => TRUE));
    }

    ////////// suspencion de partidos begin  ///////////////
    public function ajax_suspender_partido()
    {
        $this->_validate();
        // $fe = $this->input->post('fecha');
        // $fecha = (isset($fe)) ? $fe : '' ;
        $data = [
            'id_partidos' => $this->input->post('id_partido'),
            'observaciones' => $this->input->post('observaciones'),
            // 'fecha_reprogramacion' => $fecha,
            'estado_sus' => '0',
        ];

        $this->dbase->save_suspencion_partido($data);
        echo json_encode(array('status'=>TRUE));
    }

    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('observaciones') == '')
        {
            $data['inputerror'][] = 'observaciones';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }


    ////////// suspencion de partidos begin  ///////////////

    /////// validadiciones ////////
    private function _validate_partido()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('arbitro_principal') == '')
        {
            $data['inputerror'][] = 'arbitro_principal';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($this->input->post('arbitro_asistente_1') == '')
        {
            $data['inputerror'][] = 'arbitro_asistente_1';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($this->input->post('arbitro_asistente_2') == '')
        {
            $data['inputerror'][] = 'arbitro_asistente_2';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($this->input->post('arbitro_asistente_3') == '')
        {
            $data['inputerror'][] = 'arbitro_asistente_3';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($this->input->post('planillero') == '')
        {
            $data['inputerror'][] = 'planillero';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($this->input->post('cancha') == '')
        {
            $data['inputerror'][] = 'cancha';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($this->input->post('fecha_hora_partido') == '')
        {
            $data['inputerror'][] = 'fecha_hora_partido';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }

    private function _validate_inscripcion()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('club') == '')
        {
            $data['inputerror'][] = 'club';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($this->input->post('categorias') == '')
        {
            $data['inputerror'][] = 'categorias';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($this->input->post('torneo') == '')
        {
            $data['inputerror'][] = 'torneo';
            $data['error_string'][] = 'Debe llenar este campo';
            $data['status'] = FALSE;
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }
    /////// validadiciones ////////






}