var save_method; //for save method string
var table;
var controller;
var title;

// function get_table(titulo,controlador) //controller = baseurl+controller
// {
// 	title = titulo;
// 	controller = controlador;
//     table = $('#table').DataTable({ 

//         "processing": true, //Feature control the processing indicator.
//         "serverSide": true, //Feature control DataTables' server-side processing mode.
//         "order": [], //Initial no order.

//         // Load data for the table's content from an Ajax source
//         "ajax": {
//             "url": controller + 'ajax_list/'+ title,
//             "type": "POST"
//         },

//         //Set column definition initialisation properties.
//         "columnDefs": [{
//             "targets": [ -1 ], //last column
//             "orderable": false, //set not orderable
//         }],

//     });
// }

// function anotar_gol(es, eso) {

// 	$.ajax({
//         // url: 'localhost/acfh/planillero/guardar_gol/',
//         url: 'planillero/guardar_gol',
//         type: 'POST',
//         dataType: 'JSON',
//         // data: {id_jugador: id_jugador},
//     })
//     .done(function(date) {
//         // // console.log(date);
//         // $('.transferencias').html(date.jug_tr);
//         // $('#modal_form').modal('show'); // show bootstrap modal
//         // $('input[name=proviene]').val(date.id_club);
//         // $('input[name=proviene_nombre]').val(date.equipo_actual);
//         // $('input[name=id_jugador]').val(date.id_jugador);

//         // $.each(date.clubs, function(index, val) {
//         //     $('select[name=destino]').append('<option value="'+val.id_club+'">'+val.nombre_club +'</option>');
//         // });

        
//         // // reload_table();
//     })
//     .fail(function() {
//         console.log("No se guardo");
//     });
// }