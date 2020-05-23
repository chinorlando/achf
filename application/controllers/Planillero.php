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
            'controllerajax'    => 'Planillero',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion)
        );
        $data['vista']  = 'v_sorteo';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function get_torneo()
    {
        // optien todos lo torneos que por lo menos tengan 4 equipos inscritos
        $torneo = $this->dbase->get_torneo_with_equipo();
        // print_r($torneo);
        echo json_encode($torneo);



        // $nivel_curso = $this->db->get('torneo')->result();
        // echo json_encode($nivel_curso);
    }

    public function show_equipos()
    {
        $id_torneo = $this->input->post('id_torneo');
        $equipos_club = $this->dbase->get_equipos_by_torneo_1($id_torneo);
        $id_camp_actual = $this->dbase->get_campeonato_actual()->id_campeonato;
        // print_r($id_camp_actual);
        // exit();
        if ($this->dbase->counttorneo($id_torneo, $id_camp_actual)) {
            $dis = 'disabled';
            $num_bolos = TRUE;
        }
        $estado = $this->db->get_where('torneosorteado', array(
                'id_torneo' => $id_torneo,
                'id_campeonato' => $id_camp_actual,
            ))->row()->estado;
        if ($estado) {
            $sorteado = TRUE;
        } else {
            $sorteado = FALSE;
        }
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
                          $codhtml.='<input type="hidden" id="campeonato" name="campeonato" value="'.$id_camp_actual.'">';
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
        $id_club = $_POST["id_club"];
        $id_torneo = $_POST["id_torneo"];
        $num_bolo = json_decode($_POST["datos"])->num_bolo;

        $data =['num_bolo' => $num_bolo];
        
        $this->dbase->update_inscripcionequipo($id_club, $id_torneo, $data);

        echo json_encode(array('status' => TRUE));

    }

    public function save_torneosorteado()
    {

        $data = [
            'fecha_sorteo' => date('Y-m-d'),
            'id_torneo' => $this->input->post('id_torneo'),
            'id_campeonato' => $this->input->post('id_campeonato'),
            'estado' => 0
        ];
        $this->dbase->save_torneosorteo($data);
    }

    public function update_torneosorteado()
    {
        $id_campeonato = $this->input->post('id_campeonato');
        $id_torneo = $this->input->post('id_torneo');

        $data = [
            'estado' => 1
        ];
        $this->dbase->update_torneosorteado($id_campeonato, $id_torneo, $data);
    }

    public function sorteo()
    {
        $torneo = 1;
        // $torneo = $this->input->post('id_torneo');
        self::$equipos = $this->dbase->get_equipos_by_torneo($torneo);
        // self::$equipos = array('A','B','C','D','E','F','G','H','I','J','K');

        // print_r('<pre>');
        // print_r(self::$Equipo);
        // exit();

        $cantidad = count(self::$equipos);

        if (count(self::$equipos) < 4) {
            if ($this->input->post('id_torneo') == -1) {
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
        
        for ($intRow=2; $intRow <= $NumPlayers; $intRow++) { 
            for ($intCol=1; $intCol <= $intRow-1; $intCol++) {
                
                if (self::$imaginario[$intRow][$intCol] == $WeekNum) {
                    $strFixture1 = self::$Equipo[$intRow];
                    $strFixture2 = self::$Equipo[$intCol];
                    $e1 = self::$bolo[$intRow];
                    $e2 = self::$bolo[$intCol];
                    $this->dbase->save_partido($e1, $e2, self::$i);
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
            'controllerajax'    => 'Planillero',
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
        $partidos = $this->dbase->get_partidos();
        // print_r('<pre>');
        // print_r($partidos);
        $cent = '';
        $torneo = 1;
        $cantidad = count($this->dbase->get_equipos_by_torneo($torneo));
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
                              $cent .= '<h3 class="box-title">Fecha: '.$i.'</h3>';
                            $cent .= '</div>';
                            $cent .= '<div class="box-body no-padding">';
                              $cent .= '<table class="table table-condensed">';
                                $cent .= '<thead>';
                                    $cent .= '<tr>';
                                        $cent .= '<th class="col-lg-4 text-right">Local</th>';
                                        $cent .= '<th class="col-lg-1 text-center">Score</th>';
                                        $cent .= '<th class="col-lg-1 text-center"></th>';
                                        $cent .= '<th class="col-lg-1 text-center">Score</th>';
                                        $cent .= '<th class="col-lg-4">Visitante</th>';
                                        $cent .= '<th class="col-lg-1">Accion</th>';
                                    $cent .= '</tr>';
                                $cent .= '</thead>';
                                $cent .= '<tbody>';
                            foreach ($partidos as $partido) {
                                if ($partido->jornada == $i) {
                                    $cent .= '<tr>';
                                        $cent .= '<td class="col-lg-4 text-right">'.$partido->local.'</td>';
                                        $e1 = $this->dbase->get_gol_equipo($partido->id_partidos, $partido->id_eq1);
                                        $e2 = $this->dbase->get_gol_equipo($partido->id_partidos, $partido->id_eq2);

                                        // $e2 = $this->dbase->get_gol_equipo(2, $partido->id_eq2);
                                        // print_r($e2);
                                        // exit();

                                        $e2 = ($e2[0]->gol== 0) ? '-' : $e2[0]->gol;
                                        $e1 = ($e1[0]->gol== 0) ? '-' : $e1[0]->gol;
                                        $cent .= '<td class="col-lg-1 text-center">'.$e2.'</td>';
                                        $cent .= '<td class="col-lg-1 text-center">VS</td>';
                                        $cent .= '<td class="col-lg-1 text-center">'.$e1.'</td>';
                                        $cent .= '<td class="col-lg-4">'.$partido->visitante.'</td>';
                                        $cent .= '<td class="col-lg-4"><a href="'.base_url().'planillero/gopartido/'.$partido->id_partidos.'/'.$partido->id_eq1.'/'.$partido->id_eq2.'">entrar</a></td>';
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

    public function gopartido($id_partido, $id_e1, $id_e2)
    {
            $jugad_equi1 = $this->dbase->get_jugadores_por_equipo($id_e1);
            $jugad_equi2 = $this->dbase->get_jugadores_por_equipo($id_e2);
            // print_r('<pre>');
            // print_r($jugad_equi1);
            // // print_r($jugad_equi1[0]->id_club);
            // exit();
            $equipos = [$jugad_equi1, $jugad_equi2];
            $cent = '';
            // $cent = '<div class="row partido_vs">';

            // $nombre_club = $this->dbase->get_nombre_club();
            $estado = $this->db->get_where('partidos', array(
                'id_partidos' => $id_partido,
            ))->row()->estado;

            // print_r($estado);
            // exit();



            if ($estado == 1 || $estado == null) {
                $ena = "";
            } else {
                $ena = "disabled";
                $cent .= '<div class="callout callout-warning ">
                  <h4>Partido Finalizado</h4>
                </div>';
            }

            


            foreach ($equipos as $key => $equipo) {
            //     print_r('<pre>');
            // print_r();
            // exit();

                $cent .= '<div class="col-md-6">';
                $cent .= '<div class="box box-info">';
                $cent .= '<div class="box-header with-border">';
                  $cent .= '<h3 class="box-title">'.$this->dbase->get_nombre_club($equipo[0]->id_club)->nombre_club.'</h3>';

                  $cent .= '<div class="box-tools pull-right">';
                    $cent .= '<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>';
                    $cent .= '</button>';
                    $cent .= '<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>';
                  $cent .= '</div>';
                $cent .= '</div>';
                $cent .= '<div class="box-body">';
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
                      foreach ($equipo as $value) {
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
                $cent .= '</div>';
                $cent .= '<div class="box-footer clearfix">';
                  // $cent .= '<a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>';
                $cent .= '</div>';
              $cent .= '</div>';
              $cent .= '</div>';
            }
            $cent .= '<button '.$ena.' class="btn btn-success" onclick="finalizar_partido('.$id_partido.','.$id_e1.','.$id_e2.')"><i class="glyphicon glyphicon-plus"></i> Finalizar Partido</button>';
            $cent .= '</div>';
            $data['vista']  = 'v_jugadores_partido';
            $data['jugadores_equipo1'] = $cent;
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
            'minuto' => 12,
            // 'targetDiv' => $targetDiv,
        ];
        $this->dbase->guardar_accion_model($acciones);
        echo json_encode(array('status'=>TRUE));
    }

    // public function eliminar_accion()
    // {
    //     $id_partido = $this->input->post('id_partido');
    //     $id_jugador = $this->input->post('id_jugador');
    //     $accion = $this->input->post('accion');
    //     $this->dbase->delete_accion($id_partido, $id_jugador, $accion);
    //     echo json_encode(array('status'=>TRUE));
    // }
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
            <td>'.$partido->local.'</td>
            <td>'.$partido->visitante.'</td>
            <td>';
            if (!$this->dbase->get_siexiste($partido->id_partidos)) {
                $cent .= '<a class="btn btn-sm btn-primary id_match" href="javascript:void(0)" title="Añadir árbitros" onclick="add_arbitros('.$partido->id_partidos.')">Asignar árbitros</a>';
            } else {
                $cent .= '<a class="btn btn-sm btn-success id_match" href="javascript:void(0)" title="Añadir árbitros" onclick="edit_arbitros('.$partido->id_partidos.')">Actualizar</a>';
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

    public function add_arbitro()
    {
        $arb_pri = $this->input->post('arbitro_principal');
        $arb_as1 = $this->input->post('arbitro_asistente_1');
        $arb_as2 = $this->input->post('arbitro_asistente_2');
        $id_partido = $this->input->post('id_partido');

        $plani = $this->input->post('planillero');

        $this->dbase->save_aritro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_pri]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as1]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as2]);

        $this->dbase->update_planillero($id_partido, array('id_planillero' => $plani));

        echo json_encode(array("status" => TRUE));
    }

    public function edit_arbitros($id)
    {
        if (!isset($res)) 
            $res = new stdClass();
        $arbitro = $this->dbase->get_arbitropartido($id);
        $planillero = $this->dbase->get_planille($id)->id_planillero;

        echo json_encode(array('arbitro'=>$arbitro, 'plani'=>$planillero, 'id_partido'=>$id));
    }

    public function update_arbitro()
    {
        $arb_pri = $this->input->post('arbitro_principal');
        $arb_as1 = $this->input->post('arbitro_asistente_1');
        $arb_as2 = $this->input->post('arbitro_asistente_2');
        $id_partido = $this->input->post('id_partido');
        $plani = $this->input->post('planillero');

        $this->dbase->delete_arbitro($id_partido);
        
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_pri]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as1]);
        $this->dbase->save_arbitro(['id_partidos'=>$id_partido, 'id_arbitro'=>$arb_as2]);

        $this->dbase->update_planillero($id_partido, array('id_planillero' => $plani));

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
        $clubs = $this->dbase->get_clubs();
        echo json_encode(array("status" => TRUE, 'clubs'=>$clubs));
    }

    public function get_categoria_by_club()
    {
        $id_club = $this->input->post('id_club');
        $categorias = $this->dbase->get_categoria($id_club);

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
        // $id_concepto = $this->input->post('id_concepto');
        // $list = $this->odeco_model->get_subreclamo($id_concepto);
            $motivo = $this->dbase->get_motivo();
        echo json_encode($motivo);
    }

    public function pagar()
    {
        // $id_club = $this->input->post('club');
        // $id_concepto = $this->input->post('concepto');
        // $id_categoria = $this->input->post('categoria');
        $id_precioconcepto = $this->input->post('id_monto');
        $id_motivo = $this->input->post('motivo');
        $datos= [
            'fecha' => date("Y-m-d"),
            'id_precioconcepto' => $id_precioconcepto,
            'id_motivo' => $id_motivo,
        ];
        // $this->dbase->save_pago($datos);
        echo json_encode(array("status" => TRUE));
    }

    public function get_cantidad_amarillas()
    {
        $veces = $this->dbase->get_cant_veces();
        $html = '';

        $html.='<div class="form-group">
          <label>Select</label>
          <select class="form-control">';
            foreach ($veces as $vez) {
                $html.='<option value="'.$vez->id_cantidad.'">'.$vez->id_cantidad.'º veces</option>';
            }
          $html.='</select>
        </div>';
        echo json_encode(array("status" => TRUE, 'html' => $html));
    }

    ///////////////////// pagos end ///////////////////////

    ///////////////////// pagos end ///////////////////////
    ///////////////////// pagos end ///////////////////////







}