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

if(!isset($_POST["post_id"]) || !isset($_POST["wall_id"])){
	header("Location: /index.php");
}else {
	if(is_logged_in()){
		$user_id = $connect->user_info($_SESSION["user_name"], "user_id");
		$q = $connect->query("INSERT INTO reposts (user_idfk, post_idfk, wall_idfk) VALUES ({$user_id}, ".$_POST["post_id"].", ".$_POST["wall_id"].")");
	}else {
		$q = $connect->query("INSERT INTO reposts (user_idfk, repost_ip, post_idfk, wall_idfk) VALUES (1, '".get_client_ip()."', ".$_POST["post_id"].", ".$_POST["wall_id"].")");
	}

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>