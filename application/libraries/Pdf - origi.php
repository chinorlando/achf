<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH."third_party\\tcpdf\\tcpdf.php";

class Pdf extends TCPDF {

    private $data = array();

    public function __construct() {
        parent::__construct();
        $this->SetCreator(PDF_CREATOR);
		$this->SetAuthor('GPDH');
		$this->SetTitle('GPDH');
		$this->SetSubject('Sistema de Gestion de la Informacion');
		$this->SetKeywords('GPDH, Valle Sucre');
    }

    public function setDataHeaderFooter($input){
        $this->data = $input;

        $this->SetTitle($this->data['titulo']);
        $this->SetMargins($this->data['pdf_margin_left'], $this->data['pdf_margin_top'], $this->data['pdf_margin_right']);
        $this->SetHeaderMargin(PDF_MARGIN_HEADER);
        $this->SetFooterMargin(PDF_MARGIN_FOOTER);
        $this->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
    }


    public function Header() {
        //// Image($file, $x='', $y='', $w=0, $h=0, $type='', $link='', $align='', $resize=false, $dpi=300, $palign='', $ismask=false, $imgmask=false, $border=0, $fitbox=false, $hidden=false, $fitonpage=false)

        //$pdf->Image('images/image_demo.jpg', 15, 140, 75, 113, 'JPG', 'http://www.tcpdf.org', '', true, 150, '', false, false, 1, false, false, false);

        // get the current page break margin
        $bMargin = $this->getBreakMargin();
        // get current auto-page-break mode
        $auto_page_break = $this->AutoPageBreak;
        // disable auto-page-break
        $this->SetAutoPageBreak(false, 0);
        $this->Image(base_url().'assets/images/informes/'.$this->data['imagen'],$this->data['imagen_x'], $this->data['imagen_y'], $this->data['imagen_ancho'], $this->data['imagen_alto'], '', '', '', false, 300, '', false, false, 0);
        // restore auto-page-break status
        $this->SetAutoPageBreak($auto_page_break, $bMargin);
        // set the starting point for the page content
        $this->SetFont('helvetica', 'I', 6);
        $this->Text(160, 5,  $this->data['formulario']);
    }

    // Page footer
    public function Footer() {

        $alto = isset($this->data['alto_pie'])? $this->data['alto_pie'] : 250; 

        $pie = isset($this->data['pie'])? $this->data['pie'] : '0';

        $fecha = date('n/j/Y H:i:s');
        $style2 = array('width' => 0.2, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => array(0, 0, 0));

        $this->Line(25, $alto, 200, $alto, $style2);
        $this->SetFont('helvetica', 'I', 7);
        $this->Text(25, $alto,  'Sucre');
        $this->Text(150, $alto,  'Fecha de impresion: '.$fecha);

        $style = array(
            'border' => false,
            'padding' => 0,
            'fgcolor' => array(0,0,0),
            'bgcolor' => false
        );

    }

