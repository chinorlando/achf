<?php  echo $titulo_navegation; ?>
    <section class="content">
  <script src="<?php echo base_url(); ?>assets/customjs/formulario.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // get_torneo('<?php echo $opcion; ?>','<?php echo base_url().$controllerajax; ?>')
            controller = '<?php echo base_url().$controllerajax; ?>';

            // $.get(CFG.url + "planillero/get_torneo", function(data) {
            //     var tr = $.parseJSON(data);
            //     $.each(tr, function(index, val) {
            //         $("#torneo").append(
            //             '<option value="' + val.id_torneo + '">' + val.nombretorneo + "</option>"
            //         );
            //     });
            // });

            $.get(CFG.url + "planillero/get_categoria_rol", function(data) {
                var tr = $.parseJSON(data);
                $.each(tr, function(index, val) {
                    $("#categoria_rol").append(
                        '<option value="' + val.id_categoria + '">' + val.nombre + "</option>"
                    );
                });
            });

            $('#categoria_rol').change(function(e) {
              var id_categoria = $('#categoria_rol').val();
              $('#categorias').empty();
              $.ajax({
                url: CFG.url + 'planillero/get_rol_partidos',
                type: "POST",
                cache: true,
                data: {id_categoria: id_categoria},
                success: function(data) {
                  datos = $.parseJSON(data);
                  if (id_categoria != -1) {
                    if (datos == "") {
                      alert('Esta categoria aun no ha sido sorteada.');
                      $('#button_pdf').hide();
                      $('#rolpartidos').html('');
                    } else {
                      $('#button_pdf').show();
                      $('#rolpartidos').html('');
                      $('#rolpartidos').html(datos);
                    }
                  }
                },
                error: function (jqXHR, textStatus, errorThrown){
                    alert('Error al obtener datos.');
                }
              });
            });

            $('#button_pdf').hide();

        });

        function pdf(){
          var categoria = $('#categoria_rol').val();
          if (categoria == -1) {
            alert('Debe seleccionar una categoria.')
          } else {
              window.open(CFG.url + 'Reporte/pdf_rol_partidos/'+categoria,'_blank'); 
          }
        }

        function pdf_arbitro(){
          var categoria = $('#categoria_rol').val();
          if (categoria == -1) {
            alert('Debe seleccionar una categoria.');
          } else {
            window.open(CFG.url + 'Reporte/pdf_rol_partidos_arbitros/'+categoria,'_blank'); 
          }
        }
    </script>
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Rol de partidos</h3>
          <div id="button_pdf">
           <button type="button" class="btn btn-success" onclick="pdf();" target="_blank"><i class="fa fa-file-pdf-o"></i> Pdf Partidos</button>
           <button type="button" class="btn btn-warning" onclick="pdf_arbitro();" target="_blank"><i class="fa fa-file-pdf-o"></i> Pdf Partidos Arbitro</button>
          </div>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <!-- <div class="col-md-6">
              <label>Torneo</label>
              <select class="form-control" name="torneo" id="torneo" style="width: 100%;">
                  <option>Seleccione...</option>
              </select>
              <br>
            </div> -->
            <div class="col-md-6">
              <label>Categoria</label>
              <select class="form-control" name="categoria_rol" id="categoria_rol" style="width: 100%;">
                  <option value="-1">Seleccione...</option>
              </select>
              <br>
            </div>

            <div class="col-md-12">
              <div id="rolpartidos"></div>
            </div>
            
          </div>
        </div>
        <div class="box-footer">
          <!-- Visit <a href="https://select2.github.io/">Select2 documentation</a> for more examples and information about
          the plugin. -->
        </div>
      </div>


    </section>





