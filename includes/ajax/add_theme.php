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

if(empty($_POST["theme"])){
	header("Location: /index.php");
}else {
	$theme = $_POST["theme"];
	$theme = preg_replace('#^data:application/zip;base64,#', '', $theme);
	$theme = str_replace(' ', '+', $theme);
	$data = base64_decode($theme);
	$rand = uniqid();
	file_put_contents($_SERVER["DOCUMENT_ROOT"]."/includes/templates/".$rand.".zip", $data);
	$zip = new ZipArchive;
	if($zip->open($_SERVER["DOCUMENT_ROOT"]."/includes/templates/".$rand.".zip") === TRUE){
		if($zip->locateName('index.bwl') !== false && $zip->locateName('article.bwl') !== false && $zip->locateName('share.bwl') !== false && $zip->locateName('comments.bwl') !== false && $zip->locateName('thumbnail.png') !== false){
			mkdir($_SERVER["DOCUMENT_ROOT"]."/includes/templates/".$rand."/", 0777, true);
			$zip->extractTo($_SERVER["DOCUMENT_ROOT"]."/includes/templates/".$rand."/");
			$zip->close();
			if(is_logged_in()){
				$user_id = $connect->user_info($_SESSION["user_name"], "user_id");
				$q = $connect->query("INSERT INTO user_themes (userid_fk, theme_name) VALUES ({$user_id}, '{$rand}')");
			}else {
				$q = $connect->query("INSERT INTO user_themes (userid_fk, theme_ip, theme_name) VALUES (1, '".get_client_ip()."', '{$rand}')");
			}
			if($q){
				echo "ok";
			}else {
				echo "error";
			}
		}else {
			echo "miss";
		}
		unlink($_SERVER["DOCUMENT_ROOT"]."/includes/templates/".$rand.".zip");
	}else {
		echo "error";
	}
}
?>