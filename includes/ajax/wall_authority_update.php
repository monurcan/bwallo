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
$new_wall_authority = mysql_real_escape_string(strip_tags($_POST["new_wall_authority"]));
$new_wall_pass = md5(sha1($_POST["new_wall_pass"]));
$new_moderated_posts = mysql_real_escape_string(strip_tags($_POST["new_moderated_posts"]));

if(!isset($new_wall_authority) || !isset($new_wall_pass) || !isset($wall_domain) || !isset($new_moderated_posts)){
	header("Location: /index.php");
}else {
	if($new_wall_pass == "same"){
		$q = $connect->query("UPDATE walls SET wall_privacy = ".$new_wall_authority.", wall_pass = '', wall_moderatedp = ".$new_moderated_posts." WHERE wall_domain = '{$wall_domain}'");
	}else {
		$q = $connect->query("UPDATE walls SET wall_privacy = ".$new_wall_authority.", wall_pass = '{$new_wall_pass}', wall_moderatedp = ".$new_moderated_posts." WHERE wall_domain = '{$wall_domain}'");
	}

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>