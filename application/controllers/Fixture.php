<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Fixture extends CI_Controller {

    static $FechaLibre = [];
    static $intValue;
    static $Equipo = [];
    static $partido = [];
    static $libre;
    static $equipos;
    static $imaginario;

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
            'controllerajax'    => 'Fixture/',
            'titulo_navegation' => $this->window->titulo_navegacion('Empresa',$opcion)
        );
        $data['vista']  = 'v_fixture';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function get_torneo()
    {
        $nivel_curso = $this->db->get('torneo')->result();
        echo json_encode($nivel_curso);
    }

    public function mostrar_fixture()
    {
        $torneo = 1;
        // $torneo = $this->input->post('id_torneo');
        self::$equipos = $this->dbase->get_equipos_by_torneo($torneo);
        // self::$equipos = array('A','B','C','D','E','F','G','H','I','J','K');

        print_r('<pre>');
        // print_r(self::$equipos);
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
                self::$Equipo[] = $value->nombre_club;
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

            $this->fillauxiliar($cantidad, $intWeeks);
            $jornada = $this->FillList($cantidad, $intWeeks);
            // print_r('<pre>');
            // print_r($Equipo);
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
                                            $cent .= '<th class="col-lg-1 text-center">Score</th>';
                                            $cent .= '<th class="col-lg-1 text-center"></th>';
                                            $cent .= '<th class="col-lg-1 text-center">Score</th>';
                                            $cent .= '<th class="col-lg-4">Visitante</th>';
                                            $cent .= '<th class="col-lg-1">Accion</th>';
                                        $cent .= '</tr>';
                                    $cent .= '</thead>';
                                    $cent .= '<tbody>';
                                foreach ($item as $key => $value) {
                                    $cent .= '<tr>';
                                        $cent .= '<td class="col-lg-4 text-right">'.$value[0].'</td>';
                                        $cent .= '<td class="col-lg-1 text-center">-</td>';
                                        $cent .= '<td class="col-lg-1 text-center">VS</td>';
                                        $cent .= '<td class="col-lg-1 text-center">-</td>';
                                        $cent .= '<td class="col-lg-4">'.$value[1].'</td>';
                                        $cent .= '<th class="col-lg-1"><button>Ver</button></th>';
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

    public function fillauxiliar($NumPlayers, $intWeeks)
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

    public function FillList($NumPlayers, $intWeeks)
    {
        // print_r(self::$equipos);
        // exit();
        for ($intListWeek=1; $intListWeek <= $intWeeks; $intListWeek++) { 
            for ($jj=1; $jj <= count(self::$equipos); $jj++) { 
                self::$FechaLibre[$jj] = 0;
            }
            $partidosWeek[] = $this->OneWeekFixtures($NumPlayers, $intListWeek);
            // print_r($partidosWeek);
            // exit();

            for ($jj=1; $jj <= count(self::$equipos); $jj++) { 
                if (self::$FechaLibre[$jj] == 0) {
                    self::$libre[] = self::$Equipo[$jj-1];
                }
            }
        }
        return $partidosWeek;
    }

    public function OneWeekFixtures($NumPlayers, $WeekNum)
    {
        // print_r(self::$equipos);
        //     exit();
        for ($intRow=2; $intRow <= $NumPlayers; $intRow++) { 
            for ($intCol=1; $intCol <= $intRow-1; $intCol++) {
                if (self::$imaginario[$intRow][$intCol] == $WeekNum) {
                    $strFixture1 = self::$Equipo[$intRow-1];
                    $strFixture2 = self::$Equipo[$intCol-1];
                    self::$FechaLibre[$intRow] = 2;
                    self::$FechaLibre[$intCol] = 2;
                    $partido[] = array($strFixture1,$strFixture2);
                }
            }
        }
        return $partido;
    }




}