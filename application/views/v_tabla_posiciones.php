<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">Tabla de posiciones</h3>

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
                <th>Club</th>
                <th>PJ</th>
                <th>G</th>
                <th>E</th>
                <th>P</th>
                <th>GF</th>
                <th>GC</th>
                <th>DG</th>
                <th>Pts</th>
              </tr>
              </thead>
              <tbody>
                <?php $i = 1 ?>
                <?php foreach ($tablas_posiciones as $equipo): ?>
                  <tr>
                    <td><?php echo $i++; ?></td>
                    <td><a href="#"><?php echo $equipo->equipo; ?></a></td>
                    <td><?php echo $equipo->PJ; ?></td>
                    <td><?php echo $equipo->G; ?></td>
                    <td><?php echo $equipo->E; ?></td>
                    <td><?php echo $equipo->P; ?></td>
                    <td><?php echo $equipo->GF; ?></td>
                    <td><?php echo $equipo->GC; ?></td>
                    <td><?php echo $equipo->GD; ?></td>
                    <td><?php echo $equipo->Pts; ?></td>
                  </tr>
                <?php endforeach ?>
              </tbody>
            </table>
          </div>
          <!-- /.table-responsive -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
          <!-- <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
          <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a> -->
        </div>
        <!-- /.box-footer -->
      </div>
    </div>
  </div>
</section>