<!-- Content Header (Page header) -->
<?php  echo $titulo_navegation; ?>
<!-- Main content -->
<section class="content">

    <!-- start: page -->
    <script src="<?php echo base_url(); ?>assets/customjs/formulario.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            get_table('<?php echo $opcion; ?>','<?php echo base_url().$controllerajax; ?>');

            $.get(CFG.url + "jugador/get_all_jugadores", function(data) {
                var tr = $.parseJSON(data);
                $.each(tr, function(index, val) {
                    $("#jugadores").append(
                        '<option value="' + val.id_jugador + '">' + val.apellido_paterno + ' ' + val.apellido_materno + ', ' + val.nombres + "</option>"
                    );
                });
            });

           $.get(CFG.url + "planillero/get_club", function(data) {
                var tr = $.parseJSON(data);
                $.each(tr, function(index, val) {
                    $("#club").append(
                        '<option value="' + val.id_club + '">' + val.nombre_club + "</option>"
                    );
                });
            });

            $('#club').change(function(e) {
              var id_club = $('#club').val();
              $('#categorias').empty();
              $.ajax({
                url: CFG.url + 'planillero/get_categoria_by_club_inscripcion',
                type: "POST",
                cache: true,
                data: {id_club: id_club},
                success: function(data) {
                  var datos = $.parseJSON(data);
                  if (!$.isEmptyObject(datos.categorias)) {
                    $('#categorias').append('<option value="-1">Seleccionar categoria...</option>');
                    $.each(datos.categorias, function(index, val) {
                      $('#categorias').append('<option value="'+val.id_categoria+'">'+val.nombre+'</option>');
                    });
                  } else {
                    alert('El club no tiene categorias. Elija otro.');
                  }
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert('Error al obtener datos.');
                }
              });
            });
        });

        function add_row_asignacion(){
            save_method = 'add';
            enabled_form();
            $('#form')[0].reset(); // reset form on modals
            //    $('#form select').select2("val", "");
            //$('#form').trigger("reset");
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            $('#modal_form').modal('show'); // show bootstrap modal
            $('.modal-title').text('Adicionar '+title); // Set Title to Bootstrap modal title

            $('#photo-preview').hide(); // hide photo preview modal
            $('#label-photo').text('Subir imagen'); // label photo upload

            $('#btnSave').show();
        }

        function save_row_asignacion()
        {
            $('#btnSave').text('guardando...'); //change button text
            $('#btnSave').attr('disabled',true); //set button disable 
            // var url;

            $.ajax({
            url: CFG.url + 'jugador/ajax_guardar_inscripcionjugador',
            type: "POST",
            cache: true,
            data: $("#form").serialize(),
            success: function(data) {
              var datos = $.parseJSON(data);
              if (datos.status) {
                alert('Datos guardados exitosamente.');
                $("#form")[0].reset();
              } else {
                for (var i = 0; i < datos.inputerror.length; i++) {
                    $('[name="'+datos.inputerror[i]+'"]').parent().addClass('has-error');
                    $('[name="'+datos.inputerror[i]+'"]').next().text(datos.error_string[i]);
                  }
              }
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error al guardar datos.');
            }
          });


            // if(save_method == 'add') {
            //     // url = controller + 'ajax_add';
            //     url: CFG.url + 'jugador/ajax_guardar_inscripcionjugador';
            // } else {
            //     url = controller + 'ajax_update';
            // }

            // $.ajax({
            //     url : url,
            //     type: "POST",
            //     data: $('#form').serialize(),
            //     dataType: "JSON",
            //     success: function(data)
            //     {
            //         if(data.status) //if success close modal and reload ajax table
            //         {
            //             $('#modal_form').modal('hide');
            //             reload_table();
            //         }
            //         else
            //         {
            //             for (var i = 0; i < data.inputerror.length; i++) 
            //             {
            //                 $('[name="'+data.inputerror[i]+'"]').parent().parent().addClass('has-error'); //select parent twice to select div form-group class and add has-error class
            //                 $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]); //select span help-block class set text error string
            //             }
            //         }
            //         $('#btnSave').text('Guardar'); //change button text
            //         $('#btnSave').attr('disabled',false); //set button enable 
            //     },
            //     error: function (jqXHR, textStatus, errorThrown)
            //     {
            //         alert('Error al añadir / actualizar');
            //         $('#btnSave').text('Guardar'); //change button text
            //         $('#btnSave').attr('disabled',false); //set button enable 

            //     }
            // });
        }


        function equipoJugador() {
            $.ajax({
            url: CFG.url + 'jugador/ajax_guardar_inscripcionjugador',
            type: "POST",
            cache: true,
            data: $("#form_asignacion_jugador_equipo").serialize(),
            success: function(data) {
              var datos = $.parseJSON(data);
              if (datos.status) {
                alert('Datos guardados exitosamente.');
                $("#form_asignacion_jugador_equipo")[0].reset();
              } else {
                for (var i = 0; i < datos.inputerror.length; i++) {
                    $('[name="'+datos.inputerror[i]+'"]').parent().addClass('has-error');
                    $('[name="'+datos.inputerror[i]+'"]').next().text(datos.error_string[i]);
                  }
              }
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error al guardar datos.');
            }
          });
        }
    </script>
    <button type="button" class="btn btn-primary btn-icon icon-left"  onclick="add_row_asignacion()">
        Adicionar <?php echo $opcion; ?>
        <i class="entypo-plus-squared"></i>
    </button>
    <br /><br />

    <!-- SELECT2 EXAMPLE -->
    <div class="box box-default">
        <div class="box-header with-border">
           <!--<h7 class="box-title">Registro</h7>-->

           <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
          <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                <table id="table" class="table table-striped mb-none ">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombres</th>
                            <th>F. Nacimiento</th>
                            <th>CI</th>
                            <th>Nº FBF</th>
                            <th>Foto</th>
                            <th>Sexo</th>
                            <th>Nacionalidad</th>
                            <th>Club</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                        </tr>
                    </thead> 
                </table>
                </div>
            </div>
          </div>
        </div>
</div>
<div class="modal fade" id="modal_form">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title"><?php echo $opcion; ?></h3>
                </div>
                <div class="modal-body form">
                    <form action="#" id="form" class="form-horizontal">
                        <input type="hidden" value="" name="id_jugador"/> 
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">Dorsal</label>
                                <div class="col-md-9">
                                    <input class="form-control" name="dorsal" id="dorsal" style="width: 100%;">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Posición</label>
                                <div class="col-md-9">
                                    <input class="form-control" name="posicion" id="posicion" style="width: 100%;">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Peso</label>
                                <div class="col-md-9">
                                    <input class="form-control" name="peso" id="peso" style="width: 100%;">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Jugadores</label>
                                <div class="col-md-9">
                                    <select class="form-control" name="jugadores" id="jugadores" style="width: 100%;">
                                        <option value="-1">Seleccione...</option>
                                    </select>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Club</label>
                                <div class="col-md-9">
                                    <select class="form-control" name="club" id="club" style="width: 100%;">
                                        <option>Seleccione...</option>
                                    </select>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Categorias</label>
                                <div class="col-md-9">
                                    <select class="form-control" name="categorias" id="categorias" style="width: 100%;">
                                    </select>
                                    <span class="help-block"></span>
                                </div>
                            </div>

                            
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSave" class="btn btn-info" onclick="save_row_asignacion()">Guardar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</section>