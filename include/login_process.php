<?php 
require_once "common.php";

if(isset($_POST['login']))
{
	$array['user_name'] = $_POST['user_name'];
	$array['password'] = $_POST['password'];
	
	$status=$admin->login($array);
	
	if($status)
	{	//success
	}
	else
	{	//failed
	}

	header("Location: news-login?state=$status");
}    
?>