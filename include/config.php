<?php

@session_start();

//Site Path
$sitePath = "localhost/samacharuk.in";

$protocol = stripos($_SERVER['SERVER_PROTOCOL'], 'https') === 0 ? 'https://' : 'http://';

$host = $_SERVER['HTTP_HOST'];

$hostProtocol = $protocol . $host;

//Server Root Path
$roothPath = $_SERVER['DOCUMENT_ROOT'];

//Set Default Time Zone
date_default_timezone_set('Asia/Kolkata');


if ($_SERVER['HTTP_HOST'] === 'localhost') {
    //Local Root URL
    define('URL','http://' . $host . '/sarif/clients/samacharuk');
}
else if ($host === 'samacharuk.in')
{
    //Remote Root URL
    define('URL','http://samacharuk.in');
}

function getDbName($host)
{
	$dbName = '';

	if ($host === 'localhost') 
    {		
		$dbName = 'samachar_uk';
	} 
    else if ($host === 'samacharuk.in') 
    {
		$dbName = 'samachar_uk';
	}

	return $dbName;
}

function getDbUserName($host)
{
	$dbUserName = '';

	if ($host === 'localhost') 
    {
		$dbUserName = 'root';
	} 
    else if ($host === 'samacharuk.in') 
    {
		$dbUserName = 'samacharukadminuser';
	}

	return $dbUserName;
}

function getDbPassword($host)
{
	$dbPassword = '';

	if ($host === 'localhost') 
    {
		$dbPassword = '';
	} 
    else if ($host === 'samacharuk.in') 
    {
		$dbPassword = 'P*KTI!mUIFW%';
	}

	return $dbPassword;
}

?>