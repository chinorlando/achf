var save_method; //for save method string
var table;
var controller;
var title;

function get_table2(titulo,controlador,id_tabla,metodo_ajax_list) //controller = baseurl+controller
{
    title = titulo;
    controller = controlador;
    table = $('#'+id_tabla).DataTable({ 

        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.

        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": controller + metodo_ajax_list,
            "type": "POST"
        },

        //Set column definition initialisation properties.
        "columnDefs": [
        { 
            "targets": [ -1 ], //last column
            "orderable": false, //set not orderable
        },
        ],

    });
}

function get_table(titulo,controlador) //controller = baseurl+controller
{
	title = titulo;
	controller = controlador;
    console.log(controller);
    table = $('#table').DataTable({ 

        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.

        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": controller + 'ajax_list/'+ title,
            "type": "POST"
        },

        //Set column definition initialisation properties.
        "columnDefs": [{
            "targets": [ -1 ], //last column
            "orderable": false, //set not orderable
        }],

    });

    llenardatos_torneo();
    
    //datepicker
    /*
    $('.datepicker').datepicker({
        autoclose: true,
        format: "yyyy-mm-dd",
        todayHighlight: true,
        orientation: "top auto",
        todayBtn: true,
        todayHighlight: true,  
    });
    */
    
    //set input/textarea/select event when change value, remove class error and remove text help block 
    /*
    $("input").change(function(){
        $(this).parent().parent().removeClass('has-error');
        $(this).next().empty();
    });
    $("textarea").change(function(){
        $(this).parent().parent().removeClass('has-error');
        $(this).next().empty();
    });
    $("select").change(function(){
        $(this).parent().parent().removeClass('has-error');
        $(this).next().empty();
    });
    */
}

function llenardatos_torneo() {
    $.get(controller + 'get_categorias', function(data) {
        var torneo = $.parseJSON(data);
        console.log(torneo);
        $.each(torneo, function(index, val) {
            $('#torneo_camp').append('<option value="'+val.id_categoria+'">'+val.nombre+'</option>');
        });
    });
}

function add_row(
){
    save_method = 'add';
    enabled_form();
    $('#form')[0].reset(); // reset form on modals
    //    $('#form select').select2("val", "");
    //$('#form').trigger("reset");
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Adicionar '+title); // Set Title to Bootstrap modal title
    $('#btnSave').show();
}

