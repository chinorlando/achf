<section class="content">
	
	<div class="box box-default">
		<div class="box-header with-border">
			<h3 class="box-title">Pagos por concepto</h3>
			<div class="box-tools pull-right">
				<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
				<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
			</div>
		</div>
		<form id="form_pagos">
		<div class="box-body">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Club</label>
						<select class="form-control" id="club" name="club" style="width: 100%;">
						<!-- <select class="form-control select2" id="club" name="club" style="width: 100%;"> -->
							<option value="-1">Seleccionar club...</option>
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Categoria</label>
						<select class="form-control" id="categoria" name="categoria" style="width: 100%;">
						<!-- <select class="form-control select2" id="categoria" name="categoria" style="width: 100%;"> -->
							<option value="-1">Seleccionar categoria...</option>
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Concepto</label>
						<select class="form-control" id="concepto" name="concepto" style="width: 100%;">
						<!-- <select class="form-control select2" id="concepto" name="concepto" style="width: 100%;"> -->
							<option value="-1">Seleccionar concepto...</option>
						</select>
					</div>
				</div>

					<div class="cant_amarillas">
					</div>

				<div class="col-md-12">
					<div class="form-group">
						
						<div id="switch_motivo">
							<!-- <select class="form-control" id="motivo" name="motivo" style="width: 100%;">
								<option value="-1">Seleccionar motivo...</option>
							</select> -->
						</div>
					</div>
				</div>
				<div class="col-md-6" id="input_ocultar_mostrar">
					<div class="form-group">
						<label>Monto</label>
						<!-- <select class="form-control select2" id="monto" name="monto" style="width: 100%;">
							<option value="-1">Seleccionar monto...</option>
						</select> -->
						<input class="form-control monto" type="input" name="precio_motivo_total" id="precio_motivo_total" value="momomomomomo" readonly>
						<!-- <input type="input" name="id_monto" id="id_monto" hidden="hidden"> -->
					</div>
				</div>
				

				<!-- <div id="campo_motivo">
					<div class="col-md-6">
						<div class="content-group-lg panel panel-body border-top-success">
							<h6 class="text-semibold">PAGO POR VALORES </h6>
							<div id="subreclamohtml" name="subreclamohtml" class="checkbox checkbox-switchery switchery-lg">
							</div>
						</div>
					</div>
				</div> -->

			</div>
		</div>
		</form>
		<div class="box-footer">
	  <button type="submit" class="btn btn-info pull-right" onclick="pagar_concepto()">Pagar</button>
	</div>
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
				<button type="button" class="btn btn-primary refrescar" onclick="update_yellow_player_conceto()">Pagar amarillas</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		$.get(CFG.url + 'planillero/get_clubs', function(data) {
			var datos = $.parseJSON(data);
			$.each(datos.clubs, function(index, val) {
				$('#club').append('<option value="'+val.id_club+'">'+val.nombre_club+'</option>');
			});
		});

		$.get(CFG.url + 'planillero/get_concepto', function(data) {
			var datos = $.parseJSON(data);
			$.each(datos.conceptos, function(index, val) {
				$('#concepto').append('<option value="'+val.id_concepto+'">'+val.nombre+'</option>');
			});
		});


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
		 //  	}
		});

		$(document).on('click keyup','.monto_motivo',function() {
			calcularMotivoConcepto();
		});

		// la opcion 3 para valores 
		$(document).on('click keyup','.concepto_valores',function() {
			calcularMotivoconceptoValores();
		});
		$(document).on('change','.concepto_valores',function() {
			calcularMotivoconceptoValores();
		});
		// $('.concepto_valores').change(function(e) {
		// 	alert('change');
		// });

		// $('.concepto_valores').click(function(){
		// 	alert('click');
		// });
		// $('#cantidad_concepto').keypress(function( event ) {
		//   if ( event.which == 38 ) {
		//      event.preventDefault();
		//      alert('arriba');
		//   }
		//   if ( event.which == 40 ) {
		//      event.preventDefault();
		//      alert('abajo');
		//   }
		//   if ( event.which == 13 ) {
		//      event.preventDefault();
		//      alert('enter');
		//   }
		// });

		$(".cantidad_num").keydown(function(e) {
             
            //13 es el código de la tecla
            if(e.which == 38) {
                  alert('Has pulsado enter!');
            }
 
      	});

      	$(document).on('click keyup','.cantidad_num',function() {
			calcularMotivoconceptoValores();
		});



		


	});

	function calcularMotivoconceptoValores(argument) {
		var tot = $('#precio_motivo_total');
		tot.val(0);
		$('.concepto_valores').each(function() {
			if (!$(this).is(':disabled') ) {
				// m_p ->ubicamos el input cantidad, val_inp_cant-> valor del imput cantidad, ->rp- resultado total de cada elemento seleccionado, 
				var m_p = $(this).parent().parent().parent().next().children();
				var val_inp_cant = parseFloat($(this).parent().next().val());
				var rp = parseFloat($(this).attr('tu-attr-precio')) * val_inp_cant;
				if (isNaN(rp)) {
					m_p.text('0');
				} else {
					m_p.text(rp);
				}
				
				if($(this).hasClass('concepto_valores')) {
					
					$(this).is(':checked') ? parseFloat(rp) : 0;
					if ($(this).is(':checked')) {
						valor_multiplicado = parseFloat(rp);
						$(this).parent().next().removeAttr('disabled');

						// checkbox oculto
						$(this).parent().prev().prop('checked', 'true');

					} else {
						valor_multiplicado = 0;
						m_p.text('0');
						$(this).parent().next().attr('disabled', 'true');

						// checkbox oculto
						$(this).parent().prev().removeAttr('checked');

					}
					tot.val((valor_multiplicado) + parseFloat(tot.val()));  
				}
				else {
					tot.val(parseFloat(tot.val()) + (isNaN(parseFloat($(this).val())) ? 0 : parseFloat($(this).val())));
				}
			} else {
				$(this).parent().next().removeAttr('disabled')
			}
		});
		var totalParts = parseFloat(tot.val()).toFixed(2).split('.');
		tot.val(totalParts[0].replace(/\B(?=(\d{3})+(?!\d))/g, "") + '.' +  (totalParts.length > 1 ? totalParts[1] : '00'));  
	}

	function calcularMotivoConcepto(argument) {
		var tot = $('#precio_motivo_total');
		tot.val(0);
		$('.monto_motivo').each(function() {
			if (!$(this).is(':disabled') ) {
				if($(this).hasClass('monto_motivo')) {
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

	// function llamarfunciones() {
	//  $.get(CFG.url + 'planillero/get_clubs', function(data) {
	//      var datos = $.parseJSON(data);
	//      $.each(datos.clubs, function(index, val) {
	//          $('#club').append('<option value="'+val.id_club+'">'+val.nombre_club+'</option>');
	//      });
	//  });

	//  $.get(CFG.url + 'planillero/get_concepto', function(data) {
	//      var datos = $.parseJSON(data);
	//      $.each(datos.conceptos, function(index, val) {
	//          $('#concepto').append('<option value="'+val.id_concepto+'">'+val.nombre+'</option>');
	//      });
	//  });

	//  $.get(CFG.url + 'planillero/get_motivo', function(data) {
	//      var datos = $.parseJSON(data);
	//      $.each(datos.motivo, function(index, val) {
	//          $('#motivo').append('<option value="'+val.id_motivo+'">'+val.descripcion+'</option>');
	//      });
	//  });
	// }

	$('#club').change(function(e) {
	  var id_club = $('#club').val();
	  $('#categoria').empty();
	  $.ajax({
		url: CFG.url + 'planillero/get_categoria_by_club',
		type: "POST",
		cache: true,
		data: {id_club: id_club},
		success: function(data) {
		  var datos = $.parseJSON(data);
		  if (!$.isEmptyObject(datos.categorias)) {
			$('#categoria').append('<option value="-1">Seleccionar categoria...</option>');
					$.each(datos.categorias, function(index, val) {
				  $('#categoria').append('<option value="'+val.id_categoria+'">'+val.nombre+'</option>');
				});;
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

	// $('#categoria').change(function(e) {
	//   var id_categoria = $('#categoria').val();
	//   var id_concepto = $('#concepto').val();
	//   $('#monto').empty();
	//   $.ajax({
	//  url: CFG.url + 'planillero/get_monto',
	//  type: "POST",
	//  cache: true,
	//  data: {id_categoria: id_categoria, id_concepto:id_concepto},
	//  success: function(data) {
	//    var datos = $.parseJSON(data);
	//    console.log(datos);
	//    // console.log(datos.monto);
	//    if (!$.isEmptyObject(datos)) {
	//      // $('#monto').val(datos.monto.precio);
	//      $('#id_monto').val(datos.monto.id_precioconcepto);
	//    } else {
	//      alert('El la categoria no tiene monto asignado.');
	//    }
	//  },
	//  error: function (jqXHR, textStatus, errorThrown)
	//  {
	//      alert('Error al obtener datos.');
	//  }
	//   });
	// });

	$('#concepto').change(function(e) {
		$('#precio_motivo_total').val('0.00');
		var id_concepto = $('#concepto').val();
		var id_categoria = $('#categoria').val();
		var id_club = $('#club').val();
		if (id_concepto == 7) {
			$('#input_ocultar_mostrar').hide();
		} else {
			$('#input_ocultar_mostrar').show();
		}
		$.post('<?php echo base_url('planillero/get_valores') ?>',
			{id_concepto: id_concepto, id_categoria: id_categoria, id_club: id_club}, 
			function(data, textStatus, xhr) {
				var sr = $.parseJSON(data);
				// console.log(sr);
				$('#switch_motivo').html(sr);
			}
		);
	});


	// $('#concepto').change(function(e) {
	//   var id_concepto = $('#concepto').val();
	//   console.log(id_concepto);
	//   switch (id_concepto){
	//      case '3':
	//          $('#motivo').empty();
	//   //     $.get(CFG.url + 'planillero/get_motivo', function(data) {
	//      //  var datos = $.parseJSON(data);
	//      //  $('#motivo').append('<option value="-1">Seleccionar motivo...</option>');
	//      //  $.each(datos.motivo, function(index, val) {
	//      //      $('#motivo').append('<option value="'+val.id_motivo+'">'+val.descripcion+'</option>');
	//      //  });
	//      // });

	//      // estasmo insertadndo este codigo desde esta linea
	//      $.post('<?php echo base_url('planillero/get_valores') ?>',
	//          {id_concepto: id_concepto}, 
	//          function(data, textStatus, xhr) {
	//              var sr = $.parseJSON(data);
	//              console.log(sr);
	//              var textohtml = '';
	//              $.each(sr, function(index, val) {
	//                  textohtml+=
	//                  '<label>'+
	//                      '<input id="motivo" name="motivo[]" value="'+val.id_motivo+'" type="checkbox" class="switchery" >'+
	//                      val.descripcion+
	//                  '</label><br>';
	//              });
	//              $('#switch_motivo').html(textohtml);
	//          }
	//      );
	//      $('.cant_amarillas').html('');
	//      break;
	//  case '7':
	//      $.get(CFG.url + 'planillero/get_cantidad_amarillas', function(data) {
	//          var datos = $.parseJSON(data);
	//          $('.cant_amarillas').html(datos.html);
	//      });
	//      default:
	//          // $('#motivo').empty();
	//          var valorhtml = '';
	//      valorhtml += '<select class="form-control" id="motivo" name="motivo" style="width: 100%;">'+
	//          '<option value="-1">Seleccionar motivo...</option>'+
	//          '<option value="1">PAGO POR CONCEPTO</option>'+
	//      '</select>';
	//      $('#switch_motivo').html(valorhtml);

	//      // para limpiar el campo de amarillas 
	//      $('.cant_amarillas').html('');
	//      break;
	//   }

	//   // if (id_concepto != 3) {
	//   //     $('#motivo').empty();
	//   //     $('#motivo').append('<option value="-1">Seleccionar motivo...</option>');
	//   //     $('#motivo').append('<option value="1">PAGO POR CONCEPTO</option>');
	//   // } else {
	//   //     $('#motivo').empty();
	//   //     $.get(CFG.url + 'planillero/get_motivo', function(data) {
	//      //  var datos = $.parseJSON(data);
	//      //  $('#motivo').append('<option value="-1">Seleccionar motivo...</option>');
	//      //  $.each(datos.motivo, function(index, val) {
	//      //      $('#motivo').append('<option value="'+val.id_motivo+'">'+val.descripcion+'</option>');
	//      //  });
	//      // });
	//   // }
	// });

	

	function pagar_concepto() {
		$.ajax({
		url: CFG.url + 'planillero/ajax_pagar_concepto',
		type: "POST",
		cache: true,
		data: $("#form_pagos").serialize(),
		success: function(data) {
		  var datos = $.parseJSON(data);
		  if (datos.status) {
			alert('Datos guardados exitosamente.');
		  } else {
		  	alert('Debe seleccionar por lo menos una opción.')
		  }
		},
		error: function (jqXHR, textStatus, errorThrown)
		{
			alert('Error al guardar datos.');
		}
	  });
	}

	///////////////////// pagos de concepto////////////////////////////////
	function mostrar_amarillas_concepto(id_jugador, id_partido) {
		// alert('message?: DOMString');
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

	function update_yellow_player_conceto(argument) {
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
				// $('#modal-amarillas').modal('hide');
			},
			error: function (jqXHR, textStatus, errorThrown)
			{
				alert('Error al guardar paralelos.');
				// $('#modal-amarillas').modal('hide');
			}
		});
	}

	// funcion que se llama desde el pagos de conceptos 
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
				// $('#modal-amarillas').modal('hide');
			},
			error: function (jqXHR, textStatus, errorThrown)
			{
				alert('Error al guardar paralelos.');
				// $('#modal-amarillas').modal('hide');
			}
		});
	}
	///////////////////// pagos de concepto ////////////////////////////////


</script>