<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
 
 	$fileInfo = pathinfo($_FILES["file"]["name"]);
 	$fileName = uniqid().'.'.$fileInfo['extension'];
	move_uploaded_file($_FILES['file']['tmp_name'], $_SERVER["DOCUMENT_ROOT"]."/includes/src/content_files/".$fileName);
	 
	$array = array(
		'filelink' => $GLOBALS["site_url"]."/includes/src/content_files/".$fileName,
		'filename' => $fileName
	);
	
	echo stripslashes(json_encode($array));
?>