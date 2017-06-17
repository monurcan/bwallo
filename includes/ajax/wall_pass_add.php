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

$wall_id = $connect->wall_info($_POST["wall_domain"], "wall_id");

if(!isset($_POST["wall_domain"])){
	header("Location: /index.php");
}else {
	$user_id = $connect->user_info(tr($_SESSION["user_name"]), "user_id");
	
	if(is_logged_in()){
		$q = $connect->query("INSERT INTO wall_pass (wallid_fk, userid_fk) VALUES ('{$wall_id}', '{$user_id}')");
	}else {
		$user_ip = get_client_ip();
		$q = $connect->query("INSERT INTO wall_pass (wallid_fk, pass_ip, userid_fk) VALUES ('{$wall_id}', '{$user_ip}', 1)");
	}
	
	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>