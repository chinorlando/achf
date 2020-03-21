<script>
    $(function () {
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
          checkboxClass: 'icheckbox_minimal-blue',
          radioClass: 'iradio_minimal-blue'
        });    
    });

    function editar_opciones(){
        var id_rol = $('select[name=usuarios]').val();
        var datos ={'id_rol':id_rol};
        $.ajax({
            data:datos,
            type:'POST',
            url:'<?php echo base_url()?>Menu_Opciones/menu_asignado',
            beforeSend:function(){},
            success:function(response){
                $('#opciones').html(response);
            }
        });
        //alert(id_persona_cargo);
    }
</script>
<section class="content" >

          <div class="row">
            <div class="col-md-12">
            <div class="box box-danger">
                <div class="box-header">
                  <h3 class="box-title"><b><?php echo $mensaje?></b></h3>
                </div>
            <div class="box-body">  
              <div class="form-group">

                        <select class="form-control select2" style="width: 100%;" name='usuarios' id='usuarios' OnChange="editar_opciones();">
                            <option value='-1'>Elija un usuario</option>
                            <?php foreach($datos as $d){ ?>
                                <option value='<?php echo $d->id; ?>'><?php echo $d->nombre_completo ?></option>
                            <?php } ?>
                        </select>
                        <div class="box-body">
                            <h3 class="box-title">Menús asignados</h3>
                        <span id='opciones'></span>
                        </div>

                    </div><!-- /.row -->
            </div>

            </div>
            </div>

</section><!-- /.content -->
