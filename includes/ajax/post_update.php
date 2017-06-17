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

$post_id = mysql_real_escape_string(strip_tags($_POST["post_id"]));
$x = mysql_real_escape_string(strip_tags($_POST["x"]));
$y = mysql_real_escape_string(strip_tags($_POST["y"]));
$z = mysql_real_escape_string(strip_tags($_POST["z"]));
$width = mysql_real_escape_string(strip_tags($_POST["width"]));
$title = mysql_real_escape_string(strip_tags(tr(mb_convert_encoding($_POST["title"], "HTML-ENTITIES", "UTF-8"))));
$subtitle = mysql_real_escape_string(strip_tags(tr(mb_convert_encoding($_POST["subtitle"], "HTML-ENTITIES", "UTF-8")), '<br><b><i><u><font><a><ol><ul><li><div><img>'));
$subtitle_img = mysql_real_escape_string(strip_tags($_POST["subtitle_img"]));
$color = mysql_real_escape_string(strip_tags($_POST["color"]));
$liked = mysql_real_escape_string(strip_tags($_POST["liked"]));
$content = addslashes(mb_convert_encoding($_POST["content"], "HTML-ENTITIES", "UTF-8"));

if(!isset($_POST["post_id"]) || !isset($_POST["x"]) || !isset($_POST["y"]) || !isset($_POST["z"]) || !isset($_POST["width"]) || !isset($_POST["title"]) || !isset($_POST["subtitle"]) || !isset($_POST["subtitle_img"]) || !isset($_POST["color"]) || !isset($_POST["content"])){
	header("Location: /index.php");
}else {
	if($x != "same" && $y != "same"){
		$q = $connect->query("UPDATE posts SET post_x = ".$x.", post_y = ".$y." WHERE post_id = '{$post_id}'");
	}else if($title != "same" && $subtitle != "same" && $width != "same"){
		$q = $connect->query("UPDATE posts SET post_width = ".$width.", post_title = '".$title."', post_subtitle = '".$subtitle."' WHERE post_id = '{$post_id}'");
	}else if($z != "same"){
		if($z == "front"){
			$new_z = $connect->selectq("SELECT MAX(post_z) AS post_z FROM posts", "post_z") + 1;
			$q = $connect->query("UPDATE posts SET post_z = ".$new_z." WHERE post_id = '{$post_id}'");
		}else if($z == "back"){
			$new_z = 0;
			$q = $connect->query("UPDATE posts SET post_z = ".$new_z." WHERE post_id = '{$post_id}'");
		}else {
			if($connect->selectq("SELECT post_z FROM posts WHERE post_id = '{$post_id}'", "post_z") == $z){
				$q = $connect->query("UPDATE posts SET post_updated=now() WHERE post_id = '{$post_id}'");
			}else {
				$q = $connect->query("UPDATE posts SET post_z = ".$z.", post_updated=now() WHERE post_id = '{$post_id}'");
			}
		}
	}else if($width != "same"){
		$q = $connect->query("UPDATE posts SET post_width = ".$width." WHERE post_id = '{$post_id}'");
	}else if($title != "same" && $subtitle != "same" && $content != "same"){
		$q = $connect->query("UPDATE posts SET post_title = '".$title."', post_subtitle = '".$subtitle."', post_content = '".$content."' WHERE post_id = '{$post_id}'");
	}else if($title != "same" && $subtitle != "same"){
		$q = $connect->query("UPDATE posts SET post_title = '".$title."', post_subtitle = '".$subtitle."' WHERE post_id = '{$post_id}'");
	}else if($subtitle_img != "same"){
		define('UPLOADP_DIR', $_SERVER["DOCUMENT_ROOT"]."/includes/src/subtitle_images/");
		$rand = uniqid();
		$subtitle_img = preg_replace('#^data:image/[^;]+;base64,#', '', $subtitle_img);
		$subtitle_img = str_replace(' ', '+', $subtitle_img);
		$data = base64_decode($subtitle_img);
		$file = UPLOADP_DIR.$rand.".jpg";
		$success = file_put_contents($file, $data);
		$img = $connect->general_settings("url")."/includes/src/subtitle_images/".$rand.".jpg";
		$q = $connect->query("UPDATE posts SET post_subtitle = IFNULL(CONCAT(`post_subtitle`, \" <img src='{$img}' />\"), \"<img src='{$img}' />\") WHERE post_id = '{$post_id}'");
	}else if($color != "same"){
		$q = $connect->query("UPDATE posts SET post_color = '{$color}' WHERE post_id = '{$post_id}'");
	}else if($liked == 1){
		if(!isset($_COOKIE["liked".$post_id])){
			$q = $connect->query("UPDATE posts SET post_like = post_like + 1 WHERE post_id = '{$post_id}'");
			if($q){
				setcookie("liked".$post_id, "1", time() + (60 * 60 * 24 * 60));
				if($connect->user_info($_SESSION["user_name"], "user_id") != $connect->selectq("SELECT users.user_id FROM users INNER JOIN posts ON posts.userid_fk = users.user_id WHERE posts.post_id = ".$_POST["post_id"], "user_id")){
					$connect->query("INSERT INTO notifications (notif_isread, notif_text, notif_href, userid_fk, notif_type) VALUES (0, 'Yazýn beðenildi.', '".$connect->general_settings("url")."/wall/".$connect->selectq("SELECT walls.wall_domain FROM walls INNER JOIN posts ON posts.wallid_fk = walls.wall_id WHERE posts.post_id = ".$_POST["post_id"], "wall_domain")."/post/".$_POST["post_id"]."', ".$connect->selectq("SELECT users.user_id FROM users INNER JOIN posts ON posts.userid_fk = users.user_id WHERE posts.post_id = ".$_POST["post_id"], "user_id").", 1)");
				}
			}
		}
	}else if($liked == 0){
		$q = $connect->query("UPDATE posts SET post_like = post_like - 1 WHERE post_id = '{$post_id}'");
		if($q){
			setcookie("liked".$post_id, "", time() - (60 * 60 * 24 * 60));
		}
	}

	if($q){
		echo "ok";
	}else {
		echo "error";
	}
}
?>