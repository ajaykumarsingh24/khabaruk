<?php

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
		$description = $values["description"];
		$category = $values["category"];

		$file = $values["file"];

		$newsSql = "CALL addNews('" .  $title . "', '" .  $date . "', '" .  $file . "', '" .  $description . "', $category)";			
		return $this->query($newsSql);
	}

	function getMenus()
	{
		$sql = "CALL getMenus()";
		$ret = $this->query($sql);  

		if(isset($_GET['tabId'])){
			$tabClickId = $_GET['tabId'];
		}else{
			$tabClickId = 0;
		}

		while($row = $this->fetcharray($ret)) {                        
			echo $tabClickId && $tabClickId == $row['id'] ? '<li class="active">' : '<li>';
			echo '<a href="' . $row['id'] . '">' . $row['title'] . '</a>';
			echo '</li>';
		}
	}

	function getAllNews()
	{
		$sql = "CALL getAllNews()";
		$ret = $this->query($sql);  

		while($row = $this->fetcharray($ret)) {
			echo '<div class="single_iteam">';
			echo '<a href="' . $row['id'] . '">';
			echo '<img src="assets/images/' . $row['large_image_url'] .  '" alt="">';
			echo '</a>';
			echo '<div class="slider_article">';
			echo '<h2><a class="slider_tittle" href="pages/single_page.html">' . $row['title'] . '</a></h2>';			
			echo '</div>';
			echo '</div>';
		}
	}

	function getPostDetails()
	{
		$sql = "CALL getPostDetails(" . $_GET['postId'] .")";
		$ret = $this->query($sql);  

		while($row = $this->fetcharray($ret)) {			
			echo '<h1>' . $row['title'] . '</h1>';
			echo '<div class="post_commentbox">';
			echo '<a href="#"><i class="fa fa-user"></i>Wpfreeware</a>';
			echo '<span>';
			echo '<i class="fa fa-calendar"></i>6:49 AM';
			echo '</span>';
			echo '<a href="#">';
			echo '<i class="fa fa-tags"></i>Technology';
			echo '</a>';
			echo '</div>';
			echo '<div class="single_page_content">';
			echo '<img class="img-center" src="assets/images/' . $row['small_image_url'] . '" alt="">';
			echo $row['description'];
			echo '</div>';
		}
	}


	function getPostMediaShare()
	{
		$sql = "CALL getPostDetails(" . $_GET['postId'] .")";
		$ret = $this->query($sql);  

		while($row = $this->fetcharray($ret)) {
			echo '<li><a target="_blank" href="#"><i class="fa fa-facebook"></i></a></li>';
			echo '<li><a target="_blank" href="#"><i class="fa fa-twitter"></i></a></li>';
			echo '<li><a target="_blank" href="https://api.whatsapp.com/send?text=' .  $row['title'] . '"><i class="fa fa-whatsapp"></i></a></li>';
		}
	}

	function getMenuTitle()
	{
		$sql = "CALL getMenuTitle(" . $_GET['tabId'] .")";
		$ret = $this->query($sql);

		while($row = $this->fetcharray($ret)) {
		echo '<li>';
			echo '<a href="' . $row['id'] . '">' . $row['title'] . '</a>';
			echo '</li>';
		}
	}

	function getLatestNews()
	{
		$latestNewsCatagory = 2;

		$sql = "CALL getLatestNews(" . $latestNewsCatagory . ")";
		$ret = $this->query($sql);

		while($row = $this->fetcharray($ret)) {
		echo '<li>';
			echo '<a href="">';
				echo '<img src="assets/images/' . $row['large_image_url'] . '" alt="">';
				echo $row['title'];
				echo '</a>';
			echo '</li>';
		}
	}

	function getLatestPost($latestNewsCatagory)
	{
		$sql = "CALL getLatestNews(" . $latestNewsCatagory . ")";
		$ret = $this->query($sql);

		while($row = $this->fetcharray($ret)) {
			echo '<li>';
			echo '<div class="media">';
			echo '<a href="' . $row['id'] . '" class="media-left">';
			echo '<img src="assets/images/' . $row['large_image_url'] . '" alt="">';
			echo '</a>';
			echo '<div class="media-body">';
			echo '<a href="' . $row['id'] . '" class="catg_title">';
			echo $row['title'];
			echo '</a>';
			echo '</div>';
			echo '</div>';
			echo '</li>';
		}
	}

	function getViralPost($newsId)
	{
		$sql = "CALL getLatestNews(" . $newsId . ")";
		return $this->query($sql);
	}

	function getRelatedPost($newsId)
	{
		$sql = "CALL getRelatedPost(" . $newsId . ")";
		return $this->query($sql);
	}

	function getAllCategory()
	{
		$sql = "CALL getAllCategory()";
		$ret = $this->query($sql);

		while($row = $this->fetcharray($ret)) {
			echo '<li class="cat-item">';
				echo '<a href="' .$row['id'] . '">';
					echo $row['type'] . '';
					echo '</a>';
				echo '
			<li>';
    	}
    }

	function getNewsCategory()
	{
		$sql = "CALL getAllCategory()";
		return $this->query($sql);
    }

    function getBindCategoryOption()
    {
		$sql = "CALL getAllCategory()";
		$ret = $this->query($sql);

		while($row = $this->fetcharray($ret)) {

		echo '<option>';
			echo $row['type'] . '';
			echo '</option>';
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

		if(($row['user_name']==$auth['user_name'] OR $row['email']==$auth['user_name']) && ($row['password']==$saltPassword) && $num==1)
		{
			$_SESSION['user_id']=$row['id'];
			$_SESSION['login_user']=$row['user_name'];			

			echo "<script>window.location.href = 'news';</script>";
			exit;
		}
		else
		{
			echo "<script>window.location.href = 'site-login?state=failed';</script>";
			exit;
    	}
    }

	function fetcharray($sql)
	{
		return mysqli_fetch_array($sql);
	}

	function query($sql)
	{
		include "connection.php";
		return mysqli_query($dbConnection, $sql);	
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