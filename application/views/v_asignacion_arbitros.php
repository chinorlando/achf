<?php echo $datos ?>
<!-- <section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">ASIGNACIÓN DE ÁRBITROS A PARTIDOS</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          <div class="table-responsive">
            <table class="table no-margin">
              <thead>
              <tr>
                <th>#</th>
                <th>Jornada Nº</th>
                <th>Local</th>
                <th>vs</th>
                <th>Visitante</th>
                <th>Acciones</th>
                
              </tr>
              </thead>
              <tbody>
                <?php echo $datos ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section> -->

<div class="modal fade" id="modal-arbitro">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Asignación de partidos</h4>
      </div>
      <form id="form_arbitro">
      <div class="modal-body">
        <!-- <div class="box box-default"> -->
          <div class="box-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" name="id_partido" id="id_partido" hidden="hidden">
                  <label>Árbitro Principal</label>
                  <select class="form-control select2" name="arbitro_principal" id="arbitro_principal" style="width: 100%;">
                  </select>
                  <span class="help-block"></span>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                  <label>Asistente 1</label>
                  <select class="form-control select2" name="arbitro_asistente_1" id="arbitro_asistente_1" style="width: 100%;">
                  </select>
                  <span class="help-block"></span>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                  <label>Asistente 2</label>
                  <select class="form-control select2" name="arbitro_asistente_2" id="arbitro_asistente_2" style="width: 100%;">
                  </select>
                  <span class="help-block"></span>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                  <label>Asistente 3</label>
                  <select class="form-control select2" name="arbitro_asistente_3" id="arbitro_asistente_3" style="width: 100%;">
                  </select>
                  <span class="help-block"></span>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                  <label>Planillero</label>
                  <select class="form-control select2" name="planillero" id="planillero" style="width: 100%;">
                  </select>
                  <span class="help-block"></span>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                  <label>Cancha:</label>
                  <select class="form-control select2" name="cancha" id="cancha" style="width: 100%;">
                  </select>
                  <span class="help-block"></span>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                  <label>Date:</label>
                  <div class="input-group date">
                    <input type="text" class="form-control pull-right" id="fecha_hora_partido" name="fecha_hora_partido">
                    <span class="help-block"></span>
                    <div class="input-group-addon">
                      <i class="fa fa-calendar"></i>
                    </div>
                    <div class="input-group-addon">
                      <i class="fa fa-clock-o"></i>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
      
      </div>
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btnSave btn btn-primary" onclick="save()">Guardar cambios</button>
        <!-- onclick="add_arbitros(<?php echo $partido->id_partidos ?>)" -->
      </div>
    </div>
  </div>
</div>




