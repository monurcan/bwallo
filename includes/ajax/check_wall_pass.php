<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
require_once("../functions.php");
require_once("../config.php");

$wall_pass = md5(sha1($_POST["wall_pass"]));
$wall_domain = $_POST["wall_domain"];

if(!isset($wall_pass) || !isset($wall_domain)){
	header("Location: /index.php");
}else {
	$q = $connect->exists("SELECT * FROM walls WHERE wall_domain = '{$wall_domain}' AND wall_pass = '{$wall_pass}'");

	if($q == 1){
		echo "true";
	}elseif($q == 0){
		echo "false";
	}
}
?>