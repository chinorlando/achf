

<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Pdf {

    function __construct() {
        $CI = & get_instance();
        log_message('Debug', 'mPDF class is loaded.');
    }

    function load($param = NULL) {
        require_once APPPATH .'third_party/mpdf/mpdf.php';

        if ($param == NULL) {
            $param = "'mode' => 'utf-8', '', 0, '', 0, 0, 0, 0, 0, 0";
        }
        return new mPDF($param);
    }

}