    <!-- <link rel="stylesheet" href="<?php echo base_url() ?>assets/eso/style.css"> -->
    <!-- <link rel="stylesheet" href=" docsupport/prism.css"> -->
    <!-- <link rel="stylesheet" href="<?php echo base_url() ?>assets/eso/chosen.css">

    <script src="<?php echo base_url() ?>assets/eso/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url() ?>assets/eso/chosen.jquery.js" type="text/javascript"></script>
    <script src="<?php echo base_url() ?>assets/eso/prism.js" type="text/javascript" charset="utf-8"></script>
    <script src="<?php echo base_url() ?>assets/eso/init.js" type="text/javascript" charset="utf-8"></script> -->
    


    <section class="content">
      <div class="row">
        <?php echo $jugadores_equipo1 ?>
      </div>
    </section>



<script type="text/javascript">
  $('.player').change(function(e) {
    var list_id = [];
    id_jugador = jQuery(this).attr('id_jug');
    id_partido = jQuery(this).attr('id_par');
    accion = jQuery(this).attr('accion');
    if (accion == 1) {
      $(".player_"+id_jugador+" option:selected").each(function() {
        list_id.push(this.value);
    });
  } else if (accion == 2) {
      $(".player_r_"+id_jugador+" option:selected").each(function() {
        list_id.push(this.value);
    });
  } else {
      $(".player_g_"+id_jugador+" option:selected").each(function() {
        list_id.push(this.value);
    });
  }


  // console.log(id_jugador);
  // console.log(id_partido);
  // console.log(accion);

  $.post(CFG.url+ 'planillero/verifica_siyaexiste',
      {id_jugador: id_jugador, id_partido: id_partido, accion: accion},
      function(data, textStatus, xhr) {
        var tr = $.parseJSON(data);

       //  if (tr.cant_amari>list_id.length) {
       //     console.log('eliminar');
       //     console.log(tr.cant_amari);
       //     console.log(list_id.length);
       // } else {
       //     console.log('añadir');
       //     console.log(tr.cant_amari);
       //     console.log(list_id.length);
       // }

       if (tr.cant_amari>list_id.length) {
        console.log('eliminar');
        $.ajax({
          url: CFG.url+'planillero/eliminar_accion',
          type: "POST",
          cache: true,
          data: {id_jugador: id_jugador, id_partido: id_partido, accion: accion},
          success: function(data) {
            var vf = $.parseJSON(data);
            console.log(vf.status);
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error al obtener datos.');
        }
    });
    } else {
        console.log('añadir');
        $.ajax({
          url: CFG.url + 'planillero/guardar_accion',
          type: "POST",
          cache: true,
          data: {id_jugador: id_jugador, id_partido: id_partido, accion: accion},
          success: function(data) {
            var vf = $.parseJSON(data);
            console.log(vf.status);
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error al obtener datos.');
        }
    });
    }
});
});
</script>

<!-- <script>

    $(document).ready(function(){
        $('.chosen-select').change(function(e) {
          console.log('asdfasdfasdfa');

          var list_id = [];
          $(".chosen-select option:selected").each(function() {
            list_id.push(this.value);
        });
          id_jugador = jQuery(this).attr('id_jug');
          id_partido = jQuery(this).attr('id_par');
          accion = jQuery(this).attr('accion');
          console.log(id_jugador);
          console.log(id_partido);
          console.log(accion);

          $.post(CFG.url+ 'planillero/verifica_siyaexiste',
            {id_jugador: id_jugador, id_partido: id_partido, accion: accion},
            function(data, textStatus, xhr) {
                var tr = $.parseJSON(data);
                if (tr.cant_amari>list_id.length) {
                    console.log('eliminar');
                    $.ajax({
                        url: CFG.url+'planillero/eliminar_accion',
                        type: "POST",
                        cache: true,
                        data: {id_jugador: id_jugador, id_partido: id_partido, accion: accion},
                        success: function(data) {
                            console.log(!tr.status);
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            alert('Error al obtener datos.');
                        }
                    });
                } else {
                    console.log('añadir');
                    $.ajax({
                        url: CFG.url + 'planillero/aniadir',
                        type: "POST",
                        cache: true,
                        data: {list_id: list_id},
                        success: function(data) {
                            console.log(!tr.status);
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            alert('Error al obtener datos.');
                        }
                    });
                }
            });
      });
    });

</script> -->

