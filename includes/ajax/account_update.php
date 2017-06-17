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

$username = htmlspecialchars_decode(addslashes(tr($_POST["username"])));
$new_username = mysql_real_escape_string(strip_tags(tr($_POST["new_username"])));
$new_email = mysql_real_escape_string(strip_tags(tr($_POST["new_email"])));

if(empty($username) || empty($new_username) || empty($new_email)){
	header("Location: /index.php");
}else {
	$q = $connect->query("UPDATE users SET user_name = '{$new_username}', user_email = '{$new_email}' WHERE user_name = '{$username}'");

	if($q){
		$_SESSION["user_name"] = $new_username;
		$_SESSION["user_email"] = $new_email;
		echo "ok";
	}else {
		echo "error";
	}
}
?>