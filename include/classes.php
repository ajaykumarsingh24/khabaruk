<?php require_once 'connection.php'; 

class admin
{
	function getDateFormat($dateValue)
	{
		$date = date_create($dateValue);			
		return date_format($date,"d M Y");
	}

	function addNews($values)
	{
		$title = $values["title"];
		$date = $values["date"];

		$file_1 = $values["file_1"];
		$file_2 = $values["file_2"];
		$file_3 = $values["file_3"];

		$newsSql = "CALL addNews('" .  $title . "', '" .  $date . "', '" .  $file_1 . "', '" .  $file_2 . "', '" .  $file_3 . "')";			
		return $this->query($newsSql);
	}

	function getAllNews()
	{
		$sql = "CALL getAllNews()";
		$ret = $this->query($sql);  

		while($row = $this->fetcharray($ret)) {
			
			echo '<div class="efm-col-12 wow fadeInLeft animated">';			
			echo '<img src="' . URL . '/assets/images/'. $row['image_url'] . '" style="width: 300px;">';			
			echo '</div>';

			
		}
	}

	function login($auth)
	{
		$sql = "CALL checkUserLogin('" . $auth['user_name'] . "')";

		$ret = $this->query($sql);
		$row = $this->fetcharray($ret);
		$num = $this->numrow($ret);

		$userPass = $auth['password'];
		$saltPass = $row['salt'];

		$saltPassword = hash_hmac("sha256", $userPass, $saltPass);
		

		if(($row['user_name']==$auth['user_name'] OR $row['email']==$auth['user_name']) && ($row['password']==$saltPassword) && $num==1 )
		{
			$_SESSION['user_id']=$row['id'];
			$_SESSION['login_user']=$row['user_name'];
			$_SESSION['login_email']=$row['email'];

			echo "<script>window.location.href = 'news';</script>";	

			exit;
		}
		else
		{
			echo "<script>window.location.href = 'site-login?state=failed';</script>";
			exit;
		}
	}

	function dbConnection(){
		$connect = new connect();
		return $connect->dbConnect();
	}

	function fetcharray($sql)
	{
		return mysqli_fetch_array($sql);
	}

	function query($sql)
	{
		$connect = new connect();
		return $connect->runQuery($sql);
	}

	function fetchrow($ret)
	{
		return mysqli_fetch_row($ret);
	}

	function fetchstring($ret)
	{
		return mysqli_fetch_assoc($ret);
	}

	function numrow($ret)
	{
		return mysqli_num_rows($ret);
	}
}
	
?>