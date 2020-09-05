<!-- Content Header (Page header) -->
<?php  echo $titulo_navegation; ?>
<!-- Main content -->
<section class="content">

    <!-- start: page -->
    <script src="<?php echo base_url(); ?>assets/customjs/formulario.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

            $("input").change(function(){
                $(this).parent().removeClass('has-error');
                $(this).next().empty();
            });
            $("textarea").change(function(){
                $(this).parent().removeClass('has-error');
                $(this).next().empty();
            });
            $("select").change(function(){
                $(this).parent().removeClass('has-error');
                $(this).next().empty();
            });

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
            $('#form_asignacion_jugador_equipo')[0].reset(); // reset form on modals
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



        function save_row_asignacion() {
            if($('[name="id_inscripcionjugador"]').val() == '')
                url = CFG.url + 'jugador/ajax_guardar_inscripcionjugador';
            else
                url = CFG.url + 'jugador/ajax_update_inscripcionjugador';
            $.ajax({
                url: url,
                type: "POST",
                cache: true,
                data: $("#form_asignacion_jugador_equipo").serialize(),
                success: function(data) {
                  var datos = $.parseJSON(data);
                  if (datos.status) {
                    alert('Datos guardados exitosamente.');
                    $("#form_asignacion_jugador_equipo")[0].reset();
                    $('#modal_form').modal('hide'); // show bootstrap modal
                  } else {
                    for (var i = 0; i < datos.inputerror.length; i++) {
                        $('[name="'+datos.inputerror[i]+'"]').parent().addClass('has-error');
                        $('[name="'+datos.inputerror[i]+'"]').next().text(datos.error_string[i]);
                      }
                  }

                  reload_table();
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert('Error al guardar datos.');
                }
              });
        }

        function reload_table()
        {
            table.ajax.reload(null,false); //reload datatable ajax 
        }

        function delete_row_asignacion(id)
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
                                url : controller + 'ajax_delete_asignacion/' + id,
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
                            <!-- <th>Categoria</th> -->
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
                    <form action="#" id="form_asignacion_jugador_equipo" class="form-horizontal">
                        <input type="hidden" value="" name="id_inscripcionjugador"/> 
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
                                        <option>Seleccione...</option>
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