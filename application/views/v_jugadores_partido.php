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
		<?php echo $amarillas ?>
	</div>
</section>


<div class="modal fade" id="modal-amarillas">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Default Modal</h4>
				</div>
				<?php echo form_open("#", array('id'=>'form_amarillas_jugador', "method"=>"POST")); ?>
				<div class="modal-body">
					<div id="amarillas"></div>
				</div>
			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
				<button type="button" class="btn btn-primary refrescar" onclick="update_yellow_player()">Pagar amarillas</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">

	$(document).ready(function() {

		$(document).on('click keyup','.amarilla_check',function() {
			
			calcularPagoAmarilla();

			// salto_5_10 = $(this).parent().parent().next().next().children().children().next().next();
			// corto = $(this).parent().parent().next().children().children().next().next();
			// if(!$(this).is(":checked")){
			// 	if (jQuery(corto).attr("nopaga") == "nopaga") {
			// 		salto_5_10.prop('checked', false);
			// 		salto_5_10.prop('disabled', true);
			// 	} else {
			// 		corto.prop('checked', false);
			// 		corto.prop('disabled', true);
			// 	}
		 //  	} else {
			//   	if (jQuery(corto).attr("nopaga") == "nopaga") {
			// 		salto_5_10.prop('disabled', false);
			// 	} else {
			// 		corto.prop('disabled', false);
			// 	}
			// }
		});

	});


	$('.player').change(function(e) {
		var list_id = [];
		id_jugador = jQuery(this).attr('id_jug');
		id_partido = jQuery(this).attr('id_par');
		accion = jQuery(this).attr('accion');
		if (accion == 1) {
			$(".player_"+id_jugador+" option:selected").each(function() {
				list_id.push(this.value);
				ye = list_id.length;
				console.log(list_id.length);
				if (ye==2) {
					$(".player_g_"+id_jugador).prop('disabled', true);
					$('.player_r_'+id_jugador+' :nth-child(1)').prop('selected', true);
					$(".player_r_"+id_jugador).select2({});
					aniadir_accion(id_jugador, id_partido, 2);
				} else {
					$(".player_g_"+id_jugador).prop('disabled', false);
				}
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
							var vf = $.parseJSON(data);
							console.log(vf.status);
						},
						error: function (jqXHR, textStatus, errorThrown)
						{
							alert('Error al anular.');
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
							alert('Error al anotar acción.');
						}
					});
				}
			});
	});


	// pago de amarillas desde el planillero, desde el partido
	function calcularPagoAmarilla() {
		var tot = $('#monto_pagar');
		tot.val(0);
		$('.amarilla_check').each(function() {
			if (!$(this).is(':disabled') ) {
				if($(this).hasClass('amarilla_check')) {
					// para el check habilitar o deshabilitar al pagar amarilla
					if($(this).is(':checked')){
						$(this).parent().prev().prop('checked', 'true');
					} else {
						$(this).parent().prev().removeAttr('checked');
					}

					tot.val(($(this).is(':checked') ? parseFloat($(this).attr('tu-attr-precio')) : 0) + parseFloat(tot.val()));  
				}
				else {
					tot.val(parseFloat(tot.val()) + (isNaN(parseFloat($(this).val())) ? 0 : parseFloat($(this).val())));
				}
			}
		});
		var totalParts = parseFloat(tot.val()).toFixed(2).split('.');
		tot.val(totalParts[0].replace(/\B(?=(\d{3})+(?!\d))/g, "") + '.' +  (totalParts.length > 1 ? totalParts[1] : '00'));  
	}


	function aniadir_accion(id_jugador, id_partido, accion) {
		$.ajax({
			url: CFG.url + 'planillero/guardar_accion',
			type: "POST",
			cache: true,
			data: {id_jugador: id_jugador, id_partido: id_partido, accion: accion},
			success: function(data) {
				var vf = $.parseJSON(data);
				console.log(vf.status);
						// $('.player_r_'+id_jugador+' option[value=1]').prop('selected', 'selected');
						// $selectedOptions.prop("checked", true);
						// $(".player_r_"+id_jugador).prop("checked", true);
						// $('.player_r_'+id_jugador+' select option[value="1"]').prop("selected", true);
						// $(".player_r_"+id_jugador+" option:selected").attr("selected", true);
						// console.log($(".player_r_"+id_jugador+" option:selected").attr("selected", true));
					},
					error: function (jqXHR, textStatus, errorThrown)
					{
						alert('Error al obtener datos.');
					}
				});
	}


	function finalizar_partido(id_partido, id_e1, id_e2) {
		// alert(id_partido+'-'+id_e1+'-'+id_e2);
		$.ajax({
			type: "POST",
			data: {id_partido:id_partido, id_e1:id_e1, id_e2:id_e2},
			url: CFG.url+'planillero/end_partido',
			dataType: "JSON",
			success: function(data)
			{
				if (data.status) {
					alert('Se finalizó el partido.');
					// $(".partido_vs").prop('disabled', true);
					// $("td>select").attr("disabled", !$(this).prop("checked"));
					$("td>select").attr("disabled", true);
				}

			},
			error: function (jqXHR, textStatus, errorThrown)
			{
				alert('Error al intentar finalizar partido');
			}
		});
	}


	///////////////////// pago de amarillas ////////////////////////////////
	function mostrar_amarillas(id_jugador, id_partido) {
		// alert('message?: DOMString');
		// $('#id_materia').val(id);
		$.ajax({
			url : CFG.url + 'planillero/list_yellow_cards/',
			type: 'POST',
			dataType: 'JSON',
			data: {id_jugador: id_jugador, id_partido: id_partido},
		})
		.done(function(data) {
			$('#amarillas').html(data);
		})
		.fail(function() {
			console.log("Error al obtener las amarillas.");
		});
	}

	function update_yellow_player()
	{
		$.ajax({
			url: CFG.url +"planillero/update_yellow",
			type: "POST",
			cache: false,
			dataType: 'JSON',
			data: new FormData($('#form_amarillas_jugador')[0]),
			contentType: false,
			processData: false,
			success: function(data)
			{
				if(data.status) {
					$('#modal-amarillas').modal('hide');
				} else {
					$('#modal-amarillas').modal('show');
					alert('Debe seleccionar por lo menos una opción.');
				}
				// aqui debemos actualizar los datos 
				// $('#modal-amarillas').modal('hide');
			},
			error: function (jqXHR, textStatus, errorThrown)
			{
				alert('Error al guardar datos.');
				// $('#modal-amarillas').modal('hide');
			}
		});
	}

	///////////////////// pago de amarillas ////////////////////////////////


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

