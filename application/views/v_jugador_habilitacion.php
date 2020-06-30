<section class="content">
	<div class="row">
		<?php echo $jugadores_equipo; ?>
	</div>
</section>

<script type="text/javascript">
	$(document).ready(function() {
		// $('.playered').change(function(e) {
		$('.playered').click(function(e) {
			// console.log(jQuery(this).attr('id_jug'));
			id_jugador = jQuery(this).attr('id_jug');
			id_partido = jQuery(this).attr('id_par');

			$.post(CFG.url+ 'planillero/verifica_habilitado_jugador',
				{id_jugador: id_jugador, id_partido: id_partido},
				function(data, textStatus, xhr) {
					if (data.status) {
						console.log(insertado)
					}
				}
			);
		});
	});
</script>