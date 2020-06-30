<?php  echo $titulo_navegation; ?>
    <section class="content">
	<script src="<?php echo base_url(); ?>assets/customjs/formulario.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // get_torneo('<?php echo $opcion; ?>','<?php echo base_url().$controllerajax; ?>')
        });
    </script>
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Rol de partidos</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
          	<div class="col-md-12">
          		<?php  echo $rol_partidos; ?>
          	</div>
          </div>
        </div>
        <div class="box-footer">
          <!-- Visit <a href="https://select2.github.io/">Select2 documentation</a> for more examples and information about
          the plugin. -->
        </div>
      </div>

    </section>





