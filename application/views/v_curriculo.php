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
    <style type="text/css">
        [contenteditable]:empty:before{
          content: attr(placeholder);
          pointer-events: none;
          display: block; /* For Firefox */
        }
    </style>
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
                <div class="table-responsive">
                <table id="table" class="table table-striped mb-none">
                    <thead>
                        <tr>
                            <th>Nro.</th>
                            <th>Nombres</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Posicion</th>
                            <!-- <th>Categoría</th> -->
                            <!-- <th>Equipo</th> -->
                            <th>Foto</th>
                            <th>Opciones</th>
                        </tr>
                    </thead> 
                </table>
                </div>
            </div>
          </div>
        </div>
      </div>
    <!-- <div class="modal fade" id="modal_form">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title"><?php echo $opcion; ?></h3>
                </div>
                <div class="modal-body form">
                    <form action="#" id="form" class="form-horizontal">
                        <input type="hidden" value="" name="id_catarbitro"/> 
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombre</label>
                                <div class="col-md-9">
                                    <input name="nombre" placeholder="Nombre del Arbitro" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="control-label col-md-3">Informacion</label>
                                <div class="col-md-9">
                                    <input name="informacion" placeholder="Informacion" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Trayectoria</label>
                                <div class="col-md-9">
                                    <input name="trayectoria" placeholder="Trayectoria" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="control-label col-md-3">Palmares</label>
                                <div class="col-md-9">
                                    <input name="palmares" placeholder="Palmares" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="control-label col-md-3">Logros</label>
                                <div class="col-md-9">
                                    <input name="logros" placeholder="Logros" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>  
                            <div class="form-group">
                                <label class="control-label col-md-3">Foto</label>
                                <div class="col-md-9">
                                    <input name="foto" placeholder="Foto" class="form-control" type="text">
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
            </div>
        </div>
    </div> -->

    <div class="modal fade" id="modal_form_curriculum" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title"><?php echo $opcion; ?></h3>
            </div>
            <div class="modal-body">
              <div class="transferencias"></div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              <!-- <button type="button" class="btn btn-primary">Guardar cambios</button> -->
            </div>
          </div>
        </div>
      </div>
</section>