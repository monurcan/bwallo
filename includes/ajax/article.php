<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
require_once("../functions.php");
require_once("../config.php");

header("Content-Type: application/json; charset=utf-8");

if(!isset($_POST["id"]) || !isset($_POST["domain"])){
	header("Location: /index.php");
}else {
	$selectq = "SELECT * FROM posts WHERE post_id = ".$_POST["id"];
	if($connect->exists($selectq)){
		$json["temp"] = $connect->general_settings("url")."/includes/templates/".$connect->wall_info($_POST["domain"], "wall_template")."/article.bwl";
		$json["title"] = mb_convert_encoding(stripslashes($connect->selectq($selectq, "post_title")), "UTF-8", "ISO-8859-9");
		$json["subtitle"] = mb_convert_encoding(strip_tags(stripslashes($connect->selectq($selectq, "post_subtitle")), "<br><b><i><u><font><a><ol><ul><li><div>"), "UTF-8", "ISO-8859-9");
		if(preg_match('/src="([^"]*)"/', $connect->selectq($selectq, "post_subtitle"), $img)){
			$json["img"] = $img[1];
		}elseif(preg_match('/src=\'([^"]*)\'/', $connect->selectq($selectq, "post_subtitle"), $img)){
			$json["img"] = $img[1];
		}else {
			$json["img"] = "";
		}
		$json["content"] = mb_convert_encoding($connect->selectq($selectq, "post_content"), "UTF-8", "ISO-8859-9");
		$json["hit"] = $connect->selectq($selectq, "post_hit") + 1;
		$connect->query("UPDATE posts SET post_hit =  ".$json["hit"]." WHERE post_id = '".$_POST["id"]."'");
		$json["like"] = $connect->selectq($selectq, "post_like");
		$json["created"] = mb_convert_encoding(date_tr("d F Y, l", $connect->selectq($selectq, "post_created")), "UTF-8", "ISO-8859-9");
		$json["updated"] = mb_convert_encoding(date_tr("d F Y, l", $connect->selectq($selectq, "post_updated")), "UTF-8", "ISO-8859-9");
		$json["color"] = $connect->selectq($selectq, "post_color");
		$json["author_name"] = mb_convert_encoding($connect->selectq("SELECT user_fullname FROM users WHERE user_id = ".$connect->selectq($selectq, "userid_fk"), "user_fullname"), "UTF-8", "ISO-8859-9");
		$json["author_avatar"] = $connect->selectq("SELECT user_avatar FROM users WHERE user_id = ".$connect->selectq($selectq, "userid_fk"), "user_avatar");
		if(is_logged_in()){
			$json["my_fullname"] = mb_convert_encoding(htmlspecialchars(stripslashes($_SESSION["user_fullname"]), ENT_QUOTES, 'ISO-8859-1'), "UTF-8", "ISO-8859-9");
			$json["my_avatar"] = $_SESSION["user_avatar"];
		}else {
			$json["my_fullname"] = mb_convert_encoding($connect->selectq("SELECT user_fullname FROM users WHERE user_id = 1", "user_fullname"), "UTF-8", "ISO-8859-9");
			$json["my_avatar"] = $connect->selectq("SELECT user_avatar FROM users WHERE user_id = 1", "user_avatar");
		}
		if(isset($_COOKIE["liked".$_POST["id"]])){
			$json["liked"] = "1";
		}else {
			$json["liked"] = "";
		}
		if($connect->selectq($selectq, "post_ip") == get_client_ip() || $connect->wall_authority($_POST["domain"]) == 'moderate' || $connect->wall_authority($_POST["domain"]) == 'p_moderate' || $connect->wall_authority($_POST["domain"]) == 'h_moderate' || $connect->wall_authority($_POST["domain"]) == 'e_moderate' || $connect->wall_authority($_POST["domain"]) == 'admin'){
			$json["is_editable"] = 1;
		}elseif($connect->wall_info($_POST["domain"], "userid_fk") == $connect->user_info($_SESSION['user_name'], 'user_id') || $connect->selectq($selectq, "userid_fk") == $connect->user_info($_SESSION['user_name'], 'user_id')){
			$json["is_editable"] = 1;
		}else {
			$json["is_editable"] = 0;
		}
		echo json_encode($json, JSON_UNESCAPED_UNICODE);
	}else {
		echo "error";
	}
}
?>