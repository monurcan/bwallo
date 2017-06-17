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

$wall_domain = $_POST["wall_domain"];
$wall_avatar = mysql_real_escape_string(strip_tags(tr($_POST["avatar"])));
$wall_title = mysql_real_escape_string(strip_tags(tr($_POST["title"])));
$wall_desc = mysql_real_escape_string(strip_tags(tr($_POST["desc"])));
$wall_paper = mysql_real_escape_string(strip_tags(tr($_POST["wallpaper"])));

if(empty($wall_avatar) && empty($wall_title) && empty($wall_desc) && empty($wall_avatar)){
	header("Location: /index.php");
}else {
	if($wall_avatar != "same"){
		if($wall_avatar == "default"){
			$wall_avatar = "none";
		}

		$q = $connect->query("UPDATE walls SET wall_avatar = '{$wall_avatar}' WHERE wall_domain = '{$wall_domain}'");
	}

	if($wall_title != "same"){
		$q = $connect->query("UPDATE walls SET wall_title = '{$wall_title}' WHERE wall_domain = '{$wall_domain}'");
	}

	if($wall_desc != "same"){
		$q = $connect->query("UPDATE walls SET wall_desc = '{$wall_desc}' WHERE wall_domain = '{$wall_domain}'");
	}

	if($wall_paper != "same"){
		$q = $connect->query("UPDATE walls SET wall_wallpaper = '{$wall_paper}' WHERE wall_domain = '{$wall_domain}'");
	}

	/*if($profile_photo != "same"){
		if($profile_photo == "default"){
			$pp = "includes/src/default-avatar.png";
			$_SESSION["user_avatar"] = $pp;
		}else {
			define('UPLOADP_DIR', $_SERVER["DOCUMENT_ROOT"]."/includes/src/user_avatars/");
			$rand = uniqid();
			$profile_photo = preg_replace('#^data:image/[^;]+;base64,#', '', $profile_photo);
			$profile_photo = str_replace(' ', '+', $profile_photo);
			$data = base64_decode($profile_photo);
			$file = UPLOADP_DIR.$rand.".png";
			$success = file_put_contents($file, $data);
			$pp = "includes/src/user_avatars/".$rand.".png";
			$_SESSION["user_avatar"] = $pp;
		}

		$q = $connect->query("UPDATE users SET user_fullname = '{$new_fullname}', user_about = '{$new_about}', user_avatar = '{$pp}' WHERE user_name = '".$_SESSION["user_name"]."'");
	}

	if($profile_photo == "same" && $cover_photo == "same"){
		$q = $connect->query("UPDATE users SET user_fullname = '{$new_fullname}', user_about = '{$new_about}' WHERE user_name = '".$_SESSION["user_name"]."'");
	}*/

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>