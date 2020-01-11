<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<?php
	foreach($css_files as $file): ?>
		<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
	<?php endforeach; ?>
	<?php foreach($js_files as $file): ?>
		<script src="<?php echo $file; ?>"></script>
	<?php endforeach; ?>
    <script>
        $(document).ready(function()
        {
            $( ".datepicker-input" ).datepicker( "option", "yearRange", "-99:+0" );
            $( ".datepicker-input" ).datepicker( "option", "maxDate", "+1m +0d" );
            $( ".datepicker-input" ).keypress(function (evt) {  return false; });
        });
    </script>
</head>

<body>
<div style='height:20px;'></div>
<div>
	<?php echo $output; ?>
</div>
</body>
</html>