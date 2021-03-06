<!-- Content Header (Page header) -->
<?php  echo $titulo_navegation; ?>
    <!-- Main content -->
    <section class="content">

    <!-- start: page -->
    <script src="<?php echo base_url(); ?>assets/customjs/formulario.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            //alert('oso');
            get_table('<?php echo $opcion; ?>','<?php echo base_url().$controllerajax; ?>');
            // function get_torneo(titulo, controlador) {
                controller = '<?php echo base_url().$controllerajax; ?>';
                $.get(controller + '/get_persona_presi', function(data) {
                    var torneo = $.parseJSON(data);
                    $.each(torneo, function(index, val) {
                        $('#presidente').append('<option value="'+val.id_persona+'">'+val.nombres+' '+val.apellido_paterno+' '+val.apellido_materno+'</option>');
                    });
                });
            // }

        });
    </script>
    <button type="button" class="btn btn-primary btn-icon icon-left"  onclick="add_row()">
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
          <div class="row ">
            <div class="col-md-12 responsive">
                <table id="table" class="table table-striped mb-none responsive">
                    <thead>
                        <tr>
                            <th>Nro.</th>
                            <th>Presidente</th>
                            <th>Club</th>
                            <th>Dirección</th>
                            <th>Ciudad</th>
                            <th>Fecha fundación</th>
                            <th>Escudo</th>
                            <th>Estado</th>
                            <!-- <th>Observaciones</th>              
                            <th>Estado</th> -->
                            <th>Opciones</th>
                        </tr>
                    </thead> 
                </table>
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
                        <input type="text" value="" name="id_club"/> 
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombre del Club</label>
                                <div class="col-md-9">
                                    <input name="nombre_club" placeholder="Nombre del Equipo" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Presidente</label>
                                <div class="col-md-9">
                                    <!-- <input name="presidente" placeholder="Presidente" class="form-control" type="text"> -->
                                    <select name="presidente" id="presidente" class="form-control"></select>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Direccion</label>
                                <div class="col-md-9">
                                    <input name="direccion" placeholder="Direccion" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Ciudad</label>
                                <div class="col-md-9">
                                    <input name="ciudad" placeholder="Ciudad" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <!-- <div class="form-group">
                                <label class="control-label col-md-3">Escudo</label>
                                <div class="col-md-9">
                                    <input name="escudo" placeholder="Escudo" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div> -->
                            <div class="form-group">
                                <label class="control-label col-md-3">Fecha de Fundacion</label>
                                <div class="col-md-9">
                                    <input name="fecha_fundación" placeholder="Fecha de Fundacion" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>

                            <div class="form-group" id="photo-preview">
                                <label class="control-label col-md-3">Escudo</label>
                                <div class="col-md-9">
                                    (Sin foto)
                                    <span class="help-block"></span>
                                </div>
                            </div>                       
                            <div class="form-group">
                                <label class="control-label col-md-3" id="label-photo">Subir escudo</label>
                                <div class="col-md-9">
                                    <input name="photo" type="file">
                                    <span class="help-block"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3">Estado</label>
                                <div class="col-md-9">
                                    <select name="estado" class="form-control">
                                        <option value="1">Activo</option>
                                        <option value="0">Inactivo</option>
                                    </select>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSave" class="btn btn-info" onclick="save_row()">Guardar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- End Bootstrap modal -->
    <!-- end: page -->
</section>