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

$follower = $connect->user_info(tr($_SESSION["user_name"]), "user_id");
$followed = $connect->user_info(tr($_POST["followed"]), "user_id");

if(empty($follower) || empty($followed)){
	header("Location: /index.php");
}else {
	$exists = $connect->exists("SELECT * FROM following WHERE following_follower = '{$follower}' AND following_followed = '{$followed}'");
	if($exists == 1){
		echo "error";
	}else {
		$q = $connect->query("INSERT INTO following (following_follower, following_followed) VALUES ('{$follower}', '{$followed}')");

		if($q){
			echo "ok";
			$connect->query("INSERT INTO notifications (notif_isread, notif_text, notif_href, userid_fk, notif_type) VALUES (0, '".$_SESSION["user_name"]." seni takip ediyor.', '".$connect->general_settings("url")."/users/".$_SESSION["user_name"]."', ".$connect->user_info(tr($_POST["followed"]), "user_id").", 2)");
		}
	}
}
?>