<script type="text/javascript">
  var save_method;
  $(document).ready(function(){
    llenararbitros();

    // $("input").change(function(){
    //     $(this).parent().parent().removeClass('has-error');
    //     $(this).next().empty();
    // });
    // $("textarea").change(function(){
    //     $(this).parent().removeClass('has-error');
    //     $(this).next().empty();
    // });
    // $("select").change(function(){
    //     $(this).parent().parente().removeClass('has-error');
    //     $(this).next().empty();
    // });

  });

  function add_arbitros(id_partido) {
    save_method = "add";
    // $("#form_arbitro")[0].reset(); // reset form on modals
    limpiarFormulario()
    $(".form-group").removeClass("has-error"); // clear error class
    // $(".help-block").empty(); // clear error string
    $("#modal-arbitro").modal("show"); // show bootstrap modal when complete loaded
    $(".modal-title").text("Añadir árbitros"); // Set Title to Bootstrap modal title
    $(".btnSave").text("Guardar datitos");


    $('#id_partido').val(id_partido);

  }

  function limpiarFormulario() {
    $(':input','#form_arbitro')
      .not(':button, :submit, :reset, :hidden')
      .val('')
      .removeAttr('checked')
      .removeAttr('selected');
    $('[name="arbitro_principal"]').select2({});
    $('[name="arbitro_asistente_1"]').select2({});
    $('[name="arbitro_asistente_2"]').select2({});
    $('[name="arbitro_asistente_3"]').select2({});
    $('[name="cancha"]').select2({});
  }

  function save() {
    id_jugador = $('#id_partido').val();
    // console.log(id_jugador);

    $(".btnSave").text("Guardando..."); //change button text
    $(".btnSave").attr("disabled", true); //set button disable
    var url;

    if (save_method == "add") {
      url = CFG.url + "planillero/add_arbitro";
    } else {
      url = CFG.url + "planillero/update_arbitro";
    }
    $.ajax({
      url: url,
      type: "POST",
      data: $("#form_arbitro").serialize(),
      dataType: "JSON",
      success: function(data) {
        if (data.status) {
          //if success close modal and reload ajax table
          $("#modal-arbitro").modal("hide");
          // reload_table();
          alert("Los datos han sido guardados.");
        } else {
          for (var i = 0; i < data.inputerror.length; i++) {
            $('[name="'+data.inputerror[i]+'"]').parent().addClass('has-error');
            $('[name="'+data.inputerror[i]+'"]').next().text(data.error_string[i]);
          }
          $(".btnSave").text("Actualizar");
          $(".btnSave").attr("disabled", false);
        }
        // $(".btnSave").text("Añadir");
        // $(".btnSave").attr("disabled", false);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Error adding / update data");
        $(".btnSave").text("Añadir árbitros"); //change button text
        $(".btnSave").attr("disabled", false); //set button enable
      }
    });
  }

  function edit_arbitros(id) {
    save_method = "update";
    $("#form_arbitro")[0].reset();
    $(".form-group").removeClass("has-error"); // clear error class
    $(".help-block").empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
      url: CFG.url + "planillero/edit_arbitros/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id_partido"]').val(data.id_partido);

        console.log(data);
        for (var  i in data) {
          for (var  j in data[i]) {
            if (data[i][j].hasOwnProperty('id_arbitro')) {
              // data[i][j].check = true;
              // alert(data[i][j].id_arbitro);
              console.log(j);
              if (j==0) {
                console.log('estoy en el cero');
                $('[name="arbitro_principal"]').val(data[i][j].id_arbitro);
                // para que al editar quede seleccionado el elemento a editar
                $('[name="arbitro_principal"]').select2({});
              }
              if (j==1) {
                console.log('estoy en el uno');
                $('[name="arbitro_asistente_1"]').val(data[i][j].id_arbitro);
                $('[name="arbitro_asistente_1"]').select2({});
              }
              if (j==2) {
                console.log('estoy en el dos');
                $('[name="arbitro_asistente_2"]').val(data[i][j].id_arbitro);
                $('[name="arbitro_asistente_2"]').select2({});
              }
              if (j==3) {
                console.log('estoy en el tres');
                $('[name="arbitro_asistente_3"]').val(data[i][j].id_arbitro);
                $('[name="arbitro_asistente_3"]').select2({});
              }
            }
          }
        }

        // $('#cancha option').each(function(index, el) {
        //   if ($(this).val() == 4) {
        //     $(this).attr("selected","selected");
        //   }
        // });

        // $('#cancha > option[value="'+data.id_estad+'"]').prop('selected', 'selected');

        // $('[name="cancha"]').val('Garcilazo (Cap.: 10000)');
        // $('[name="cancha"]').val(data.id_estad);

        // console.log($('#cancha > option[value="'+4+'"]').val());
        // $('#cancha > option[value="'+data.id_estad+'"]').attr('selected', 'selected');

        $('[name="planillero"]').val(data.plani);
        $('[name="planillero"]').select2({});
        $('[name="cancha"]').val(data.id_estad);
        $('[name="cancha"]').select2({});
        $('[name="fecha_hora_partido"]').val(data.jornada);

        
        $("#modal-arbitro").modal("show");
        $(".modal-title").text("Actualizar Árbitro");
        $(".btnSave").text("Actualizar");
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Error get data from ajax");
      }
    });
  }

  function edit_arbitros_reprogramacion(id) {
    save_method = "update";
    $("#form_arbitro")[0].reset();
    $(".form-group").removeClass("has-error"); // clear error class
    $(".help-block").empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
      url: CFG.url + "planillero/edit_arbitros/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id_partido"]').val(data.id_partido);

        for (var  i in data) {
          for (var  j in data[i]) {
            if (data[i][j].hasOwnProperty('id_arbitro')) {
              // data[i][j].check = true;
              // alert(data[i][j].id_arbitro);
              console.log(j);
              if (j==0) {
                console.log('estoy en el cero');
                $('[name="arbitro_principal"]').val(data[i][j].id_arbitro);
                // para que al editar quede seleccionado el elemento a editar
                $('[name="arbitro_principal"]').select2({});
              }
              if (j==1) {
                console.log('estoy en el uno');
                $('[name="arbitro_asistente_1"]').val(data[i][j].id_arbitro);
                $('[name="arbitro_asistente_1"]').select2({});
              }
              if (j==2) {
                console.log('estoy en el dos');
                $('[name="arbitro_asistente_2"]').val(data[i][j].id_arbitro);
                $('[name="arbitro_asistente_2"]').select2({});
              }
              if (j==3) {
                console.log('estoy en el tres');
                $('[name="arbitro_asistente_3"]').val(data[i][j].id_arbitro);
                $('[name="arbitro_asistente_3"]').select2({});
              }
            }
          }
        }

        $('[name="planillero"]').val(data.plani);
        $('[name="planillero"]').select2({});
        $('[name="cancha"]').val(data.id_estad);
        $('[name="cancha"]').select2({});
        $('[name="fecha_hora_partido"]').val();

        
        $("#modal-arbitro").modal("show");
        $(".modal-title").text("Actualizar Árbitro");
        $(".btnSave").text("Actualizar");
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Error get data from ajax");
      }
    });
  }

  function llenararbitros() {
    $.post(CFG.url + 'planillero/get_arbitro', {
      tipo_arbitro: "ARBITRO FIFA",
    },function(data, textStatus, xhr) {
        var tr = $.parseJSON(data);
        // console.log(tr.arbitro);
        $('#arbitro_principal').append('<option value="-1">Seleccionar...</option>');
        $.each(tr.arbitro, function(index, val) {
          $("#arbitro_principal").append(
            '<option value="' + val.id_arbitro + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
          );
        });
      }
    );

    $.post(CFG.url + 'planillero/get_arbitro', {
      tipo_arbitro: "ASISTENTE ARBITRO FIFA",
    },function(data, textStatus, xhr) {
        var tr = $.parseJSON(data);
        // console.log(tr.arbitro);
        $('#arbitro_asistente_1').append('<option value="-1">Seleccionar...</option>');
        $.each(tr.arbitro, function(index, val) {
          $("#arbitro_asistente_1").append(
            '<option value="' + val.id_arbitro + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
          );
        });
      }
    );

    $.post(CFG.url + 'planillero/get_arbitro', {
      tipo_arbitro: "ASISTENTE ARBITRO FIFA",
    },function(data, textStatus, xhr) {
        var tr = $.parseJSON(data);
        // console.log(tr.arbitro);
        $('#arbitro_asistente_2').append('<option value="-1">Seleccionar...</option>');
        $.each(tr.arbitro, function(index, val) {
          $("#arbitro_asistente_2").append(
            '<option value="' + val.id_arbitro + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
          );
        });
      }
    );

    $.post(CFG.url + 'planillero/get_arbitro', {
      tipo_arbitro: "ASISTENTE ARBITRO FIFA",
    },function(data, textStatus, xhr) {
        var tr = $.parseJSON(data);
        // console.log(tr.arbitro);
        $('#arbitro_asistente_3').append('<option value="-1">Seleccionar...</option>');
        $.each(tr.arbitro, function(index, val) {
          $("#arbitro_asistente_3").append(
            '<option value="' + val.id_arbitro + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
          );
        });
      }
    );

    $.get(CFG.url + "planillero/get_planillero", function(data) {
      var tr = $.parseJSON(data);
      $('#planillero').append('<option value="-1">Seleccionar...</option>');
      $.each(tr.planillero, function(index, val) {
        $("#planillero").append(
          '<option value="' + val.id_planillero + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
        );
      });
    });

    $.get(CFG.url + "planillero/get_cancha", function(data) {
      var tr = $.parseJSON(data);
      // $.each(tr.canchas, function(index, val) {
      //   $("#cancha").append(
      //     '<option value="' + val.id_estadio + '">' + val.nombreestadio + '</option>'
      //   );
      // });
      // var tr = $.parseJSON(data);
      // console.log(tr.canchas);
      $('#cancha').append('<option value="-1">Seleccionar...</option>');
      $.each(tr.canchas, function(index, val) {
        $('#cancha').append('<option value="'+val.id_estadio+'">'+val.nombreestadio+'</option>');
      });

    });

    $('#fecha_hora_partido').datetimepicker({
      // minDate : new Date(),
      format: 'YYYY/MM/DD HH:mm:00',
    });
    




  }

  // function save_arbitro() {
  //   alert('asdfa');
  // }
