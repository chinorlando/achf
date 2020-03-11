<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">Latest Orders</h3>

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
                <th>Local</th>
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
        <!-- <div class="box-footer clearfix">
          <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
          <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
        </div> -->
      </div>
    </div>
  </div>
</section>

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
                </div>
                <div class="form-group">
                  <label>Asistente 1</label>
                  <select class="form-control select2" name="arbitro_asistente_1" id="arbitro_asistente_1" style="width: 100%;">
                    
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label>Asistente 2</label>
                  <select class="form-control select2" name="arbitro_asistente_2" id="arbitro_asistente_2" style="width: 100%;">
                    
                  </select>
                </div>
                <div class="form-group">
                  <label>Planillero</label>
                  <select class="form-control select2" name="planillero" id="planillero" style="width: 100%;">
                    
                  </select>
                </div>
              </div>
            </div>
          </div>
      <!-- </div> -->
      </div>
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btnSave btn btn-primary" onclick="save()">Gurdar cambios</button>
        <!-- onclick="add_arbitros(<?php echo $partido->id_partidos ?>)" -->
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">
  var save_method;
  $(document).ready(function(){
    llenararbitros();
  });

  function add_arbitros(id_partido) {
    save_method = "add";
    $("#form_arbitro")[0].reset(); // reset form on modals
    $(".form-group").removeClass("has-error"); // clear error class
    // $(".help-block").empty(); // clear error string
    $("#modal-arbitro").modal("show"); // show bootstrap modal when complete loaded
    $(".modal-title").text("Añadir árbitros"); // Set Title to Bootstrap modal title


    $('#id_partido').val(id_partido);

    // llenararbitros();

  }

  function save() {
    id_jugador = $('#id_partido').val();
    // console.log(id_jugador);

    $(".btnSave").text("saving..."); //change button text
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
        } else {
          
        }
        $(".btnSave").text("Añadir");
        $(".btnSave").attr("disabled", false);
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
              }
              if (j==1) {
                console.log('estoy en el uno');
                $('[name="arbitro_asistente_1"]').val(data[i][j].id_arbitro);
              }
              if (j==2) {
                console.log('estoy en el dos');
                $('[name="arbitro_asistente_2"]').val(data[i][j].id_arbitro);
              }
            }
          }
        }

        $('[name="planillero"]').val(data.plani);
        
        $("#modal-arbitro").modal("show");
        $(".modal-title").text("Editar Árbitro");
        $(".btnSave").text("Editar");
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Error get data from ajax");
      }
    });
  }

  function llenararbitros() {
    $.post(CFG.url + 'planillero/get_arbitro', {
      tipo_arbitro: "REFEREE 1",
    },function(data, textStatus, xhr) {
        var tr = $.parseJSON(data);
        // console.log(tr.arbitro);
        $.each(tr.arbitro, function(index, val) {
          $("#arbitro_principal").append(
            '<option value="' + val.id_arbitro + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
          );
        });
      }
    );

    $.post(CFG.url + 'planillero/get_arbitro', {
      tipo_arbitro: "ASISTENTE 1",
    },function(data, textStatus, xhr) {
        var tr = $.parseJSON(data);
        // console.log(tr.arbitro);
        $.each(tr.arbitro, function(index, val) {
          $("#arbitro_asistente_1").append(
            '<option value="' + val.id_arbitro + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
          );
        });
      }
    );

    $.post(CFG.url + 'planillero/get_arbitro', {
      tipo_arbitro: "ASISTENTE 2",
    },function(data, textStatus, xhr) {
        var tr = $.parseJSON(data);
        // console.log(tr.arbitro);
        $.each(tr.arbitro, function(index, val) {
          $("#arbitro_asistente_2").append(
            '<option value="' + val.id_arbitro + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
          );
        });
      }
    );

    $.get(CFG.url + "planillero/get_planillero", function(data) {
      var tr = $.parseJSON(data);
      $.each(tr.planillero, function(index, val) {
        $("#planillero").append(
          '<option value="' + val.id_planillero + '">' + val.nombres + ' ' + val.apellido_paterno + ' ' + val.apellido_materno + '</option>'
        );
      });
    });
  }

  // function save_arbitro() {
  //   alert('asdfa');
  // }
</script>