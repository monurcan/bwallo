<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
require_once("../functions.php");
require_once("../config.php");

header("Content-Type: text/html; charset=windows-1254"); 

function tr($tr){
	$var = iconv("UTF-8", "ISO-8859-9", $tr);
	return $var;
}

$new_fullname = mysql_real_escape_string(strip_tags(tr($_POST["new_fullname"])));
$new_about = mysql_real_escape_string(strip_tags(tr($_POST["new_about"])));
$profile_photo = mysql_real_escape_string(strip_tags($_POST["profile_photo"]));
$cover_photo = mysql_real_escape_string(strip_tags($_POST["cover_photo"]));

if(empty($new_fullname) && empty($new_about) && empty($profile_photo) && empty($cover_photo)){
	header("Location: /index.php");
}else {
	if($cover_photo != "same"){
		if($cover_photo == "default"){
			$cp = $connect->general_settings("url")."/includes/src/default-cover.png";
		}else {
			define('UPLOADC_DIR', $_SERVER["DOCUMENT_ROOT"]."/includes/src/user_covers/");
			$rand = uniqid();
			$cover_photo = preg_replace('#^data:image/[^;]+;base64,#', '', $cover_photo);
			$cover_photo = str_replace(' ', '+', $cover_photo);
			$data = base64_decode($cover_photo);
			$file = UPLOADC_DIR.$rand.".jpg";
			$success = file_put_contents($file, $data);
			$cp = $connect->general_settings("url")."/includes/src/user_covers/".$rand.".jpg";
		}

		$q = $connect->query("UPDATE users SET user_fullname = '{$new_fullname}', user_about = '{$new_about}', user_cover = '{$cp}' WHERE user_name = '".$_SESSION["user_name"]."'");
	}

	if($profile_photo != "same"){
		if($profile_photo == "default"){
			$pp = $connect->general_settings("url")."/includes/src/default-avatar.png";
			$_SESSION["user_avatar"] = $pp;
		}else {
			define('UPLOADP_DIR', $_SERVER["DOCUMENT_ROOT"]."/includes/src/user_avatars/");
			$rand = uniqid();
			$profile_photo = preg_replace('#^data:image/[^;]+;base64,#', '', $profile_photo);
			$profile_photo = str_replace(' ', '+', $profile_photo);
			$data = base64_decode($profile_photo);
			$file = UPLOADP_DIR.$rand.".jpg";
			$success = file_put_contents($file, $data);
			$pp = $connect->general_settings("url")."/includes/src/user_avatars/".$rand.".jpg";
			$_SESSION["user_avatar"] = $pp;
		}

		$q = $connect->query("UPDATE users SET user_fullname = '{$new_fullname}', user_about = '{$new_about}', user_avatar = '{$pp}' WHERE user_name = '".$_SESSION["user_name"]."'");
	}

	if($profile_photo == "same" && $cover_photo == "same"){
		$q = $connect->query("UPDATE users SET user_fullname = '{$new_fullname}', user_about = '{$new_about}' WHERE user_name = '".$_SESSION["user_name"]."'");
	}

	if($q){
		$_SESSION["user_fullname"] = $new_fullname;
		echo "ok";
	}else {
		echo "error";
	}
}
?>