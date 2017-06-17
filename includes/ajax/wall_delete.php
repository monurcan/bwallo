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

$wall_domain = $_POST["wall_domain"];

if(empty($wall_domain)){
	header("Location: /index.php");
}else {
	$q = $connect->query("DELETE FROM walls WHERE wall_domain = '{$wall_domain}'");

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>