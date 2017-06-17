<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
require_once("../functions.php");
require_once("../config.php");

$user_pass = $connect->user_info($_SESSION["user_name"], "user_pass");
$pass = md5(sha1($_POST["pass"]));

if(empty($user_pass) || empty($pass)){
	header("Location: /index.php");
}else {
	if($pass == $user_pass){
		echo "ok";
	}else {
		echo "error";
	}
}
?>