<span id="type-container" class=" hide">
    <span id="" class="type-row">
        <a class="remove-type" targetDiv="" data-id="0" href="javascript: void(0)" title="Anotar gol">
            <i class="text-black fa fa-fw fa-soccer-ball-o coso"></i>
        </a>
    </span>
</span>



<style>
  .coso:before{
    
    border-radius:50%;
    transform: scale (0);
  }
  .coso:hover:before{
    font-family: FontAwesome;
    content: "\f1f8 ";
    color:red;
    transform: scale (1);
    transition: .1s ease-in-out;
  }
</style>


<section class="content">
    <div class="row">
        <?php echo $jugadores_equipo1 ?>
    </div>
</section>


        <script>
            jQuery(document).ready(function () {
                var doc = $(document);
                // $(document).on("click", "td a.add-type", function(e){
                $('td a.add-type').on("click", function(e){
                    e.preventDefault();
                    var content = jQuery('#type-container .type-row'),
                        element = null;
                    for (var i = 0; i < 1; i++) {
                        element = content.clone();
                        var type_div = 'teams_' + jQuery.now();
                        element.attr('id', type_div);
                        element.find('.remove-type').attr('targetDiv', type_div);
                        valorDeId = jQuery(this).attr('id');
                        element.appendTo('.goal_container'+valorDeId);

                    }
                });

                $(document).on("click", 'a.remove-type', function(e){
                    var didConfirm = confirm("Are you sure You want to delete");
                    if (didConfirm == true) {
                        var id = jQuery(this).attr('data-id');
                        var targetDiv = jQuery(this).attr('targetDiv');
                        //if (id == 0) {
                        //var trID = jQuery(this).parents("tr").attr('id');
                        jQuery('#' + targetDiv).remove();
                        // }
                        return true;
                    } else {
                        return false;
                    }
                });

            });
        </script>
    
















<!-- <script src="<?php echo base_url(); ?>assets/customjs/formulario.js"></script>

<span class="edit_hover_class hide">
    <span id="" class="type-row">
        <a class="remove-type" targetDiv="" data-id="0" href="javascript: void(0)" title="Anotar gol">
            <i class="text-black fa fa-fw fa-soccer-ball-o"></i>
        </a>
    </span>
</span>






<section class="content">
    <div class="row">
        <?php echo $jugadores_equipo1 ?>
    </div>
</section>

<script type="text/javascript">
    
    
</script> -->


<!-- <script type="text/javascript">
    jQuery(document).ready(function () {
        var doc = $(document);
        jQuery('a.add-type').die('click').live('click', function (e) {
            e.preventDefault();
            alert('asdfasfda');
        });
        // $(".gol").click(function(){
        //     $(".aniadirgol").append('<span id="" class="edit_hover_class fa fa-fw fa-soccer-ball-o"><a href="javascript: void(0)" title="Anotar gol" onclick="eliminar_gol('++')"> <i class="text-danger fa fa-trash"></i> </a></span>');
        // });
    });

    /**
    * 1 amarilla
    * 2 roja
    * 3 gol
    */

    function anotar_gol(id_partido, id_jugador) {
        accion = 3;
        anotar_accion(id_partido, id_jugador, accion)
    }

    function anotar_accion(id_partido, id_jugador, accion) {
        $.ajax({
            url : "<?php echo base_url('planillero')?>"+'/guardar_accion',
            type: "POST",
            data: {id_partido: id_partido, id_jugador: id_jugador, accion: accion},
            dataType: "JSON",
            success: function(data){
                if(data.status) //if success close modal and reload ajax table
                {
                    console.log('Datos guardados correctamente');
                } else {
                    console.log('Datos no guardados');
                }
            },
            error: function (jqXHR, textStatus, errorThrown){
                alert('Error al añadir');
            }
        });
    }

    function eliminar_gol() {
        $.ajax({
            url : "<?php echo base_url('planillero')?>"+'/eliminar_accion',
            type: "POST",
            data: {id_partido: id_partido, id_jugador: id_jugador, accion: accion},
            dataType: "JSON",
            success: function(data){
                if(data.status) //if success close modal and reload ajax table
                {
                    console.log('Datos guardados correctamente');
                } else {
                    console.log('Datos no guardados');
                }
            },
            error: function (jqXHR, textStatus, errorThrown){
                alert('Error al añadir');
            }
        });
    }
</script> -->
    

















<!-- <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.container {
  position: relative; 
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .3s ease;
  
}

.container:hover .overlay {
  opacity: 1;
}

.icon {
  color: red;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}


</style>
</head>
<body>

  <span class="container fa fa-fw fa-soccer-ball-o">
  <div class="overlay">
    <a href="#" class="icon" title="User Profile">
      <i class="fa fa-trash"></i>
    </a>
  </div>
  </span>


</body>
</html>
 -->