</script>

<!-- <img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTcuMS4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDE5OS4zNDkgMTk5LjM0OSIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMTk5LjM0OSAxOTkuMzQ5OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4Ij4KPHBhdGggZD0iTTE4My43MzEsMTI4Ljc0NmM1LjkxOC05LjM4Niw5LjM4NC0yMC40NjEsOS40NS0zMi4zMjFjMC4xNzQtMzEuMTItMjMuMzQ0LTU3LjUxLTU0LjcwMy02MS4zODQgIGMtMS40MjQtMC4xNzgtMi44NTEsMC4yNjctMy45MjUsMS4yMTZjLTEuMDczLDAuOTQ5LTEuNjg5LDIuMzEzLTEuNjg5LDMuNzQ2djQuNjA2aC0zMS4yNzN2LTUuMDYzYzAtMi43NjItMi4yMzgtNS01LTVINSAgYy0yLjc2MiwwLTUsMi4yMzgtNSw1VjY4LjZjMCwyLjc2MiwyLjIzOCw1LDUsNWg0Mi4yNTJjMTIuNTMxLDAsMjIuNzkyLDEwLjI2NSwyMi44NzQsMjIuODkxbDAuMDEsMC43NSAgYzAuNjA0LDMyLjQzNCwyNi40NDMsNTguOTIzLDU4LjgyNyw2MC4zMDVjMC44OTksMC4wMzksMS44LDAuMDU4LDIuNjksMC4wNThjMC4wMDIsMCwwLjAwMywwLDAuMDA1LDAgIGMxMS41MjcsMCwyMi4zMzUtMy4yMDgsMzEuNTgtOC43NzJjMS4wNyw4Ljk4MSw4LjcyMSwxNS45NzEsMTcuOTg1LDE1Ljk3MWM5Ljk5NCwwLDE4LjEyNS04LjEzMSwxOC4xMjUtMTguMTI1ICBDMTk5LjM0OSwxMzcuNTM1LDE5Mi41NCwxMjkuOTc0LDE4My43MzEsMTI4Ljc0NnogTTE4MS4yMjQsMTU0LjgwMmMtNC40OCwwLTguMTI1LTMuNjQ0LTguMTI1LTguMTI1ICBjMC00LjQ4LDMuNjQ1LTguMTI1LDguMTI1LTguMTI1czguMTI1LDMuNjQ1LDguMTI1LDguMTI1QzE4OS4zNDksMTUxLjE1NywxODUuNzA0LDE1NC44MDIsMTgxLjIyNCwxNTQuODAyeiIgZmlsbD0iIzAwMDAwMCIvPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K" /> -->