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

$type = $_POST["type"];
if(empty($type)){
	header("Location: /index.php");
}else {
	if($type == "user_name"){
		$user_name = tr($_POST["user_name"]);
		$exists_username = $connect->exists("SELECT * FROM users WHERE user_name = '{$user_name}'");
		if($exists_username == 1){
			echo "already";
		}elseif($exists_username == 0){
			echo "ok";
		}
	}elseif($type == "user_email"){
		$user_email = tr($_POST["user_email"]);
		$exists_email = $connect->exists("SELECT * FROM users WHERE user_email = '{$user_email}'");
		if($exists_email == 1){
			echo "already";
		}elseif($exists_email == 0){
			echo "ok";
		}
	}elseif($type == "*"){
		$user_data = tr($_POST["user_data"]);
		$exists_user = $connect->exists("SELECT * FROM users WHERE user_email = '{$user_data}' || user_name = '{$user_data}' || user_fullname = '{$user_data}'");
		if($exists_user == 1){
			echo "ok";
		}elseif($exists_user == 0){
			echo "error";
		}
	}
}
?>