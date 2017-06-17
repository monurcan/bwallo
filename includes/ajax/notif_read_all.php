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
function tr($tr){
	$var = iconv("UTF-8", "ISO-8859-9", $tr);
	return $var;
}

$q = $connect->query("UPDATE notifications SET notif_isread = 1 WHERE userid_fk = ".$connect->user_info(tr($_SESSION["user_name"]), "user_id"));

if($q){
	echo "ok";
}
?>