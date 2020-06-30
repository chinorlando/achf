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
                                <label class="control-label col-md-3">Teléfono fijo</label>
                                <div class="col-md-9">
                                    <input name="telefono" placeholder="Telefono fijo" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Celular</label>
                                <div class="col-md-9">
                                    <input name="celular" placeholder="Celular" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Dirección</label>
                                <div class="col-md-9">
                                    <input name="direccion" placeholder="Dirección" class="form-control" type="text">
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
                                <label class="control-label col-md-3">Fecha de nacimiento</label>
                                <div class="col-md-9">
                                    <input name="fecha_nacimiento" placeholder="9999-99-99" class="form-control" type="text">
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
                                <label class="control-label col-md-3">Profesión</label>
                                <div class="col-md-9">
                                    <input name="profesion" placeholder="Profesión" class="form-control" type="text">
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
                                <label class="control-label col-md-3">Email</label>
                                <div class="col-md-9">
                                    <input name="email" placeholder="miemail@email.com" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <label class="control-label col-md-3">Nº registro FBF</label>
                                <div class="col-md-9">
                                    <input name="n_registro_fbf" placeholder="n_registro_fbf" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">LFPB Asociación Liga provincial</label>
                                <div class="col-md-9">
                                    <input name="lfpb_asociacion_liga_provincial" placeholder="liga" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombre del padre</label>
                                <div class="col-md-9">
                                    <input name="nombre_padre" placeholder="Nombre completo" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Nombre de la madre</label>
                                <div class="col-md-9">
                                    <input name="nombre_madre" placeholder="Nombre completo" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Estadp civil</label>
                                <div class="col-md-9">
                                    <input name="estado_civil" placeholder="Estado civil" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">C. I.</label>
                                <div class="col-md-9">
                                    <input name="c_i" placeholder="C. I." class="form-control" type="text">
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

                            <div class="form-group" id="photo-preview">
                                <label class="control-label col-md-3">Photo</label>
                                <div class="col-md-9">
                                    (Sin foto)
                                    <span class="help-block"></span>
                                </div>
                            </div>                       
                            <div class="form-group">
                                <label class="control-label col-md-3" id="label-photo">Subir Foto </label>
                                <div class="col-md-9">
                                    <input name="photo" type="file">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Usuario</label>
                                <div class="col-md-9">
                                    <input name="usuario" placeholder="Usuario" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Contraseña</label>
                                <div class="col-md-9">
                                    <input name="password" placeholder="Contraseña" class="form-control" type="password">
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