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

$comment = mysql_real_escape_string(strip_tags(tr($_POST["comment"])));

if(!isset($_POST["post_id"]) || !isset($_POST["comment"])){
	header("Location: /index.php");
}else {
	if(is_logged_in()){
		$user_id = $connect->user_info($_SESSION["user_name"], "user_id");
	}else {
		$user_id = 1;
	}

	if(is_logged_in()){
		$q = $connect->query("INSERT INTO comments (userid_fk, postid_fk, comment_text) VALUES ({$user_id}, ".$_POST["post_id"].", '{$comment}')");
	}else {
		$q = $connect->query("INSERT INTO comments (userid_fk, comment_ip, postid_fk, comment_text) VALUES ({$user_id}, '".get_client_ip()."', ".$_POST["post_id"].", '{$comment}')");
	}

	if($q){
		echo "ok";
		if($user_id != $connect->selectq("SELECT users.user_id FROM users INNER JOIN posts ON posts.userid_fk = users.user_id WHERE posts.post_id = ".$_POST["post_id"], "user_id")){
			$connect->query("INSERT INTO notifications (notif_isread, notif_text, notif_href, userid_fk, notif_type) VALUES (0, 'Yazýna yorum yapýldý.', '".$connect->general_settings("url")."/wall/".$connect->selectq("SELECT walls.wall_domain FROM walls INNER JOIN posts ON posts.wallid_fk = walls.wall_id WHERE posts.post_id = ".$_POST["post_id"], "wall_domain")."/post/".$_POST["post_id"]."', ".$connect->selectq("SELECT users.user_id FROM users INNER JOIN posts ON posts.userid_fk = users.user_id WHERE posts.post_id = ".$_POST["post_id"], "user_id").", 0)");
		}
	}else {
		echo "error";
	}
}
?>