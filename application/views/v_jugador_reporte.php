<!-- Content Header (Page header) -->
<?php  echo $titulo_navegation; ?>
    <!-- Main content -->
    <section class="content">

    <!-- start: page -->
    <script src="<?php echo base_url(); ?>assets/customjs/formulario.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
           // alert('oso');
           get_table('<?php echo $opcion; ?>','<?php echo base_url().$controllerajax; ?>');
        });
    </script>

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
                            <th>Ficha</th>
                            <th>Carnet</th>
                        </tr>
                    </thead> 
                </table>
                </div>
            </div>
          </div>
        </div>
      </div>

</section>