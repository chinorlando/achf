<!-- Content Header (Page header) -->
<?php  echo $titulo_navegation; ?>

    <section class="content">

    <script src="<?php echo base_url(); ?>assets/customjs/formulario.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
           // alert('oso');
           // get_table('<?php echo $opcion; ?>','<?php echo base_url().$controllerajax; ?>');

            // $("input").change(function(){
            //     $(this).parent().removeClass('has-error');
            //     $(this).next().empty();
            // });
            // $("textarea").change(function(){
            //     $(this).parent().removeClass('has-error');
            //     $(this).next().empty();
            // });
            $("select").change(function(){
                $(this).parent().removeClass('has-error');
                $(this).next().empty();
            });

           $.get(CFG.url + "planillero/get_club", function(data) {
                var tr = $.parseJSON(data);
                $.each(tr, function(index, val) {
                    $("#club").append(
                        '<option value="' + val.id_club + '">' + val.nombre_club + "</option>"
                    );
                });
            });

            $.get(CFG.url + "planillero/get_torneo", function(data) {
                var tr = $.parseJSON(data);
                $.each(tr, function(index, val) {
                    $("#torneo").append(
                        '<option value="' + val.id_torneo + '">' + val.nombretorneo + "</option>"
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

        function inscribirEquipo() {
            $.ajax({
            url: CFG.url + 'planillero/ajax_inscripcion',
            type: "POST",
            cache: true,
            data: $("#form_inscripcion").serialize(),
            success: function(data) {
              var datos = $.parseJSON(data);
              if (datos.status) {
                alert('Datos guardados exitosamente.');
                $("#form_inscripcion")[0].reset();
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

<div class="col-md-6">
    <div class="row">
    <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Inscripciones</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <form id="form_inscripcion">
                <div class="col-md-12">
                  <div class="form-group">
                    <label>Club</label>
                    <select class="form-control" name="club" id="club" style="width: 100%;">
                        <option>Seleccione...</option>
                    </select>
                    <span class="help-block"></span>
                  </div>
                  <div class="form-group">
                    <label>Categorias</label>
                    <select class="form-control" name="categorias" id="categorias" style="width: 100%;">
                        <!-- <option></option> -->
                    </select>
                    <span class="help-block"></span>
                  </div>
                  <div class="form-group">
                    <label>Torneos</label>
                    <select class="form-control" name="torneo" id="torneo" style="width: 100%;">
                        <option>Seleccione...</option>
                    </select>
                    <span class="help-block"></span>
                  </div>
                </div>
            </form>
          </div>
        </div>
        <div class="box-footer">
            <button type="submit" class="btn btn-default">Cancelar</button>
            <button type="submit" class="btn btn-info pull-right" onclick="inscribirEquipo()">Inscribir</button>
        </div>
      </div>
    </div>
</div>

<!--       <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Quick Example</h3>
            </div>

            <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" id="exampleInputFile">

                  <p class="help-block">Example block-level help text here.</p>
                </div>
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> Check me out
                  </label>
                </div>
              </div>

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
        </div> -->

</section>