<html>
<head>
<title>OxaWorkshop - Sessions</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
$(document).ready(function () {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("count").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "ajax.php", true);
	xmlhttp.send();
})
</script>

</head>

<body>
<?php

// Simulation d'un gros script PHP
sleep(2);

echo "You have been <span id='count'>...</span> times on this page!";

// Gestion du cache
$seconds_to_cache = 60;

if ( $seconds_to_cache > 0 ) {
	$ts = gmdate("D, d M Y H:i:s", time() + $seconds_to_cache) . " GMT";
	header("Expires: $ts");
	header("Pragma: cache");
	header("Cache-Control: max-age=$seconds_to_cache");
} else {
	$ts = gmdate("D, d M Y H:i:s") . " GMT";
	header("Expires: $ts");
	header("Last-Modified: $ts");
	header("Pragma: no-cache");
	header("Cache-Control: no-cache, must-revalidate");
}

?>
</body>
</html>
