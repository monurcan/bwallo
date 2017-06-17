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
$authority = mysql_real_escape_string($_POST["authority"]);

if(empty($email) || empty($wall_id) || empty($authority)){
	header("Location: /index.php");
}else {
	switch($authority){
		case "can_view":
			$authority = 1;
		break;

		case "can_write":
			$authority = 2;
		break;

		case "can_read":
			$authority = 3;
		break;

		case "can_admin":
			$authority = 4;
		break;
	}

	$q = $connect->query("UPDATE wall_peoples SET people_authority = '{$authority}' WHERE people_email = '{$email}' AND wallid_fk = '{$wall_id}'");

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>