function edit_row(id)
{
    save_method = 'update';
    enabled_form();
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
        url : controller + 'ajax_edit/' + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
			$.each(data, function (index, itemData) {
			    $('[name="'+index+'"]').val(itemData);
			});

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Editar '+title); // Set title to Bootstrap modal title
            $('#btnSave').show();
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function disabled_form()
{
	//falta textarea, radios, checkbox
	$("input").attr('disabled','disabled');
	$("select").attr('disabled','disabled');
}

function enabled_form()
{
	//falta textarea, radios, checkbox
	$("input").removeAttr('disabled');
	$("select").removeAttr('disabled');
}

function view_row(id)
{
    console.log(id);
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
        url : controller + 'ajax_edit/' + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
			$.each(data, function (index, itemData) {
			    $('[name="'+index+'"]').val(itemData);
			});
			disabled_form();
            $('#btnSave').hide();
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Ver '+title); // Set title to Bootstrap modal title
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function print_row(id) {
    $.ajax({
        url : controller + 'get_jugador/' + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}
function reload_table()
{
    table.ajax.reload(null,false); //reload datatable ajax 
}

function save_row()
{
    $('#btnSave').text('guardando...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 
    var url;

    if(save_method == 'add') {
        url = controller + 'ajax_add';
    } else {
        url = controller + 'ajax_update';
    }

    // ajax adding data to database
    $.ajax({
        url : url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(data)
        {
            if(data.status) //if success close modal and reload ajax table
            {
                $('#modal_form').modal('hide');
                reload_table();
            }
            else
            {
                for (var i = 0; i < data.inputerror.length; i++) 
                {
                    $('[name="'+data.inputerror[i]+'"]').parent().parent().addClass('has-error'); //select parent twice to select div form-group class and add has-error class
                    $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]); //select span help-block class set text error string
                }
            }
            $('#btnSave').text('Guardar'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error adding / update data');
            $('#btnSave').text('Guardar'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 

        }
    });
}

function delete_row(id)
{
	$div = $('<div title="Confirmacion Requerida">');
	$div.append('<p>Desea borrar este Registro?</p>');

	$div.dialog({
	    modal: true,
	    maxHeight:'auto',
	    width: 'auto',
	    show: "fold",
	    hide: "fold",
	    resizable: false,
	    open: function(event, ui) {
	    	$(this).prev(".ui-dialog-titlebar").css("background","dark");
		},
		position: {
            my: 'center',
            at: 'center'
        },
		buttons: {
			'Borrar': {
				text: 'Borrar',
                class: 'btn btn-blue', 
                click: function () {
        			$(this).dialog("close");
        			$.ajax({
			            url : controller + 'ajax_delete/' + id,
			            type: "POST",
			            dataType: "JSON",
			            success: function(data)
			            {
			                //if success reload ajax table
			                //$('#modal_form').modal('hide');
			                reload_table();
			            },
			            error: function (jqXHR, textStatus, errorThrown)
			            {
			                alert('Error deleting data');
			            }
			        });
                }
            },
            'Cancelar': {
    			text: 'Cancelar',
                class: 'btn btn-default', 
                click: function () {
        			$(this).dialog("close")
                }
            }
	    },
	    close: function (event, ui) {
	        $(this).remove();
	    }
	});
}

////////////////////////////////////////////////////////////////////////////
function view_trasferencia(id_jugador) {
    $.ajax({
        url: controller + 'get_transferencias/',
        type: 'POST',
        dataType: 'JSON',
        data: {id_jugador: id_jugador},
    })
    .done(function(date) {
        // console.log(date);
        $('.transferencias').html(date.jug_tr);
        $('#modal_form').modal('show'); // show bootstrap modal
        $('input[name=proviene]').val(date.id_club);
        $('input[name=proviene_nombre]').val(date.equipo_actual);
        $('input[name=id_jugador]').val(date.id_jugador);

        $.each(date.clubs, function(index, val) {
            $('select[name=destino]').append('<option value="'+val.id_club+'">'+val.nombre_club +'</option>');
        });

        
        // reload_table();
    })
    .fail(function() {
        console.log("No se guardo");
    });
}

function view_curriculum(id_jugador) {
    $.ajax({
        url: controller + 'get_curriculum/',
        type: 'POST',
        dataType: 'JSON',
        data: {id_jugador: id_jugador},
    })
    .done(function(date) {
        console.log(date);
        $('.transferencias').html(date);
        $('#modal_form_curriculum').modal('show'); // show bootstrap modal
        
        // reload_table();
    })
    .fail(function() {
        console.log("No se guardo");
    });
}

function add_row_transferencia() {
    save_method = 'add';
    enabled_form();
    $('#form')[0].reset(); // reset form on modals
    //    $('#form select').select2("val", "");
    //$('#form').trigger("reset");
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form_transferencia').modal('show'); // show bootstrap modal
    $('.modal-title').text('Adicionar '+title); // Set Title to Bootstrap modal title
    $('#btnSave').show();
}

$("body").on("submit", "#form_trasferencia", function(e){
    e.preventDefault();
    $.ajax({
        url: controller +"/save_transferencia",
        type: "POST",
        dataType: 'JSON',
        data: $('#form_trasferencia').serialize(),
        success: function(d) {
            if (d.status) {
                $('#modal_form').modal('hide');
                alert('Los datos fueron guardados correctamente');
                  // $('#id_persona').val(d.persona.id_persona);
                  // $('#nombrereclamante').val(d.persona.nombres+' '+d.persona.apellidos);
            }
        },
        error: function (jqXHR, textStatus, errorThrown){
            alert('Error al insertar los datos');
        }
    });
});


////////////////////////////////////////////////////////////////////////////


///////////////////// fixture begin ////////////////////////////////
function get_torneo(titulo, controlador) {
    controller = controlador;
    $.get(controller + '/get_torneo', function(data) {
        var torneo = $.parseJSON(data);
        $.each(torneo, function(index, val) {
            $('#torneo').append('<option value="'+val.id_torneo+'">'+val.nombre+'</option>');
        });
    });
}

$(document).ready(function(){

    $('#torneo').change(function(e) {
      var id_torneo = $('#torneo').val();
      $.ajax({
        url: controller+'/show_equipos',
        type: "POST",
        cache: true,
        data: {id_torneo: id_torneo},
        success: function(data) {
            var equipos = $.parseJSON(data);
            $('#equipos_bolo').html(equipos.cent);
            if (equipos.num_bolos) {
                $('#btn_fin_bolos').hide();
                $('#btn_sort').show();
                if (equipos.sorteado) {
                    $('#btn_fin_bolos').hide();
                    $('#btn_sort').hide();
                    funcsorteo();
                }
            } else {
                $('#btn_fin_bolos').show();
                $('#btn_sort').hide();
            }
            
            configuraciones();
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error al obtener datos.');
        }
      });
    });

    // este codigo hace el sorteo
    // $('#torneo').change(function(e) {
    //   var id_torneo = $('#torneo').val();
    //   // $('#paralelos').empty();
    //   $.ajax({
    //     url: controller+'/sorteo',
    //     type: "POST",
    //     cache: true,
    //     data: {id_torneo: id_torneo},
    //     success: function(data) {
    //         var carrera = $.parseJSON(data);
    //         console.log(carrera.status);
    //         if (carrera.status) {
    //             $('.programacionpartidos').html(carrera.cent);
    //             // $(".verticalTableHeader").each(function(){$(this).height($(this).width())})
    //         } else {
    //             if (carrera.status != 'negativo') {
    //                 $('.programacionpartidos').html('');
    //                 alert('No hay Equipos inscritos en este torneo.');
    //             }
    //           }
    //     },
    //     error: function (jqXHR, textStatus, errorThrown)
    //     {
    //         alert('Error al obtener datos.');
    //     }
    //   });
    // });

});

function configuraciones() {
    $('input[type=text]').focus(function() {
        $(this).select();
    });
    $('input[type=text]').focusout(function(ev) {
        ev.preventDefault();
        var id_input = ev.target.id; // devuelve id -> primer_bim58
        var segundo_turno = $('#'+ev.target.id).val(); //valor de primer_bim58
        var floatN = parseFloat(segundo_turno);
        console.log(floatN);
        if ($(this).val() < 1) {
            $(this).val('1');
            $(this).focus();
            $(this).select();
            alert('valor debe ser mayor a 0');
        }
        // if ($(this).val() > 100) {
        //     $(this).focus();
        //     $(this).select();
        //     alert('valor debe estar entre 0 y 100');
        // }
        if (!isFinite(floatN)) {
            alert('el campo no debe estar vacio');
            $(this).val('99');
            $(this).focus();
            $(this).select();
        }
    });
    $('input[type=text]').change(function(ev) {
        ev.preventDefault();
        var id_input = ev.target.id; // devuelve id -> primer_bim58
        var segundo_turno = $('#'+ev.target.id).val(); //valor de primer_bim58
        var floatN = parseFloat(segundo_turno);
        var numero = getNumbersInString(id_input);
        // var dato = validar(segundo_turno);
        calcular(numero);
    });
}

function getNumbersInString(string) {
  var tmp = string.split("");
  var map = tmp.map(function(current) {
    if (!isNaN(parseInt(current))) {
      return current;
    }
  });

  var numbers = map.filter(function(value) {
    return value != undefined;
  });

  return numbers.join("");
}

function calcular(id_numero){

    var numero_bolo = ($("#bolo"+id_numero).val()  != undefined)? $("#bolo"+id_numero).val() : '0';

    item = {};
    item["num_bolo"] = numero_bolo;
    
    aInfo = JSON.stringify(item);
    
    var formData = new FormData($('#form_bolo')[0]);

    var id_torneo = $('#torneo').val();
    
    formData.append('id_club', id_numero);
    formData.append('id_torneo', id_torneo);
    formData.append('datos', aInfo);
    // formData.append('csrf_test_name', CFG.token);

    $.ajax({
        url: controller+'/if_save_num_bolos',
        type: "POST",
        dataType: 'JSON',
        cache:false,
        data: formData,
        contentType: false,
        processData: false,
        success: function(data) {
            if (data.status) {
                console.log('Número de bolo asignado.');
            } else {
                console.log('No se pudo guardar');
            }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error al guardar el número de bolo.');
        }
    });
}


function fin_bolos() {
    $('#btn_fin_bolos').hide(0,function() {
        $("input").attr('disabled','disabled');

        var id_torneo = $('#torneo').val();
        var id_campeonato = $('#campeonato').val();
        console.log(id_campeonato);
        $.post(controller+'/save_torneosorteado',
            {
                id_torneo: id_torneo,
                id_campeonato: id_campeonato,
            },
            function(data, textStatus, xhr) {
                alert('No se guardaron los datos.');
            },
        );
    });
    $('#btn_sort').show();
}

function sorteo_equipos() {
    var id_torneo = $('#torneo').val();
    var id_campeonato = $('#campeonato').val();
    console.log(id_campeonato);
    $.post(controller+'/update_torneosorteado',
        {
            id_torneo: id_torneo,
            id_campeonato: id_campeonato,
        },
        function(data, textStatus, xhr) {
            // alert('Se actualizaron los datos.');
          funcsorteo();
        },
    );
    $('#btn_fin_bolos').hide();
    $('#btn_sort').hide();
}

function funcsorteo() {
    var id_torneo = $('#torneo').val();
      $.ajax({
        url: controller+'/sorteo',
        type: "POST",
        cache: true,
        data: {id_torneo: id_torneo},
        success: function(data) {
            var carrera = $.parseJSON(data);
            console.log(carrera.status);
            if (carrera.status) {
                $('.programacionpartidos').html(carrera.cent);
                // $(".verticalTableHeader").each(function(){$(this).height($(this).width())})
            } else {
                if (carrera.status != 'negativo') {
                    $('.programacionpartidos').html('');
                    alert('No hay Equipos inscritos en este torneo.');
                }
              }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error al obtener datos.');
        }
      });
}


///////////////////// fixture end //////////////////////////////////

///////////////////// ir al partido begin //////////////////////////////////
function go_to_match(id_part,e1,e2) {
    // $.post('gopartido/'+id_part+'/'+e1+'/'+e2, function(data) {
    //     console.log(data)
    // }, 'json');

    window.location.href = 'gopartido/'+id_part+'/'+e1+'/'+e2;
}


function edit_alumno() {
            alert('asdfasdfas');
        }
///////////////////// ir al partido end ////////////////////////////////////






// jQuery(document).ready(function () {
//         var doc = $(document);
//         $( "a.add-type" ).click(function(e) {
//             e.preventDefault();
//             var content = jQuery('.edit_hover_class .type-row'),
//                 element = null;
//             for (var i = 0; i < 1; i++) {
//                 element = content.clone();
//                 var type_div = 'teams_' + jQuery.now();
//                 element.attr('id', type_div);
//                 element.find('.remove-type').attr('targetDiv', type_div);
//                 element.appendTo('.goal_container');
//             }
//             $(".remove-type").bind("click", function(){});
//         });

//         $( ".goal_container" ).click(function(e) {
//             var didConfirm = confirm("Are you sure You want to delete");
//             if (didConfirm == true) {
//                 var id = jQuery(this).attr('data-id');
//                 var targetDiv = jQuery(this).attr('targetDiv');
//                 console.log(id);
//                 //if (id == 0) {
//                 //var trID = jQuery(this).parents("tr").attr('id');
//                 jQuery('#' + targetDiv).remove();
//                 // }
//                 return true;
//             } else {
//                 return false;
//             }
//         });
        
//     });

function anotal_gol(asd, asd) {
    alert(eso);
}