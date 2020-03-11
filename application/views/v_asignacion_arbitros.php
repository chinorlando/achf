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
                <?php $i = 1 ?>
                <?php foreach ($partidos as $partido): ?>
                  <tr>
                    <td><?php echo $i++; ?></td>
                    <td><?php echo $partido->local; ?></td>
                    <td><?php echo $partido->visitante; ?></td>
                    
                    <td>

                      <?php $existe = $this->db->get_where('arbitro_partido', array('id_partidos' => 2,))->row()->id_arbitropartido; ?>

                      <?php echo $existe; ?>
                      
                      <?php if ($existe): ?>
                        <a class="btn btn-sm btn-primary id_match" href="javascript:void(0)" title="Añadir árbitros" onclick="add_arbitros(<?php echo $partido->id_partidos; ?>)">Actualizar</a>
                      <?php else: ?>
                        <a class="btn btn-sm btn-primary id_match" href="javascript:void(0)" title="Añadir árbitros" onclick="edit_arbitros(<?php echo $partido->id_partidos; ?>)">Asignar árbitros</a>
                      <?php endif ?>
                      
                    </td>
                  </tr>
                <?php endforeach ?>
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
                  <label>Lateria 1</label>
                  <select class="form-control select2" name="arbitro_asistente_1" id="arbitro_asistente_1" style="width: 100%;">
                    
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label>Lateral 2</label>
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
  // $.get(CFG.url + "profile/get_cargo", function(data) {
  //   var tr = $.parseJSON(data);
  //   $.each(tr, function(index, val) {
  //     $("#cargo").append(
  //       '<option value="' + val.id_cargo + '">' + val.nombre_cargo + "</option>"
  //     );
  //   });
  // });

  // $.get(CFG.url + "profile/get_rol", function(data) {
  //   var tr = $.parseJSON(data);
  //   $.each(tr, function(index, val) {
  //     $("#rol").append(
  //       '<option value="' + val.id_rol + '">' + val.nombre + "</option>"
  //     );
  //   });
  // });

  function add_arbitros(id_partido) {
    save_method = "add";
    $("#form_arbitro")[0].reset(); // reset form on modals
    $(".form-group").removeClass("has-error"); // clear error class
    // $(".help-block").empty(); // clear error string
    $("#modal-arbitro").modal("show"); // show bootstrap modal when complete loaded
    $(".modal-title").text("Añadir árbitros"); // Set Title to Bootstrap modal title


    $('#id_partido').val(id_partido);





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

  function save() {
    id_jugador = $('#id_partido').val();
    console.log(id_jugador);

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
        $(".btnSave").text("Añadir árbitros");
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
    $("#form_teacher")[0].reset(); // reset form on modals
    $(".form-group").removeClass("has-error"); // clear error class
    $(".help-block").empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
      url: CFG.url + "profile/ajax_edit_docente/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        
        $('[name="repeat_password"]').val("");

        $('[name="rol"]').val(data.id_rol);
        $('[name="cargo"]').val(data.id_cargo);

        $("#modal_confirmar").modal("show");
        $(".modal-title").text("Editar Docente");
        $("#btnSave").text("Actualizar");
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Error get data from ajax");
      }
    });
  }

  // function save_arbitro() {
  //   alert('asdfa');
  // }
</script>