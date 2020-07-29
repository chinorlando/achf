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
          <div class="row">
            <div class="col-md-12">
                <table id="table" class="table table-striped mb-none">
                    <thead>
                        <tr>
                            <th>Nro.</th>
                            <th>Nombre</th>
                            <th>Inicia </th>
                            <th>Termina</th>
                            <th>Estado</th>
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
                        <input type="hidden" value="" name="id_torneo"/> 
                        <div class="form-body">
                            <!-- <div class="form-group">
                                <label class="control-label col-md-3">Categoria:</label>
                                <div class="col-md-9">
                                    <select class="form-control" name="torneo_camp" id="torneo_camp">
                                        <option value="-1">Seleccione...</option>
                                    </select>
                                    <span class="help-block"></span>
                                </div>
                            </div> -->
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombre del torneo:</label>
                                <div class="col-md-9">
                                    <!-- <div class="input-group"> -->
                                    <input name="nombretorneo" id="nombretorneo" placeholder="Nombre del torneo" class="form-control" type="text">
                                    <span class="help-block"></span>
                                    <!-- </div> -->
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3">Fecha inicio:</label>
                                <div class="col-md-9">
                                    <div class="input-group">
                                        <input id="fecha_inicio" name="fecha_inicio" placeholder="9999/99/99" class="form-control" type="text">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Fecha final:</label>
                                <div class="col-md-9">
                                    <div class="input-group">
                                    <input name="fecha_fin" id="fecha_fin" placeholder="fecha_fin" class="form-control" type="text">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <label class="control-label col-md-3">Estado:</label>
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
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    $('#fecha_inicio').datetimepicker({
      format: 'YYYY/MM/DD',
      // format: 'DD/MM/YYYY',
    });
    $('#fecha_fin').datetimepicker({
      format: 'YYYY/MM/DD',
    });
</script>