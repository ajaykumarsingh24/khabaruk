<?php 
require_once "common.php";

if(isset($_POST['submitdocumentform']) && !empty($_POST['submitdocumentform'])){
	
		$bytes = random_bytes(5);
		$array['title'] = !empty($_POST['title']) ? $_POST['title'] : '';		
		$array['date'] = !empty($_POST['date']) ? $_POST['date'] : '';

		if(!empty($_FILES['file_1']['name'])){
			$array['file_1'] = bin2hex($bytes) . 'img1a' . '.jpg';
		}
		else{
			$array['file_1'] = 'no-img.jpg';
		}

		if(!empty($_FILES['file_2']['name'])){
			$array['file_2'] = bin2hex($bytes)  . 'img2b' . '.jpg';
		}
		else{
			$array['file_2'] = 'no-img.jpg';
		}

		if(!empty($_FILES['file_3']['name'])){
			$array['file_3'] = bin2hex($bytes)  . 'img3c' . '.jpg';
		}
		else{
			$array['file_3'] = 'no-img.jpg';
		}

		$allowed =  array('gif','png' ,'jpg','jpeg','bmp','pdf');

		$img1ext = pathinfo($array['file_1'], PATHINFO_EXTENSION);
		$img2ext = pathinfo($array['file_2'], PATHINFO_EXTENSION);
		$img3ext = pathinfo($array['file_3'], PATHINFO_EXTENSION);

		if(!in_array($img1ext, $allowed) || !in_array($img2ext, $allowed) || !in_array($img3ext, $allowed)) {
			$_SESSION['document_upload'] = 'fail';
			exit;
		}
		else{
			if(!empty($_FILES['file_1']['name'])){
				move_uploaded_file($_FILES['file_1']['tmp_name'],'../assets/images/news/' . $array['file_1']);
			}

			if(!empty($_FILES['file_2']['name'])){
				move_uploaded_file($_FILES['file_2']['tmp_name'],'../assets/images/news/' . $array['file_2']);
			}

			if(!empty($_FILES['file_3']['name'])){
				move_uploaded_file($_FILES['file_3']['tmp_name'],'../assets/images/news/' . $array['file_3']);
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