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

$email = mysql_real_escape_string($_POST["email"]);
$wall_id = $connect->wall_info($_POST["wall_domain"], "wall_id");

if(empty($email) || empty($wall_id)){
	header("Location: /index.php");
}else {
	$q = $connect->query("DELETE FROM wall_peoples WHERE wallid_fk = '{$wall_id}' AND people_email = '{$email}'");
	
	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>