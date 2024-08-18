<?php
	require_once "config.php";

	$dbConnection = mysqli_connect("localhost", getDbUserName($_SERVER['HTTP_HOST']), getDbPassword($_SERVER['HTTP_HOST']), getDbName($_SERVER['HTTP_HOST']));

	mysqli_set_charset($dbConnection, 'utf8');

	if (!$dbConnection) {
		die('I cannot connect to the database because: ' . mysqli_connect_error());
	}

	if (!mysqli_select_db($dbConnection, getDbName($_SERVER['HTTP_HOST']))){
		echo "Unable to select the database";
	}
?>