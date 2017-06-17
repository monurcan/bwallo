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

$x = mysql_real_escape_string(strip_tags($_POST["x"]));
$y = mysql_real_escape_string(strip_tags($_POST["y"]));
$width = mysql_real_escape_string(strip_tags($_POST["width"]));
$title = mysql_real_escape_string(strip_tags(tr($_POST["title"])));
$wall_id = $connect->wall_info($_POST["wall_domain"], "wall_id");
$subtitle = mysql_real_escape_string(strip_tags(tr($_POST["subtitle"]), '<br><b><i><u><font><a><ol><ul><li><div><img>'));
$color = mysql_real_escape_string(strip_tags($_POST["color"]));

if(!isset($_POST["x"]) || !isset($_POST["y"]) || !isset($_POST["width"]) || !isset($_POST["title"]) || !isset($_POST["subtitle"]) || !isset($_POST["color"]) || !isset($_POST["wall_domain"])){
	header("Location: /index.php");
}else {
	if(is_logged_in()){
		$user_id = $connect->user_info($_SESSION["user_name"], "user_id");
	}else {
		$user_id = 1;
	}

	$z = $connect->selectq("SELECT MAX(post_z) AS post_z FROM posts", "post_z") + 1;
	if(is_logged_in()){
		$q = $connect->query("INSERT INTO posts (post_x, post_y, post_z, post_width, post_title, post_subtitle, post_color, post_created, wallid_fk, userid_fk) VALUES ({$x}, {$y}, '{$z}', {$width}, '{$title}', '{$subtitle}', '{$color}', now(), {$wall_id}, {$user_id})");
	}else {
		$q = $connect->query("INSERT INTO posts (post_x, post_y, post_z, post_width, post_title, post_subtitle, post_color, post_created, wallid_fk, userid_fk, post_ip) VALUES ({$x}, {$y}, '{$z}', {$width}, '{$title}', '{$subtitle}', '{$color}', now(), {$wall_id}, 1, '".get_client_ip()."')");
	}

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>