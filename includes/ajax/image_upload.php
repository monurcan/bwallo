<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
 
$_FILES['file']['type'] = strtolower($_FILES['file']['type']);
 
if($_FILES['file']['type'] == 'image/png' || $_FILES['file']['type'] == 'image/jpg' || $_FILES['file']['type'] == 'image/gif' || $_FILES['file']['type'] == 'image/jpeg' || $_FILES['file']['type'] == 'image/pjpeg'){  
	$filename = uniqid().'.jpg';
	$file = $_SERVER["DOCUMENT_ROOT"]."/includes/src/content_images/".$filename;
	copy($_FILES['file']['tmp_name'], $file);
	$array = array(
		'filelink' => $GLOBALS["site_url"]."/includes/src/content_images/".$filename
	);
	
	echo stripslashes(json_encode($array));
}
?>