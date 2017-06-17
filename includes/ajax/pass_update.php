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

$new_pass = md5(sha1($_POST["new_pass"]));

if(!isset($_POST["new_pass"])){
	header("Location: /index.php");
}else {
	$q = $connect->query("UPDATE users SET user_pass = '{$new_pass}' WHERE user_name = '".$_SESSION["user_name"]."'");

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>