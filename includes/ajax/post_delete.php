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

$post_id = mysql_real_escape_string($_POST["post_id"]);

if(empty($post_id)){
	header("Location: /index.php");
}else {
	$q = $connect->query("DELETE FROM posts WHERE post_id = '{$post_id}'");
	
	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>