<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reporte extends CI_Controller {

    public function __construct() {

        parent::__construct();
        $this->load->Model('Reporte_model');
        $this->load->library('Window');
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
            $note .= '<td>'.$club[0]->direccion.'</td>';
            $note .= '<td>'.$club[0]->ciudad.'</td>';
            $note .= '<td>'.$club[0]->fecha_fundacion.'</td>';
            $note .= "<td>";
            $note .= " <a href='".base_url()."Reporte/pdf_pago/".$e->id_club."/".$id_categoria."' target='_blank'>";
            $note .= "  <button class='btn btn-block btn-warning '><i class='glyphicon glyphicon-list'></i>   Generar Reporte</button>";
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

}