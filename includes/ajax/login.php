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

$user_email = mysql_real_escape_string($_POST["user_email"]);
$user_pass = mysql_real_escape_string(md5(sha1(tr($_POST["user_pass"]))));

if(empty($user_email) || empty($user_pass)){
	header("Location: /index.php");
}elseif($_POST["user_pass"] == "facebook"){
	$control = $connect->exists("SELECT * FROM users WHERE user_email = '{$user_email}'");
	if($control == 1){
		$q = "SELECT * FROM users WHERE user_email = '{$user_email}'";
		$user_rank = $connect->selectq($q, "user_rank");
		if($user_rank == 0){
			echo "notverify";
		}else {
			$user_fullname = $connect->selectq($q, "user_fullname");
			$user_email = $connect->selectq($q, "user_email");
			$user_name = $connect->selectq($q, "user_name");
			$user_avatar = $connect->selectq($q, "user_avatar");

			$session = array(
				"login" => true,
				"user_fullname" => $user_fullname,
				"user_email" => $user_email,
				"user_name" => $user_name,
				"user_avatar" => $user_avatar
			);

			create_session($session);
			echo "ok";
		}
	}else {
		echo "error";
	}
}else {
	$control = $connect->exists("SELECT * FROM users WHERE user_email = '{$user_email}' || user_name = '{$user_email}' AND user_pass = '{$user_pass}'");
	if($control == 1){
		$q = "SELECT * FROM users WHERE user_email = '{$user_email}' || user_name = '{$user_email}' && user_pass = '{$user_pass}'";
		$user_rank = $connect->selectq($q, "user_rank");
		if($user_rank == 0){
			echo "notverify";
		}else {
			$user_fullname = $connect->selectq($q, "user_fullname");
			$user_email = $connect->selectq($q, "user_email");
			$user_name = $connect->selectq($q, "user_name");
			$user_avatar = $connect->selectq($q, "user_avatar");

			$session = array(
				"login" => true,
				"user_fullname" => $user_fullname,
				"user_email" => $user_email,
				"user_name" => $user_name,
				"user_avatar" => $user_avatar
			);

			create_session($session);
			echo "ok";
		}
	}else {
		echo "error";
	}
}
?>