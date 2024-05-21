<?php
class connect
{
	function dbConnect(){
		$servername = "localhost";

		$username = "root";
		//$username = "khabarukadminuser";

		$password = "";
		//$password = "s5l8r{g@Fe-5";

		$dbname = "khabar_uk";

		$conn = mysqli_connect($servername, $username, $password, $dbname);
		
		return $conn;

		//mysqli_close($conn);
	}
	

	function runQuery($sql){
		$servername = "localhost";

		$username = "root";
		//$username = "khabarukadminuser";

		$password = "";
		//$password = "s5l8r{g@Fe-5";

		$dbname = "khabar_uk";

		$conn = mysqli_connect($servername, $username, $password, $dbname);	

		return mysqli_query($conn, $sql);

		mysqli_close($conn);
	}
}


?>