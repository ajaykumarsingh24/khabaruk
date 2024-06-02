<?php 
require_once "common.php";

if(isset($_POST['submitdocumentform']) && !empty($_POST['submitdocumentform'])){
	
		$bytes = random_bytes(5);
		$array['title'] = !empty($_POST['title']) ? $_POST['title'] : '';		
		$array['date'] = !empty($_POST['date']) ? $_POST['date'] : '';
		$array['description'] = !empty($_POST['description']) ? $_POST['description'] : '';
		$array['category'] = !empty($_POST['category']) ? $_POST['category'] : '';

		if(!empty($_FILES['file']['name'])){
			$array['file'] = bin2hex($bytes) . 'img1a' . '.jpg';
		}
		else{
			$array['file'] = 'no-img.jpg';
		}		

		$allowed =  array('gif','png' ,'jpg','jpeg','bmp','pdf');

		$img1ext = pathinfo($array['file'], PATHINFO_EXTENSION);

		if(!in_array($img1ext, $allowed)) {
			$_SESSION['document_upload'] = 'fail';
			exit;
		}
		else{
			if(!empty($_FILES['file']['name'])){
				move_uploaded_file($_FILES['file']['tmp_name'],'../assets/images/' . $array['file']);
			}
		}		

		$status=$admin->addNews($array);

		$_SESSION['document_upload'] = 'upload';

		header("Location: news");	

	} else{
			$_SESSION['document_upload'] = 'fail';
			header("Location: news");
	}

	?>