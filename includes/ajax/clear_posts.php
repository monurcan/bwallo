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

if(empty($_POST["wall_do"])){
	header("Location: /index.php");
}else {
	$q = $connect->query("DELETE FROM posts WHERE wallid_fk = ".$connect->wall_info($_POST["wall_do"], "wall_id"));

	if($q){
		echo "ok";
	}
}
?>