    function ColoredTable($w,$align,$header,$data) {
        $font_size = 7;
        // Colors, line width and bold font
        $this->SetFillColor(128,128,128);
        $this->SetTextColor(255);
        $this->SetDrawColor(255, 255, 255);
        $this->SetLineWidth(0.1);
        $this->SetFont('', 'B', $font_size);

        // Header
        foreach ($header as $key => $head) {
            $this->Cell($w[$key], 7, $head, 1, 0, 'C', 1);
        }
        $this->Ln();

        // Color and font restoration
        $this->SetFillColor(200, 200, 200);
        $this->SetTextColor(0);
        $this->SetFont('', '', $font_size);
        // Data
        $fill = 0;
        $i = 0;
        foreach ($data as $row) {

            $cellcount = array();
            //write text first
            $startX = $this->GetX();
            $startY = $this->GetY();
            //draw cells and record maximum cellcount
            //cell height is 6 and width is 80
            $height = 4;
            $alinear = 0;
            foreach ($row as $key => $column){
                //$cellcount[] = $this->MultiCell($w[$key], $height, ($column), 0, 'L', $fill, 0, '', '', true, 0, false, true, 0, "M");
                $cellcount[] = $this->MultiCell($w[$key], $height, ($column), 0, $align[$alinear++], $fill, 0, '', '', true, 0, false, true, 0, "M");
            }

            $this->SetXY($startX, $startY);

            //now do borders and fill
            //cell height is 6 times the max number of cells
            $maxnocells = max($cellcount);
            $alinear = 0;
            foreach ($row as $key => $column){
                //$this->MultiCell($w[$key], $maxnocells * $height, '', 'LR', 'L', $fill, 0, '', '', true, 0, false, true, 0, "M");
                $this->MultiCell($w[$key], $maxnocells * $height, '', 'LR', $align[$alinear++], $fill, 0, '', '', true, 0, false, true, 0, "M");
            }

            $this->Ln();
            // fill equals not fill (flip/flop)
            $fill = !$fill;
            $i += $maxnocells;
            if ($i > 23) { //edit this condition according to your paper height
                $this->AddPage('P', 'LETTER');
                $i = 0;
            }
        }
        $this->Cell(array_sum($w), 0, '', 'T');
    }
    function ColoredTable_fontsize($w,$align,$header,$data,$font_size) {
        // Colors, line width and bold font
        $this->SetFillColor(128,128,128);
        $this->SetTextColor(255);
        $this->SetDrawColor(255, 255, 255);
        $this->SetLineWidth(0.1);
        $this->SetFont('', 'B', $font_size);

        // Header
        foreach ($header as $key => $head) {
            $this->Cell($w[$key], 7, $head, 1, 0, 'C', 1);
        }
        $this->Ln();

        // Color and font restoration
        $this->SetFillColor(200, 200, 200);
        $this->SetTextColor(0);
        $this->SetFont('', '', $font_size);
        // Data
        $fill = 0;
        $i = 0;
        foreach ($data as $row) {

            $cellcount = array();
            //write text first
            $startX = $this->GetX();
            $startY = $this->GetY();
            //draw cells and record maximum cellcount
            //cell height is 6 and width is 80
            $height = 4;
            $alinear = 0;
            foreach ($row as $key => $column){
                //$cellcount[] = $this->MultiCell($w[$key], $height, ($column), 0, 'L', $fill, 0, '', '', true, 0, false, true, 0, "M");
                $cellcount[] = $this->MultiCell($w[$key], $height, ($column), 0, $align[$alinear++], $fill, 0, '', '', true, 0, false, true, 0, "M");
            }

            $this->SetXY($startX, $startY);

            //now do borders and fill
            //cell height is 6 times the max number of cells
            $maxnocells = max($cellcount);
            $alinear = 0;
            foreach ($row as $key => $column){
                //$this->MultiCell($w[$key], $maxnocells * $height, '', 'LR', 'L', $fill, 0, '', '', true, 0, false, true, 0, "M");
                $this->MultiCell($w[$key], $maxnocells * $height, '', 'LR', $align[$alinear++], $fill, 0, '', '', true, 0, false, true, 0, "M");
            }

            $this->Ln();
            // fill equals not fill (flip/flop)
            $fill = !$fill;
            $i += $maxnocells;
            if ($i > 23) { //edit this condition according to your paper height
                $this->AddPage('P', 'LETTER');
                $i = 0;
            }
        }
        $this->Cell(array_sum($w), 0, '', 'T');
    }
    function ColoredTable_fontsize_x($w,$align,$header,$data,$font_size,$inicio_x) {
        // Colors, line width and bold font
        $this->SetFillColor(50, 50, 127);
        $this->SetTextColor(255);
        $this->SetDrawColor(128, 128, 128);
        $this->SetLineWidth(0.1);
        $this->SetFont('', 'B', $font_size);

        // Header
        foreach ($header as $key => $head) {
            $this->Cell($w[$key], 7, $head, 1, 0, 'C', 1);
        }
        $this->Ln();

        // Color and font restoration
        $this->SetFillColor(200, 200, 200);
        $this->SetTextColor(0);
        $this->SetFont('', '', $font_size);
        // Data
        //$fill = 0;
        $i = 0;
        foreach ($data as $row) {

            $cellcount = array();
            //write text first
            $startX = $inicio_x;//$this->GetX();
            $startY = $this->GetY();
            //draw cells and record maximum cellcount
            //cell height is 6 and width is 80
            $height = 4;
            $alinear = 0;
            $this->SetXY($startX, $startY);
            foreach ($row as $key => $column){

                $cellcount[] = $this->MultiCell($w[$key], $height, ($column), 1, $align[$alinear++], '', 0, '', '', true, 0, false, true, 0, "M");
            }
            
            $maxnocells = max($cellcount);

            $this->Ln();

            $i += $maxnocells;
            if ($i > 23) { //edit this condition according to your paper height
                $this->AddPage('P', 'LETTER');
                $i = 0;
            }
        }
    }

    function ColoredTable_fontsize_asistencia($w,$align,$header,$data,$font_size) {
        // Colors, line width and bold font
        $this->SetFillColor(128,128,128);
        $this->SetTextColor(255);
        $this->SetDrawColor(255, 255, 255);
        $this->SetLineWidth(0.1);
        $this->SetFont('', 'B', $font_size);

        // Header
        foreach ($header as $key => $head) {
            $this->Cell($w[$key], 7, $head, 1, 0, 'C', 1);
        }
        $this->Ln();

        // Color and font restoration
        $this->SetFillColor(200, 200, 200);
        $this->SetTextColor(0);
        $this->SetFont('', '', $font_size);
        // Data
        $fill = 0;
        $i = 0;
        foreach ($data as $row) {

            $cellcount = array();
            //write text first
            $startX = $this->GetX();
            $startY = $this->GetY();
            //draw cells and record maximum cellcount
            //cell height is 6 and width is 80
            $height = 4;
            $alinear = 0;
            foreach ($row as $key => $column){
                //$cellcount[] = $this->MultiCell($w[$key], $height, ($column), 0, 'L', $fill, 0, '', '', true, 0, false, true, 0, "M");
                $cellcount[] = $this->MultiCell($w[$key], $height, ($column), 0, $align[$alinear++], $fill, 0, '', '', true, 0, false, true, 0, "M");
            }

            $this->SetXY($startX, $startY);

            //now do borders and fill
            //cell height is 6 times the max number of cells
            $maxnocells = max($cellcount);
            $alinear = 0;
            foreach ($row as $key => $column){
                //$this->MultiCell($w[$key], $maxnocells * $height, '', 'LR', 'L', $fill, 0, '', '', true, 0, false, true, 0, "M");
                $this->MultiCell($w[$key], $maxnocells * $height, '', 'LR', $align[$alinear++], $fill, 0, '', '', true, 0, false, true, 0, "M");
            }

            $this->Ln();
            // fill equals not fill (flip/flop)
            $fill = !$fill;
            $i += $maxnocells;
            if ($i > 31) { //edit this condition according to your paper height
                $this->AddPage('P', 'LETTER');
                $i = 0;
            }
        }
        $this->Cell(array_sum($w), 0, '', 'T');
    }
}