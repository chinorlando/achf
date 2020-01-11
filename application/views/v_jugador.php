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
                <div class="table-responsive">
                <table id="table" class="table table-striped mb-none ">
                    <thead>
                        <tr>
                            <th>Nro.</th>
                            <th>Nombres</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Posicion</th>
                            <th>Categoría</th>
                            <th>Equipo</th>
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
                                <label class="control-label col-md-3">Numero Registro F.B.F.</label>
                                <div class="col-md-9">
                                    <input name="n_registro_fbf" placeholder="Numero Registro FBF" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombres</label>
                                <div class="col-md-9">
                                    <input name="nombres" placeholder="Nombres" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Apellido Paterno</label>
                                <div class="col-md-9">
                                    <input name="apellido_paterno" placeholder="Apellido Paterno" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Apellido Materno</label>
                                <div class="col-md-9">
                                    <input name="apellido_materno" placeholder="Apellido Materno" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Categoria</label>
                                <div class="col-md-9">
                                    <input name="categoria" placeholder="Categoria" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">L.F.P.B. - Asociacion - Liga Provincial</label>
                                <div class="col-md-9">
                                    <input name="lfpb_asociacion_liga_provincial" placeholder="L.F.P.B. Asociacion Liga Provincial" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Nacionalidad</label>
                                <div class="col-md-9">
                                    <input name="nacionalidad" placeholder="Nacionalidad" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Estado Civil</label>
                                <div class="col-md-9">
                                    <input name="estado_civil" placeholder="Estado Civil" class="form-control" type="text">
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
                            <div class="form-group">
                                <label class="control-label col-md-3">Fecha de Nacimiento</label>
                                <div class="col-md-9">
                                    <input name="fecha_nacimiento" placeholder="Fecha de Nacimiento" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombre Del Padre</label>
                                <div class="col-md-9">
                                    <input name="nombre_padre" placeholder="Nombre Del Padre" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombre De La Madre</label>
                                <div class="col-md-9">
                                    <input name="nombre_madre" placeholder="Nombre De La Madre" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>                        
                            <div class="form-group">
                                <label class="control-label col-md-3">Edad</label>
                                <div class="col-md-9">
                                    <input name="edad" placeholder="Edad" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Carnet de Identidad</label>
                                <div class="col-md-9">
                                    <input name="c_i" placeholder="Carnet de Identidad" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Sexo</label>
                                <div class="col-md-9">
                                    <input name="sexo" placeholder="Sexo" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Domicilio</label>
                                <div class="col-md-9">
                                    <input name="domicilio" placeholder="Domicilio" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Procede del Club</label>
                                <div class="col-md-9">
                                    <input name="procede_del_club" placeholder="Procede del Club" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Posicion</label>
                                <div class="col-md-9">
                                    <input name="posicion" placeholder="Posicion" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Estatura</label>
                                <div class="col-md-9">
                                    <input name="estatura" placeholder="Estatura" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Peso</label>
                                <div class="col-md-9">
                                    <input name="peso" placeholder="Peso" class="form-control" type="text">
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