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

if(empty($_POST["notif_id"])){
	header("Location: /index.php");
}else {
	$q = $connect->query("UPDATE notifications SET notif_isread = 1 WHERE notif_id = ".$_POST["notif_id"]);

	if($q){
		echo "ok";
	}
}
?>