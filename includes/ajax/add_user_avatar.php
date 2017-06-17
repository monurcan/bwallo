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

$avatar = mysql_real_escape_string(strip_tags($_POST["avatar"]));

if(!isset($_POST["avatar"])){
	header("Location: /index.php");
}else {
	if(is_logged_in()){
		$q = $connect->query("INSERT INTO user_avatars (avatar_url, userid_fk) VALUES ('".$avatar."', '".$connect->user_info($_SESSION["user_name"], "user_id")."')");
	}else {
		$q = $connect->query("INSERT INTO user_avatars (avatar_url, userid_fk, avatar_ip) VALUES ('".$avatar."', '1','".get_client_ip()."')");
	}

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>