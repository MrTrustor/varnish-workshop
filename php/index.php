<html>
<head>
<title>OxaWorkshop - Sessions</title>
</head>

<body>
<?php

// Simulation d'un gros script PHP
sleep(2);

// On fait des choses avec les sessions
session_start();
if (!isset($_SESSION['count'])) {
  $_SESSION['count'] = 1;
} else {
  $_SESSION['count']++;
}
echo "You have been ".$_SESSION['count']." times on this page!";

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
