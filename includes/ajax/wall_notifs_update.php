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
$new_wall_notifs = mysql_real_escape_string(strip_tags($_POST["new_wall_notifs"]));

if(!isset($new_wall_notifs) || !isset($wall_domain)){
	header("Location: /index.php");
}else {
	$q = $connect->query("UPDATE walls SET wall_notifs = ".$new_wall_notifs." WHERE wall_domain = '{$wall_domain}'");

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>