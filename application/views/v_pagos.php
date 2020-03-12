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
					<div class="form-group">
						<label>Concepto</label>
						<select class="form-control" id="concepto" name="concepto" style="width: 100%;">
						<!-- <select class="form-control select2" id="concepto" name="concepto" style="width: 100%;"> -->
							<option value="-1">Seleccionar concepto...</option>
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
					
					<div class="form-group">
						<label>Monto</label>
						<!-- <select class="form-control select2" id="monto" name="monto" style="width: 100%;">
							<option value="-1">Seleccionar monto...</option>
						</select> -->
						<input class="form-control monto" type="input" name="monto" id="monto" value="">
						<input type="input" name="id_monto" id="id_monto">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Motivo</label>
						<select class="form-control" id="motivo" name="motivo" style="width: 100%;">
						<!-- <select class="form-control select2" id="motivo" name="motivo" style="width: 100%;"> -->
							<option value="-1">Seleccionar motivo...</option>
						</select>
					</div>
					<!-- <div class="form-group">
						<label>cantidad</label>
						<select class="form-control select2" id="cantidad" name="cantidad" style="width: 100%;">
							<option value="-1">Seleccionar categoria...</option>
						</select>
					</div> -->

				</div>
			</div>
		</div>
		</form>
		<div class="box-footer">
      <button type="submit" class="btn btn-info pull-right" onclick="pagar()">Pagar</button>
    </div>
	</div>
	
</section>

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

		$.get(CFG.url + 'planillero/get_motivo', function(data) {
			var datos = $.parseJSON(data);
			$.each(datos.motivo, function(index, val) {
				$('#motivo').append('<option value="'+val.id_motivo+'">'+val.descripcion+'</option>');
			});
		});


	});

	// function llamarfunciones() {
	// 	$.get(CFG.url + 'planillero/get_clubs', function(data) {
	// 		var datos = $.parseJSON(data);
	// 		$.each(datos.clubs, function(index, val) {
	// 			$('#club').append('<option value="'+val.id_club+'">'+val.nombre_club+'</option>');
	// 		});
	// 	});

	// 	$.get(CFG.url + 'planillero/get_concepto', function(data) {
	// 		var datos = $.parseJSON(data);
	// 		$.each(datos.conceptos, function(index, val) {
	// 			$('#concepto').append('<option value="'+val.id_concepto+'">'+val.nombre+'</option>');
	// 		});
	// 	});

	// 	$.get(CFG.url + 'planillero/get_motivo', function(data) {
	// 		var datos = $.parseJSON(data);
	// 		$.each(datos.motivo, function(index, val) {
	// 			$('#motivo').append('<option value="'+val.id_motivo+'">'+val.descripcion+'</option>');
	// 		});
	// 	});
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

	$('#categoria').change(function(e) {
	  var id_categoria = $('#categoria').val();
	  var id_concepto = $('#concepto').val();
	  $('#monto').empty();
	  $.ajax({
	    url: CFG.url + 'planillero/get_monto',
	    type: "POST",
	    cache: true,
	    data: {id_categoria: id_categoria, id_concepto:id_concepto},
	    success: function(data) {
	      var datos = $.parseJSON(data);
	      console.log(datos);
	      console.log(datos.monto);
	      if (!$.isEmptyObject(datos)) {
	      	$('#monto').val(datos.monto.precio);
	      	$('#id_monto').val(datos.monto.id_precioconcepto);
	      } else {
	        alert('El la categoria no tiene monto asignado.');
	      }
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	        alert('Error al obtener datos.');
	    }
	  });
	});

	function pagar() {
		$.ajax({
	    url: CFG.url + 'planillero/pagar',
	    type: "POST",
	    cache: true,
	    data: $("#form_pagos").serialize(),
	    success: function(data) {
	      var datos = $.parseJSON(data);
	      if (datos.status) {
	      	alert('datos guardados exitosamente.');
	      }
				$("#form_pagos")[0].reset();
				// window.location.replace(CFG.url+"planillero/pagos");
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	        alert('Error al obtener datos.');
	    }
	  });
	}


</script>