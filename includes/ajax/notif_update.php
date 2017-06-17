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

$new_commentnotif = $_POST["new_commentnotif"];
$new_weeklynotif = $_POST["new_weeklynotif"];

if(empty($new_commentnotif) || empty($new_commentnotif)){
	header("Location: /index.php");
}else {
	$q = $connect->query("UPDATE users SET user_weeklynotif = $new_weeklynotif, user_commentnotif = $new_commentnotif WHERE user_name = '".$_SESSION["user_name"]."'");

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>