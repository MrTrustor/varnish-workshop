<html>
<head>
<title>OxaWorkshop - Vmods</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head>

<body>
<?php

session_start();
$_SESSION['active'] = "yes";
echo "Hello world!";

// Gestion du cache
$seconds_to_cache = 0;

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
