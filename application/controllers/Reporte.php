<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reporte extends CI_Controller {

    public function __construct() {

        parent::__construct();
        $this->load->Model('Reporte_model');
        $this->load->library('Window');
        $this->load->Model('Jugador_model','dbase');
        $this->funcion = $this->uri->segment(2);
        //isLoggedIn();
    }

    public function detalle()
    {
        $data['mensaje'] = 'REPORTE PAGOS';
        $categoria= $this->Reporte_model->get_categoria();
        $note = '';
        $i=1;
        foreach($categoria as $cat){
            $id_categoria=$cat->id_categoria;
            $equipos= $this->Reporte_model->get_inscripcion_equipo($id_categoria);
            $note .= '<tr >';
            $note .= '<td>'.$i.'</td>';
            $note .= '<td>'.$cat->nombre.'</td>';
            $note .= "<td>";
            $note .= " <a href='".base_url()."Reporte/detalle_inscritos/".$cat->id_categoria."'>";
            $note .= "  <button class='btn btn-block btn-success '><i class='glyphicon glyphicon-list'></i>   Ver Inscritos</button>";
            $note .= " </a>";
            $note .= "</td>";
            $note .= "</tr>";
            $i++;
        }
        $data['note'] = $note;
        
        $this->load->view('plantilla/header');
        $this->load->view('v_pago_general',$data);
        $this->load->view('plantilla/footer');
    }

    public function detalle_inscritos($id_categoria)
    {
        $data['mensaje'] = 'REPORTE PAGOS';
        $equipos= $this->Reporte_model->get_inscripcion_equipo($id_categoria);
        $note = '';
        $i=1;
        foreach($equipos as $e){
            $note .= '<tr >';
            $note .= '<td>'.$i.'</td>';
            $club= $this->Reporte_model->get_club($e->id_club);
            $note .= '<td>'.$club[0]->nombre_club.'</td>';
            $note .= '<td>'.$club[0]->ciudad.'</td>';
            $note .= '<td>'.$club[0]->fecha_fundacion.'</td>';
            $note .= "<td>";
            $note .= " <a href='".base_url()."Reporte/pdf_pago/".$e->id_club."/".$id_categoria."' target='_blank'>";
            $note .= "  <button class='btn btn-block btn-warning '><i class='glyphicon glyphicon-list'></i>   Generar pagos</button>";
            $note .= " </a>";
            $note .= "</td>";
            $note .= "<td>";
            $note .= " <a href='".base_url()."Reporte/pdf_jugadores_categoria/".$e->id_club."/".$id_categoria."' target='_blank'>";
            $note .= "  <button class='btn btn-block btn-success '><i class='glyphicon glyphicon-list'></i>   Lista jugadores</button>";
            $note .= " </a>";
            $note .= "</td>";
            $note .= "</tr>";
            $i++;
        }
        $data['note'] = $note;
        
        $this->load->view('plantilla/header');
        $this->load->view('v_pago_equipo',$data);
        $this->load->view('plantilla/footer');
    }

 


    public function pdf_pago($id_club,$id_categoria)
    {
        $id_torneo=1;
        $detalle_pago=$this->Reporte_model->get_pagos_equipo($id_club,$id_categoria, $id_torneo);
        $detalle_pago_equipo=$this->Reporte_model->get_pago_general($detalle_pago[0]->id_inscripcionequipo);

        $this->load->library('Pdf');
        $pdf = $this->pdf->load();

        $tz = 'America/La_Paz';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp
        $note = '';

        $note .='
        <html>
        <title>'.$detalle_pago[0]->nombre_club.'</title>
        <head>
        <style>
        .barcodecell {
        text-align: center;
        vertical-align: middle;
        padding: 0;
        }

        </style>
        </head>
        <body>
        <htmlpagefooter name="myfooter">
        <table width="100%" style="border-top: 1px solid #000000; vertical-align: top; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="50%" align="left"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Fecha de impresion: '.$dt->format('d-m-Y').'</span></div></td>  
        <td width="50%" align="right"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Pag. {PAGENO}</span></div></td>
        </tr></table>
        </htmlpagefooter>
        <sethtmlpagefooter name="myfooter" value="on" />
        ';
        $note .='
        <table width="100%" style="font-family:    
        serif; font-size: 10pt; color: #000;">
        <tr>
        <td><div><span style="color:black; font-size:10pt;">CLUB: <b>'.$detalle_pago[0]->nombre_club.'</b></span></div></td>
        </tr>
        </table>

        <table width="100%" style="font-family:serif; font-size: 10pt; color: #000;">   
        <tr>
        <td width="60%"><div><span style="color:black; font-size:10pt;">DIRECCIÓN: <b>'.$detalle_pago[0]->direccion.'</b></span></div></td>
        <td width="20%"><span style="color:white; font-size:10pt; font-weight: normal;
        font-style: normal;">abc</span></td>
        <td width="20%" style="background: #e5e5e5;" align="center"><div><span style="color:black; font-size:12pt;"><b>'.$detalle_pago[0]->ciudad.'</b></span></div></td>

        </tr>
        </table>
        <table width="100%"><tr>
        <td width="100%" align="center"><div><span style="color:black; font-size:15pt;  font-weight: ;
        font-style: normal;"><b>LISTA DE PAGOS REALIZADOS</b></span></div></td>
        </tr></table>
        ';  

        $note .='<table border="1" >';       
        $note .='<tr  style="background: #e5e5e5;">';    
        $note .='<td width="5%" align="center"><div><span style="color:black; font-size:10pt;"><b>Nº</b></span></div></td>';    
        $note .='<td width="10%" align="center"><div><span style="color:black; font-size:10pt;"><b>Fecha</b></span></div></td>';    
        $note .='<td width="70%" align="center"><div><span style="color:black; font-size:10pt;"><b>DESCRIPCION CONCEPTO</b></span></div></td>';    
        $note .='<td width="15%" align="center"><div><span style="color:black; font-size:10pt;"><b>Monto total (Bs.)</b></span></div></td>'; 
        $note .='</tr>';  
        $mat="";
        foreach($detalle_pago_equipo as $d){
            $pagos= $this->Reporte_model->get_pago($d->id_pagogeneral);
            foreach($pagos as $p){ 
            $conceptos= $this->Reporte_model->get_pagos_equipo_detalle($p->id_precioconcepto);   
            $mat .= "<strong>- ".$p->cantidad." cant. Bs.".$p->monto." Por concepto de ".$conceptos[0]->concepto.",</strong> ".$conceptos[0]->descripcion."<br>";
            }    
            $note .=' <tr>
                        <td align="center"><div><span style="color:black; font-size:10pt;">1</span></div></td>
                        <td align="center"><div><span style="color:black; font-size:10pt;">'.$d->fecha.'</span></div></td>
                        <td><div><span style="color:black; font-size:8pt;">'.$mat.'</span></div></td>
                        <td align="center"><div><span style="color:black; font-size:10pt;">'.$d->montototal.'</span></div></td>
                      </tr>
                  

                    ';  
            $mat="";                            
         }                    
        $note .='</table>';

    $note .='</body>
            </html>';
    $pdf=new mPDF('c','letter','','',25,20,36,10,10,10);
    $pdf->SetDisplayMode('fullpage');
    $pdf->list_indent_first_level = 0; 
        $header = '
        <table width="100%" style="border-bottom: 1px solid #000000; vertical-align: bottom; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="20%" align="center"><img src="'.base_url().'/assets/uploads/reporte/asoc.png" width="70px" /></td>
        <td width="60%" align="center"><div><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>ASOCIACION CHUQUISAQUEÑA DE</b></span><br><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>FUTBOL</b></span></div></td>
        <td width="20%" class="barcodecell"><barcode code="'.$id_club.' '.$dt.'" type="QR" class="barcode" size="0.5"
        error="M"/></span><br><span style="color:black; font-size:5pt; font-weight: normal;
        font-style: normal;"><b>Calle Junín Nº 744 telf. 6451271 – 6455460 – fax. (4)6455460
Sucre – Bolivia</b></span></td>
        </tr></table>
        ';
    $pdf->SetHTMLHeader($header); 
    $pdf->WriteHTML($note);
    $pdf->Output(''.$detalle_pago[0]->nombre_club.'.pdf','I');



    }

    public function jugador()
    {       
        $opcion = 'Reporte';
        $data = array(
            'opcion'            => $opcion,
            'controllerajax'    => 'Reporte/',
            'titulo_navegation' => $this->window->titulo_navegacion('A.CH.F',$opcion)
        );
        $data['vista']  = 'v_jugador_reporte';
        $this->load->view('plantilla/header');
        $this->load->view($data['vista'],$data);
        $this->load->view('plantilla/footer');
    }

    public function ajax_list($title)
    {
        // print_r($title);
        $list = $this->dbase->get_datatables_jugador();
        // print_r($list);
        // exit();
        $data = array();
        $no = isset($_POST['start'])? $_POST['start'] : 0;
        foreach ($list as $d) {
            $no++;
            $row = array();

            $row[] = $no;
            $row[] = $d->nombres.' '.$d->apellido_paterno.' '.$d->apellido_materno;
            $row[] = $d->fecha_nacimiento;
            $row[] = $d->c_i;
            $row[] = $d->n_registro_fbf;
            $row[] = ($d->sexo=='M')? 'Masculino':'Femenino';
            $row[] = $d->nacionalidad;
            $row[] = $d->nombre_club;
            $row[] = ($d->estado==1)? 'Activo':'Inactivo';
            // $row[] = $d->nombre_categoria;

            // $row[] = ($d->estado==1)? 'Activo':'Inactivo';
            $row[]='<a href="'.base_url('Reporte/Pdf_ficha/'.$d->id_jugador.'').'" target="_blank"><button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-success" ">
            <i class="fa fa-eye"></i>
        </button></a>';
            $row[]='<a href="'.base_url('Reporte/Pdf_tarjeta/'.$d->id_jugador.'').'" target="_blank"><button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" >
            <i class="fa fa-eye"></i>
        </button></a>';
                    // <button type="button" class="mb-xs mt-xs mr-xs btn btn-xs btn-info" onclick="add_transferencia('.$d->id_jugador.')">
                    //     <i class="fa fa-eye"></i>
                    // </button>';

            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->dbase->count_all_ju(),
            "recordsFiltered" => $this->dbase->count_filtered_ju(),
            "data" => $data,
        );
        echo json_encode($output);
    }

    public function pdf_ficha($id_jugador)
    {

        $dato = $this->dbase->get_jug_pdf($id_jugador);
        //print_r($list);
        $this->load->library('Pdf');
        $pdf = $this->pdf->load();

        $tz = 'America/La_Paz';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp
        $note = '';

        $note .='
        <html>
        <title>'.$dato[0]->nombres.' '.$dato[0]->apellido_paterno.'</title>
        <head>
        <style>
        .barcodecell {
        text-align: center;
        vertical-align: middle;
        padding: 0;
        }

        </style>
        </head>
        <body>
        <htmlpagefooter name="myfooter">
        <table width="100%" style="border-top: 1px solid #000000; vertical-align: top; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="50%" align="left"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">NOTA.- Los efectos de control el juego completo debe ser enviado a la F.B.F. -ORIGINAL F.B.F.- devolviendo las
        copias selladas: celeste para la L.F.P.B. o asociacion y amarilla para el Club.</span><br><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">**La ficha debe ser llenada a maquina o a computadora** No se aceptan raspaduras, borrones o enmiendas</span></div></td>  

        </tr></table>
        </htmlpagefooter>
        <sethtmlpagefooter name="myfooter" value="on" />
        ';
        
        $note .='
        <table width="100%" style="font-family:    
        serif; font-size: 10pt; color: #000;">
        <tr>
        <td  width="100%" align="right"><div><span style="color:red; font-size:12pt;">Nº 000'.$id_jugador.'</span></div></td>
        </tr>
        </table>

        <table width="100%" style="font-family:    
        serif; font-size: 10pt; color: #000;">
        <tr>
        <td  width="50%" align="left"><div><span style="color:white; font-size:10pt;"></span></div></td>
        <td  width="25%" align="right"><div><span style="color:black; font-size:12pt;"><b>No.REGISTRO F.B.F.</b></span></div></td>
        <td  width="25%" align="center" style="background: #e5e5e5;"><div><span style="color:black; font-size:12pt;"><b>'.$dato[0]->n_registro_fbf.'</b></span></div></td>
        </tr>
        </table>
        <br>
        <table width="100%" style="font-family:serif; font-size: 10pt; color: #000;">   
        <tr>
        <td width="100%"><div><span style="color:black; font-size:15pt;">Nombre del jugador: <b>'.$dato[0]->nombres.'</b></span></div></td>
        font-style: normal;">abc</span></td>
        </tr>
        <tr>
        <td width="100%"><div><span style="color:black; font-size:15pt;">Apellidos del jugador: <b>'.$dato[0]->apellido_paterno.' '.$dato[0]->apellido_materno.'</b></span></div></td>
        </tr>
        <tr>
        <td width="100%"><div><span style="color:black; font-size:15pt;">Integra al club: <b>'.$dato[0]->nombre_club.'</b></span></div></td>
        </tr>
        <tr>
        <td width="100%"><div><span style="color:black; font-size:15pt;">Categoria: <b>'.$dato[0]->nombre_categoria.'</b></span></div></td>
        </tr>
        </table>
        <table width="100%">
        <tr>
        <td width="100%"><div><span style="color:black; font-size:15pt;">LFPB-Asociacion-Liga Profesional: <b>Asociacion Chuquisaqueña de Futbol</b></span></div></td>
        </tr>
        </table>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="50%" align="left"><div><span style="color:black; font-size:12pt;">Nacionalidad: <b>'.$dato[0]->nacionalidad.'</b></span></div></td>
        <td  width="50%" align="left"><div><span style="color:black; font-size:12pt;">Estado civil: <b>'.$dato[0]->estado_civil.'</b></span></div></td>
        </tr>
        </table>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="100%" align="left"><div><span style="color:black; font-size:12pt;">Ciudad y fecha de nacimiento: <b>'.$dato[0]->ciudad.',  '. date("d-m-Y", strtotime($dato[0]->fecha_nacimiento)).'</b></span></div></td>
        </tr>
        </table>
        </table>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="70%" align="left"><div><span style="color:black; font-size:12pt;">Nombre del padre: <b>'.$dato[0]->nombre_padre.'</b></span><br>
        <span style="color:black; font-size:12pt;">Nombre del padre: <b>'.$dato[0]->nombre_madre.'</b></span></div></td>
        <td  width="30%" align="right"><div><img src="'.base_url().'/upload/'.$dato[0]->foto.'" width="70px" />
        <img src="'.base_url().'/upload/huella.png" width="70px" /></div></td>
        </tr>
        </table>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="30%" align="left"><div><span style="color:black; font-size:12pt;">Edad: <b>'.$this->calculaedad($dato[0]->fecha_nacimiento).'</b> años</span></div></td>
        <td  width="40%" align="left"><div><span style="color:black; font-size:12pt;">No. Cedula de Identidad: <b>'.$dato[0]->c_i.'</b></span></div></td>
        <td  width="30%" align="left"><div><span style="color:black; font-size:12pt;">Expedido: <b>'.$dato[0]->ciudad.'</b></span></div></td>
        </tr>
        </table>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="100%" align="left"><div><span style="color:black; font-size:12pt;">Direccion: <b>'.$dato[0]->dirección.'</b></span></div></td>
        </tr>
        </table>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="100%" align="left"><div><span style="color:black; font-size:10pt;">Nota: llenar solo para jugador registrado y con certificado de transferencia</span></div></td>
        </tr>
        <tr>
        <td  width="100%" align="left"><div><span style="color:black; font-size:12pt;">Procede del Club: </span></div></td>
        </tr>
        <tr>
        <td  width="100%" align="left"><div><span style="color:black; font-size:12pt;">LFPB-Asociacion-Liga Profesional: </span></div></td>
        </tr>
        </table><br><br>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="30%" align="left"><div><span style="color:black; font-size:12pt;">Carnet del Jugador No: </span></div></td>
        <td  width="40%" align="center"><div><span style="color:black; font-size:12pt;">Sello FBF </span></div></td>
        <td  width="30%" align="center"><div><span style="color:black; font-size:12pt;">FIRMA DEL JUGADOR</span></div></td>
        </tr>
        </table>
        <br>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="100%" align="left"><div><span style="color:black; font-size:12pt;">Lugar y Fecha: <b>CHUQUISACA, '.$dt->format('d  m  Y').'</b></span></div></td>
        </tr>
        </table>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="100%" align="left"><div><span style="color:black; font-size:9pt;">CERTIFICAMOS: Que los datos personales fueron extractados de los
        documentos que se indican y que el jugador da su conformidad por lo que firma en presencia de los suscritos, de todo lo cual se hace responsable al Club que
        representamos en la medida y con los alcances establecidos en el Reglamento del Estatuto Organico de la Federacion Boliviana de Futbol</span></div></td>
        </tr>
        </table><br><br>
        <table width="100%" style="font-family:serif;  color: #000;">
        <tr>
        <td  width="40%" align="left"><div><span style="color:black; font-size:10pt;">FIRMA: </span></div></td>
        <td  width="20%" align="center"><div><span style="color:black; font-size:10pt;"></span></div></td>
        <td  width="40%" align="left"><div><span style="color:black; font-size:10pt;">FIRMA: </span></div></td>
        </tr>
        <tr>
        <td  width="40%" align="left"><div><span style="color:black; font-size:10pt;">NOMBRE: </span></div></td>
        <td  width="20%" align="center"><div><span style="color:black; font-size:10pt;"></span></div></td>
        <td  width="40%" align="left"><div><span style="color:black; font-size:10pt;">FIRMA: </span></div></td>
        </tr>
        <tr>
        <td  width="40%" align="left"><div><span style="color:black; font-size:10pt;">SECRETARIO GENERAL DEL CLUB </span></div></td>
        <td  width="20%" align="left"><div><span style="color:black; font-size:10pt;">SELLO</span></div></td>
        <td  width="40%" align="left"><div><span style="color:black; font-size:10pt;">PRESIDENTE DEL CLUB </span></div></td>
        </tr>
        </table>
        ';  



    $note .='</body>
            </html>';
    $pdf=new mPDF('c','letter','','',25,20,36,10,10,10);
    $pdf->SetDisplayMode('fullpage');
    $pdf->list_indent_first_level = 0; 
        $header = '
        <table width="100%" ><tr>
        <td width="20%" align="center"><img src="'.base_url().'/assets/uploads/reporte/logo_fbf.png" width="70px" /></td>
        <td width="60%" align="center"><div><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>FEDERACIÓN BOLIVIANA DE FUTBOL</b></span><br><span style="color:black; font-size:12pt; font-weight: normal;
        font-style: normal;"><b>REGISTRO UNICO DEPORTIVO</b></span><br><span style="color:black; font-size:9pt; font-weight: normal;
        font-style: normal;"><b>Ficha individual</b></span></div></td>
        <td width="20%" align="center"><img src="'.base_url().'/assets/uploads/reporte/asoc.PNG" width="70px" /></td>
        error="M"/></td>
        </tr></table>
        ';
    $pdf->SetHTMLHeader($header); 
    $pdf->WriteHTML($note);
    $pdf->Output(''.$dato[0]->nombres.' '.$dato[0]->apellido_paterno.'.pdf','I');



    }

    public function calculaedad($fechanacimiento)
     {
        list($ano,$mes,$dia) = explode("-",$fechanacimiento);
        $ano_diferencia  = date("Y") - $ano;
        $mes_diferencia = date("m") - $mes;
        $dia_diferencia   = date("d") - $dia;
        if ($dia_diferencia < 0 || $mes_diferencia < 0)
          $ano_diferencia--;
        return $ano_diferencia;
      }
    public function Pdf_tarjeta($id_jugador)
      {
  
          $dato = $this->dbase->get_jug_pdf($id_jugador);
          //print_r($list);
          $this->load->library('Pdf');
          $pdf = $this->pdf->load();
  
          $tz = 'America/La_Paz';
          $timestamp = time();
          $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
          $dt->setTimestamp($timestamp); //adjust the object to correct timestamp
          $note = '';
  
          $note .='
          <html>
          <title>'.$dato[0]->nombres.' '.$dato[0]->apellido_paterno.'</title>
          <head>
          <style>
          .barcodecell {
          text-align: center;
          vertical-align: middle;
          padding: 0;
          }
  
          </style>
          </head>
          <body>
          <htmlpagefooter name="myfooter">

          </htmlpagefooter>
          <sethtmlpagefooter name="myfooter" value="on" />
          ';
          
          $note .='<table width="50%">';    
          $note .='<thead>'; 
             
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Apellidos: </b> '.$dato[0]->apellido_paterno.' '.$dato[0]->apellido_materno.'</span></th>';
          $note .='</tr>';   
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Nombres: </b>'.$dato[0]->nombres.'</span></th>';
          $note .='</tr>'; 
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Pais de nacimiento: </b>'.$dato[0]->nacionalidad.'</span></th>';
          $note .='</tr>'; 
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Fecha Nac.:                     Organizacion:</b></span>
          <br><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;">'.$dato[0]->fecha_nacimiento.'  ACHF</span></th>';
          $note .='</tr>'; 
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Club: </b></span>
          <br><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;">'.$dato[0]->nombre_club.'</span></th>';
          $note .='</tr>'; 
          $note .='<tr>';    
          $note .='<th width="40%" align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>NºDoc.</b>'.$dato[0]->c_i.'</span></th>';    
          $note .='<th align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>'.$dato[0]->nombre_categoria.' </b></span></th>';
          $note .='</tr>'; 
          $note .='</thead>';    
      $note .='<br><br></table>';  
  
            $note .='<table width="50%">';    
          $note .='<thead>'; 
             
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Apellidos: </b> '.$dato[0]->apellido_paterno.' '.$dato[0]->apellido_materno.'</span></th>';
          $note .='</tr>';   
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Nombres: </b>'.$dato[0]->nombres.'</span></th>';
          $note .='</tr>'; 
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Pais de nacimiento: </b>'.$dato[0]->nacionalidad.'</span></th>';
          $note .='</tr>'; 
          $note .='<tr>';    
          $note .='<th width="40%"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>n</b></span></th>';    
          $note .='<th align="left"><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>Fecha Nac.:                     Organizacion:</b></span>
          <br><span style="color:white; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;">'.$dato[0]->fecha_nacimiento.'  ACHF</span></th>';
          $note .='</tr>'; 
          $note .='<tr>';    
          $note .='<th width="40%" align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>JUGADOR:</b>'.$dato[0]->nombres.' '.$dato[0]->apellido_paterno.' '.$dato[0]->apellido_materno.'</span></th>';    
          $note .='<tr>';    
          $note .='<th width="40%" align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b></b>'.$dato[0]->fecha_nacimiento.'</span></th>';    
          $note .='<th align="left"><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
          font-style: normal;"><b>'.$dato[0]->nombre_club.' </b></span></th>';
          $note .='</tr>'; 
          $note .='</thead>';    
      $note .='</table>'; 
      $note .='</body>
              </html>';
      $pdf=new mPDF('c','letter','','',25,20,36,10,10,10);
      $pdf->SetDisplayMode('fullpage');
      $pdf->list_indent_first_level = 0; 
          $header = '
          ';
      $pdf->SetHTMLHeader($header); 
      $pdf->WriteHTML($note);
      $pdf->Output(''.$dato[0]->nombres.' '.$dato[0]->apellido_paterno.'.pdf','I');
  
  
  
      }


      
    public function pdf_jugadores_categoria($id_club,$id_categoria)
    {
        $dato = $this->dbase->get_jug_cat_pdf($id_club,$id_categoria);
        //print_r($list);
        $this->load->library('Pdf');
        $pdf = $this->pdf->load();

        $tz = 'America/La_Paz';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp
        $note = '';

        $note .='
        <html>
        <title>'.$dato[0]->nombre_club.'</title>
        <head>
        <style>
        .barcodecell {
        text-align: center;
        vertical-align: middle;
        padding: 0;
        }

        </style>
        </head>
        <body>
        <htmlpagefooter name="myfooter">
        <table width="100%" style="border-top: 1px solid #000000; vertical-align: top; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="50%" align="left"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Fecha de impresion: '.$dt->format('d-m-Y').'</span></div></td>  
        <td width="50%" align="right"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Pag. {PAGENO}</span></div></td>
        </tr></table>
        </htmlpagefooter>
        <sethtmlpagefooter name="myfooter" value="on" />
        ';
        $note .='
        <table width="100%" style="font-family:serif; font-size: 10pt; color: #000;">   
        <tr>
        <td width="60%"><div><span style="color:black; font-size:10pt;">NOMBRE DEL CLUB: <b>'.$dato[0]->nombre_club.'</b></span></div></td>
        <td width="20%"><span style="color:white; font-size:10pt; font-weight: normal;
        font-style: normal;">abc</span></td>
        <td width="20%" style="background: #e5e5e5;" align="center"><div><span style="color:black; font-size:12pt;"><b>'.$dato[0]->ciudad.'</b></span></div></td>
        </tr>
        </table>
        <table width="100%" style="font-family:serif; font-size: 10pt; color: #000;">   
        <tr>
        <td width="60%"><div><span style="color:black; font-size:10pt;">CATEGORIA: <b>'.$dato[0]->nombre_categoria.'</b></span></div></td>
        font-style: normal;">abc</span></td>
        </tr>
        </table>
        <table width="100%"><tr>
        <td width="100%" align="center"><div><span style="color:black; font-size:15pt;  font-weight: ;
        font-style: normal;"><b>LISTA DE JUGADORES '.$dato[0]->nombre_club.'</b></span></div></td>
        </tr></table>
        ';  

        $note .='<table border="1" >';       
        $note .='<tr  style="background: #e5e5e5;">';    
        $note .='<td width="5%" align="center"><div><span style="color:black; font-size:10pt;"><b>#</b></span></div></td>';    
        $note .='<td width="30%" align="center"><div><span style="color:black; font-size:10pt;"><b>NOMBRE COMPLETO</b></span></div></td>';    
        $note .='<td width="10%" align="center"><div><span style="color:black; font-size:10pt;"><b>Fecha de Nac.</b></span></div></td>';    
        $note .='<td width="10%" align="center"><div><span style="color:black; font-size:10pt;"><b>C.I.</b></span></div></td>'; 
        $note .='<td width="10%" align="center"><div><span style="color:black; font-size:10pt;"><b>Nº FBF</b></span></div></td>'; 
        $note .='<td width="10%" align="center"><div><span style="color:black; font-size:10pt;"><b>FOTO</b></span></div></td>'; 
        $note .='<td width="5%" align="center"><div><span style="color:black; font-size:10pt;"><b>SEXO</b></span></div></td>'; 
        $note .='<td width="10%" align="center"><div><span style="color:black; font-size:10pt;"><b>Nacionalidad</b></span></div></td>'; 
        $note .='<td width="10%" align="center"><div><span style="color:black; font-size:10pt;"><b>Estado</b></span></div></td>'; 
        $note .='</tr>';  
        $i=1;
        foreach($dato as $d){
        $note .=' <tr>
                        <td align="center"><div><span style="color:black; font-size:10pt;">'.$i.'</span></div></td>
                        <td align="left"><div><span style="color:black; font-size:10pt;">'.$d->apellido_paterno.' '.$d->apellido_materno.' '.$d->nombres.'</span></div></td>
                        <td align="center"><div><span style="color:black; font-size:10pt;">'.$d->fecha_nacimiento.'</span></div></td>
                        <td align="center"><div><span style="color:black; font-size:10pt;">'.$d->c_i.'</span></div></td>
                        <td align="center"><div><span style="color:black; font-size:10pt;">'.$d->n_registro_fbf.'</span></div></td>';
                        if($d->foto){
                        $note .='<td align="center"><img src="'.base_url().'/upload/'.$d->foto.'" width="70px" /></td>';
                        }else{
                        $note .='<td align="center"></td>';
                        }
        
                        $note .='                
                        <td align="center"><div><span style="color:black; font-size:10pt;">'.$d->sexo.'</span></div></td>
                        <td align="center"><div><span style="color:black; font-size:10pt;">'.$d->nacionalidad.'</span></div></td>';
                        
                        if($d->estado==1){
                        $note .='<td align="center"><div><span style="color:black; font-size:10pt;">Activo</span></div></td>';
                        }else{
                        $note .='<td align="center"><div><span style="color:black; font-size:10pt;">Inactivo</span></div></td>';
                        }
                        
                        $note .='</tr>';
                    $i++;                            
         }                    
        $note .='</table>';

    $note .='</body>
            </html>';
    $pdf=new mPDF('c','letter','','',25,20,36,10,10,10);
    $pdf->SetDisplayMode('fullpage');
    $pdf->list_indent_first_level = 0; 
        $header = '
        <table width="100%" style="border-bottom: 1px solid #000000; vertical-align: bottom; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="20%" align="center"><img src="'.base_url().'/assets/uploads/reporte/asoc.png" width="70px" /></td>
        <td width="60%" align="center"><div><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>ASOCIACION CHUQUISAQUEÑA DE</b></span><br><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>FUTBOL</b></span></div></td>
        <td width="20%" class="barcodecell"><barcode code="'.$id_club.' '.$dt.'" type="QR" class="barcode" size="0.5"
        error="M"/></span><br><span style="color:black; font-size:5pt; font-weight: normal;
        font-style: normal;"><b>Calle Junín Nº 744 telf. 6451271 – 6455460 – fax. (4)6455460
Sucre – Bolivia</b></span></td>
        </tr></table>
        ';
    $pdf->SetHTMLHeader($header); 
    $pdf->WriteHTML($note);
    $pdf->Output(''.$detalle_pago[0]->nombre_club.'.pdf','I');



    }


    public function pdf_rol_partidos($id_categoria)
    {
        $partidos = $this->dbase->get_partidos($id_categoria); 
        $this->load->library('Pdf');
        $pdf = $this->pdf->load();

        $tz = 'America/La_Paz';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp
        $cent = '';
        $torneo = 1;
        $rol_partidos = $this->dbase->get_equipos_by_torneo($torneo,$id_categoria);
        // print_r($eso);
        // exit();

        $cantidad = count($rol_partidos);
        if ($cantidad % 2 == 0){
            $cant = $cantidad - 1;
        } else {
            $cant = $cantidad;
        }

        $cent .='
        <html>
        <title>Rol de partidos</title>
        <head>
        <style>
        .barcodecell {
        text-align: center;
        vertical-align: middle;
        padding: 0;
        }

        </style>
        </head>
        <body>
        <htmlpagefooter name="myfooter">
        <table width="100%" style="border-top: 1px solid #000000; vertical-align: top; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="50%" align="left"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Fecha de impresion: '.$dt->format('d-m-Y').'</span></div></td>  
        <td width="50%" align="right"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Pag. {PAGENO}</span></div></td>
        </tr></table>
        </htmlpagefooter>
        <sethtmlpagefooter name="myfooter" value="on" />
        ';        
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
                        $cent .= '<div>';
                            $cent .= '<div>';
                              $cent .= '<h3>Jornada: '.$i.'</h3>';
                            $cent .= '</div>';
                            $cent .= '<div>';
                              $cent .= '<table  border="1">';
                                $cent .= '<thead>';
                                    $cent .= '<tr>';
                                        $cent .= '<th>Fecha y Hora</th>';
                                        $cent .= '<th>Local</th>';
                                        $cent .= '<th>Score</th>';
                                        $cent .= '<th></th>';
                                        $cent .= '<th>Score</th>';
                                        $cent .= '<th>Visitante</th>';
                                        $cent .= '<th>Estadio</th>';
                                    $cent .= '</tr>';
                                $cent .= '</thead>';
                                $cent .= '<tbody>';
                            foreach ($partidos as $partido) {
                                $fin = $this->dbase->get_fin($partido->id_partidos);
                                $guion = ($fin == 1) ? '0' : '-' ;
                                $color = ($fin == 1) ? 'bg-green disabled color-palette' : '' ;

                                if ($partido->jornada == $i) {
                                    $cent .= '<tr>';
                                        $cent .= '<td>'.$partido->fecha.'</td>';
                                        $cent .= '<td>'.$partido->local.'</td>';
                                        $e1 = $this->dbase->get_gol_equipo($partido->id_partidos, $partido->id_eq1);
                                        $e2 = $this->dbase->get_gol_equipo($partido->id_partidos, $partido->id_eq2);

                                        // $e2 = $this->dbase->get_gol_equipo(2, $partido->id_eq2);
                                        // print_r($e2);
                                        // exit();
                                        
                                        $e1 = ($e1[0]->gol== 0) ? $guion : $e1[0]->gol;
                                        $e2 = ($e2[0]->gol== 0) ? $guion : $e2[0]->gol;
                                        $cent .= '<td>'.$e1.'</td>';
                                        $cent .= '<td>VS</td>';
                                        $cent .= '<td>'.$e2.'</td>';
                                        $cent .= '<td>'.$partido->visitante.'</td>';
                                        $estadio=$this->dbase->get_estadio_by_id($partido->id_estadio);
                                        $cent .= '<td>'.$estadio[0]->nombreestadio.'</td>';
                                            
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
        

    $cent .='</body>
            </html>';
    $pdf=new mPDF('c','letter','','',25,20,36,10,10,10);
    $pdf->SetDisplayMode('fullpage');
    $pdf->list_indent_first_level = 0; 
        $header = '
        <table width="100%" style="border-bottom: 1px solid #000000; vertical-align: bottom; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="20%" align="center"><img src="'.base_url().'/assets/uploads/reporte/asoc.png" width="70px" /></td>
        <td width="60%" align="center"><div><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>ASOCIACION CHUQUISAQUEÑA DE</b></span><br><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>FUTBOL</b></span></div></td>
        <td width="20%" class="barcodecell"><barcode code=" Asoc. Chuquisaca'.$dt.'" type="QR" class="barcode" size="0.5"
        error="M"/></span><br><span style="color:black; font-size:5pt; font-weight: normal;
        font-style: normal;"><b>Calle Junín Nº 744 telf. 6451271 – 6455460 – fax. (4)6455460
Sucre – Bolivia</b></span></td>
        </tr></table>
        ';
    $pdf->SetHTMLHeader($header); 
    $pdf->WriteHTML($cent);
    $pdf->Output('asas.pdf','I');
    }


    public function pdf_rol_partidos_arbitros($id_categoria)
    {
        $partidos = $this->dbase->get_partidos($id_categoria); 
        $this->load->library('Pdf');
        $pdf = $this->pdf->load();

        $tz = 'America/La_Paz';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp
        $cent = '';
        $torneo = 1;
        $eso = $this->dbase->get_equipos_by_torneo($torneo,$id_categoria);
        // print_r($eso);
        // exit();

        $cantidad = count($eso);
        if ($cantidad % 2 == 0){
            $cant = $cantidad - 1;
        } else {
            $cant = $cantidad;
        }

        $cent .='
        <html>
        <title>Rol Partidos con Arbitros</title>
        <head>
        <style>
        .barcodecell {
        text-align: center;
        vertical-align: middle;
        padding: 0;
        }

        </style>
        </head>
        <body>
        <htmlpagefooter name="myfooter">
        <table width="100%" style="border-top: 1px solid #000000; vertical-align: top; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="50%" align="left"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Fecha de impresion: '.$dt->format('d-m-Y').'</span></div></td>  
        <td width="50%" align="right"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Pag. {PAGENO}</span></div></td>
        </tr></table>
        </htmlpagefooter>
        <sethtmlpagefooter name="myfooter" value="on" />
        ';        
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
                        $cent .= '<div>';
                            $cent .= '<div>';
                              $cent .= '<h3>Jornada: '.$i.'</h3>';
                            $cent .= '</div>';
                            $cent .= '<div>';
                              $cent .= '<table  border="1">';
                                $cent .= '<thead>';
                                    $cent .= '<tr>';
                                        $cent .= '<th>Fecha y Hora</th>';
                                        $cent .= '<th>Local</th>';
                                        $cent .= '<th><div><span style="color:black; font-size:8pt;">VS</span></th>';
                                        $cent .= '<th>Visitante</th>';
                                        $cent .= '<th>Estadio</th>';
                                        $cent .= '<th>Planillero</th>';
                                        $cent .= '<th>Arbitros</th>';
                                    $cent .= '</tr>';
                                $cent .= '</thead>';
                                $cent .= '<tbody>';
                            foreach ($partidos as $partido) {
                                $fin = $this->dbase->get_fin($partido->id_partidos);
                                if ($partido->jornada == $i) {
                                    $cent .= '<tr>';
                                        $cent .= '<td><div><span style="color:black; font-size:8pt;">'.$partido->fecha.'</span></div></td>';
                                        $cent .= '<td><div><span style="color:black; font-size:8pt;">'.$partido->local.'</span></div></td>';
                                        $e1 = $this->dbase->get_gol_equipo($partido->id_partidos, $partido->id_eq1);
                                        $e2 = $this->dbase->get_gol_equipo($partido->id_partidos, $partido->id_eq2);                                     
                                        $e1 = ($e1[0]->gol== 0) ? $guion : $e1[0]->gol;
                                        $e2 = ($e2[0]->gol== 0) ? $guion : $e2[0]->gol;
                                        $cent .= '<td><div><span style="color:black; font-size:8pt;">VS</span></div></td>';
                                        $cent .= '<td><div><span style="color:black; font-size:8pt;">'.$partido->visitante.'</span></div></td>';
                                        $estadio=$this->dbase->get_estadio_by_id($partido->id_estadio);
                                        $cent .= '<td><div><span style="color:black; font-size:8pt;">'.$estadio[0]->nombreestadio.'</span></div></td>';
                                        $arbitros=$this->dbase->get_arbitropartido($partido ->id_partidos);
                                        $mat = '';
                                        foreach($arbitros as $arb ){
                                            $arbitros_dato=$this->dbase->get_arbitro_by_id($arb->id_arbitro);
                                            $mat .= "<strong>- ".$arbitros_dato[0]->nombres." ".$arbitros_dato[0]->apellido_paterno." ".$arbitros_dato[0]->apellido_materno."</strong><br>";

                                        }
                                        $planillero=$this->dbase->get_planillero_by_id($partido ->id_planillero);

                                        $cent .= '<td><div><span style="color:black; font-size:8pt;">'.$planillero[0]->nombres.' '.$planillero[0]->apellido_paterno.' '.$planillero[0]->apellido_materno.'</span></div></td>';

                                        $cent .= '<td><div><span style="color:black; font-size:7pt;">'.$mat.'</span></div></td>';
                                            
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
        

    $cent .='</body>
            </html>';
    $pdf=new mPDF('c','letter','','',25,20,36,10,10,10);
    $pdf->SetDisplayMode('fullpage');
    $pdf->list_indent_first_level = 0; 
        $header = '
        <table width="100%" style="border-bottom: 1px solid #000000; vertical-align: bottom; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="20%" align="center"><img src="'.base_url().'/assets/uploads/reporte/asoc.png" width="70px" /></td>
        <td width="60%" align="center"><div><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>ASOCIACION CHUQUISAQUEÑA DE</b></span><br><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>FUTBOL</b></span></div></td>
        <td width="20%" class="barcodecell"><barcode code=" Asoc. Chuquisaca'.$dt.'" type="QR" class="barcode" size="0.5"
        error="M"/></span><br><span style="color:black; font-size:5pt; font-weight: normal;
        font-style: normal;"><b>Calle Junín Nº 744 telf. 6451271 – 6455460 – fax. (4)6455460
Sucre – Bolivia</b></span></td>
        </tr></table>
        ';
    $pdf->SetHTMLHeader($header); 
    $pdf->WriteHTML($cent);
    $pdf->Output('asas.pdf','I');
    }

    public function pdf_informe_arbitro($id_partidos)
    {
        $partidos = $this->dbase->get_partidos_by_id($id_partidos); 
        $this->load->library('Pdf');
        $pdf = $this->pdf->load();

        $tz = 'America/La_Paz';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp
        $note = '';

        $note .='
        <html>
        <title>Rol Partidos con Arbitros</title>
        <head>
        <style>
        .barcodecell {
        text-align: center;
        vertical-align: middle;
        padding: 0;
        }

        </style>
        </head>
        <body>
        <htmlpagefooter name="myfooter">
        <table width="100%" style="border-top: 1px solid #000000; vertical-align: top; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="50%" align="left"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Fecha de impresion: '.$dt->format('d-m-Y').'</span></div></td>  
        <td width="50%" align="right"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Pag. {PAGENO}</span></div></td>
        </tr></table>
        </htmlpagefooter>
        <sethtmlpagefooter name="myfooter" value="on" />
        ';   
        $arbitros=$this->dbase->get_arbitropartido($partidos[0]->id_partidos);
        $arbitros_dato=$this->dbase->get_arbitro_by_id($arbitros[0]->id_arbitro);     
        $note .='
        <table border="1" width="100%" style="font-family:serif; font-size: 10pt; color: #000;">   
        <tr>
        <td width="60%" align="center"><div><span style="color:black; font-size:10pt;"><b>'.$partidos[0]->local.' - '.$partidos[0]->visitante.'</b></span></div></td>
        <td width="40%"><span style="color:black; font-size:10pt; font-weight: normal;
        font-style: normal;">Fecha y Hora: <b>'.$partidos[0]->fecha.'</b></span></td>
        </tr>
        </table>
        <table border="1" width="100%" style="font-family:serif; font-size: 10pt; color: #000;">   
        <tr>
        <td width="100%"><div><span style="color:black; font-size:10pt;">NOMBRE DEL ARBITRO: <b>'.$arbitros_dato[0]->nombres.' '.$arbitros_dato[0]->apellido_paterno.' '.$arbitros_dato[0]->apellido_materno.'</b></span></div></td>
        </tr>
        <tr>
        <td width="100%"><div><span style="color:black; font-size:10pt;">INFORMACION: <b>'.$partidos[0]->observaciones.'</b></span></div></td>
        </tr>
        </table>
        ';  


    $note .='</body>
            </html>';
    $pdf=new mPDF('c','letter','','',25,20,36,10,10,10);
    $pdf->SetDisplayMode('fullpage');
    $pdf->list_indent_first_level = 0; 
        $header = '
        <table width="100%" style="border-bottom: 1px solid #000000; vertical-align: bottom; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="20%" align="center"><img src="'.base_url().'/assets/uploads/reporte/asoc.png" width="70px" /></td>
        <td width="60%" align="center"><div><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>ASOCIACION CHUQUISAQUEÑA DE</b></span><br><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>FUTBOL</b></span></div></td>
        <td width="20%" class="barcodecell"><barcode code=" Asoc. Chuquisaca'.$dt.'" type="QR" class="barcode" size="0.5"
        error="M"/></span><br><span style="color:black; font-size:5pt; font-weight: normal;
        font-style: normal;"><b>Calle Junín Nº 744 telf. 6451271 – 6455460 – fax. (4)6455460
Sucre – Bolivia</b></span></td>
        </tr></table>
        ';
    $pdf->SetHTMLHeader($header); 
    $pdf->WriteHTML($note);
    $pdf->Output('asas.pdf','I');
    }
    public function pdf_informe_planillero($id_partidos)
    {
        $partidos = $this->dbase->get_partidos_by_id($id_partidos); 
        $this->load->library('Pdf');
        $pdf = $this->pdf->load();

        $tz = 'America/La_Paz';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp
        $note = '';

        $note .='
        <html>
        <title>Rol Partidos con Arbitros</title>
        <head>
        <style>
        .barcodecell {
        text-align: center;
        vertical-align: middle;
        padding: 0;
        }

        </style>
        </head>
        <body>
        <htmlpagefooter name="myfooter">
        <table width="100%" style="border-top: 1px solid #000000; vertical-align: top; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="50%" align="left"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Fecha de impresion: '.$dt->format('d-m-Y').'</span></div></td>  
        <td width="50%" align="right"><div><span style="color:black; font-size:8pt; font-family:courier; font-weight: normal;
        font-style: normal;">Pag. {PAGENO}</span></div></td>
        </tr></table>
        </htmlpagefooter>
        <sethtmlpagefooter name="myfooter" value="on" />
        ';   
        $planillero=$this->dbase->get_planillero_by_id($partidos[0]->id_planillero);   
        $note .='
        <table border="1" width="100%" style="font-family:serif; font-size: 10pt; color: #000;">   
        <tr>
        <td width="60%" align="center"><div><span style="color:black; font-size:10pt;"><b>'.$partidos[0]->local.' - '.$partidos[0]->visitante.'</b></span></div></td>
        <td width="40%"><span style="color:black; font-size:10pt; font-weight: normal;
        font-style: normal;">Fecha y Hora: <b>'.$partidos[0]->fecha.'</b></span></td>
        </tr>
        </table>
        <table border="1" width="100%" style="font-family:serif; font-size: 10pt; color: #000;">   
        <tr>
        <td width="100%"><div><span style="color:black; font-size:10pt;">NOMBRE DEL PLANILLERO: <b>'.$planillero[0]->nombres.' '.$planillero[0]->apellido_paterno.' '.$planillero[0]->apellido_materno.'</b></span></div></td>
        </tr>
        <tr>
        <td width="100%"><div><span style="color:black; font-size:10pt;">INFORMACION: <b>'.$planillero[0]->observaciones.'</b></span></div></td>
        </tr>
        </table>
        ';  


    $note .='</body>
            </html>';
    $pdf=new mPDF('c','letter','','',25,20,36,10,10,10);
    $pdf->SetDisplayMode('fullpage');
    $pdf->list_indent_first_level = 0; 
        $header = '
        <table width="100%" style="border-bottom: 1px solid #000000; vertical-align: bottom; font-family:
        serif; font-size: 9pt; color: #000;"><tr>
        <td width="20%" align="center"><img src="'.base_url().'/assets/uploads/reporte/asoc.png" width="70px" /></td>
        <td width="60%" align="center"><div><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>ASOCIACION CHUQUISAQUEÑA DE</b></span><br><span style="color:black; font-size:15pt; font-weight: normal;
        font-style: normal;"><b>FUTBOL</b></span></div></td>
        <td width="20%" class="barcodecell"><barcode code=" Asoc. Chuquisaca'.$dt.'" type="QR" class="barcode" size="0.5"
        error="M"/></span><br><span style="color:black; font-size:5pt; font-weight: normal;
        font-style: normal;"><b>Calle Junín Nº 744 telf. 6451271 – 6455460 – fax. (4)6455460
Sucre – Bolivia</b></span></td>
        </tr></table>
        ';
    $pdf->SetHTMLHeader($header); 
    $pdf->WriteHTML($note);
    $pdf->Output('asas.pdf','I');
    }
}