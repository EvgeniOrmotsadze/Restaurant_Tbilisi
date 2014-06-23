<!DOCTYPE html>
<html>
<head>
<title>---</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('img').click(function() {
			if ($(this).hasClass('pop')) {
				$(this).animate({height: '100px'}, function	() {$('img').not($(this)).show();});
				$(this).removeClass('pop');
			} else {
				$(this).animate({height: '300px'});
				$('img').not($(this)).hide();
				$(this).addClass('pop');
			}
		});
	});
</script>
<style>
img {height: 100px;}
</style>
</head>
<body>
	
<img src="data:image/gif;base64, " alt="" /> //waiting photo source
<img src="data:image/gif;base64, " alt="" />
<img src="data:image/gif;base64, " alt="" />
<img src="data:image/gif;base64, " alt="" />
<img src="data:image/gif;base64, " alt="" />
<img src="data:image/gif;base64, " alt="" />

</body>
</html>