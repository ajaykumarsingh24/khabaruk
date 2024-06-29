<?php
class connect
{
	function dbConnect(){
		$servername = "localhost";

		//$username = "root";
		$username = "samacharukadminuser";

		//$password = "";
		$password = "P*KTI!mUIFW%";

		//$dbname = "khabar_uk";
		$dbname = "samachar_uk";

		$conn = mysqli_connect($servername, $username, $password, $dbname);

		mysqli_set_charset($conn, 'utf8');
		
		return $conn;

		//mysqli_close($conn);
	}
	

	function runQuery($sql){
		$servername = "localhost";

		//$username = "root";
		$username = "samacharukadminuser";

		//$password = "";
		$password = "P*KTI!mUIFW%";

		//$dbname = "khabar_uk";
		$dbname = "samachar_uk";

		$conn = mysqli_connect($servername, $username, $password, $dbname);	
		
		mysqli_set_charset($conn, 'utf8');

		return mysqli_query($conn, $sql);

		mysqli_close($conn);
	}
}


?>