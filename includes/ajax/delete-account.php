<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
require_once("../functions.php");
require_once("../config.php");

$user_name = $_SESSION["user_name"];
if(!isset($user_name)){
	header("Location: /index.php");
}else {
	$q = $connect->query("DELETE FROM users WHERE user_name = '{$user_name}'");

	if($q){
		echo "ok";
	}
}
?>