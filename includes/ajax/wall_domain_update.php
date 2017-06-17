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

$wall_id = $connect->wall_info($_POST["wall_domain"], "wall_id");
$new_wall_domain = mysql_real_escape_string(strip_tags($_POST["new_wall_domain"]));

if(!isset($_POST["new_wall_domain"]) || !isset($_POST["wall_domain"])){
	header("Location: /index.php");
}else {
	$exists_wall_domain = $connect->exists("SELECT * FROM wall_domains WHERE domain = '{$new_wall_domain}'");
	if($exists_wall_domain == 1){
		echo "already";
	}else {
		$connect->query("DELETE FROM wall_domains WHERE wallid_fk = '{$wall_id}'");
		$q = $connect->query("INSERT INTO wall_domains (domain, wallid_fk) VALUES ('{$new_wall_domain}', ".$wall_id.")");

		if($q){
			echo "ok";
		}else {
			echo "error";
		}
	}
}
?>