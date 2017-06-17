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

$user_fullname = mysql_real_escape_string(strip_tags(tr($_POST["user_name"])));
$user_pass = mysql_real_escape_string(md5(sha1(tr($_POST["user_pass"]))));
$user_email = mysql_real_escape_string(strip_tags($_POST["user_email"]));
$user_name = mysql_real_escape_string(strip_tags(tr($_POST["user_username"])));
	
if(empty($user_fullname) || empty($user_pass) || empty($user_email) || empty($user_name)){
	header("Location: /index.php");
}else {
	$exists_email = $connect->exists("SELECT * FROM users WHERE user_email = '{$user_email}' AND user_rank != 0");
	$exists_username = $connect->exists("SELECT * FROM users WHERE user_name = '{$user_name}' AND user_rank != 0");
	if($exists_username == 1 AND $exists_email == 1){
		echo "already";
	}else if($exists_username == 1){
		echo "alreadyusername";
	}else if($exists_email == 1){
		echo "alreadyemail";
	}else {
		$delq = $connect->query("DELETE FROM users WHERE user_email = '{$user_email}' OR user_name = '{$user_name}' AND user_rank = 0");
		$hash = md5(rand(0, 1000));
		$q = $connect->query("INSERT INTO users (user_fullname, user_pass, user_email, user_name, user_rank, user_hash, user_avatar, user_cover) VALUES ('{$user_fullname}', '{$user_pass}', '{$user_email}', '{$user_name}', 0, '{$hash}', '".$connect->general_settings("url")."/includes/src/default-avatar.png', '".$connect->general_settings("url")."/includes/src/default-cover.png')");
		if($q){
			$selectq = "SELECT * FROM users WHERE user_email = '{$user_email}' AND user_pass = '{$user_pass}'";
			$user_avatar = $connect->selectq($selectq, "user_avatar");
			$user_id = $connect->selectq($selectq, "user_id");
			
			$connect->query("UPDATE walls SET user_ip = '', userid_fk = ".$user_id." WHERE user_ip = '".get_client_ip()."' AND userid_fk = 1");

			$session = array(
				"login" => true,
				"user_fullname" => $user_fullname,
				"user_email" => $user_email,
				"user_name" => $user_name,
				"user_avatar" => $user_avatar
			);

			create_session($session);

			$content = 'bwallo<span style="color: #3882BB; font-weight: bold; ">.</span>\'ya hoşgeldin. Lütfen hesabını doğrulayarak, kayıt işlemini tamamla.';
			$content .= '<span onclick="window.location=\''.$connect->general_settings("url").'/index.php?do=confirm-email&email='.$user_email.'&code='.$hash.'\'" style="display: block; width: 170px; text-decoration: none; padding: 4px 2px; text-align: center; cursor: pointer; font-size: 17px; color: #fff; font-weight: bold; text-shadow: 1px 2px #287242;	border: 2.8px solid #2A7242; border-bottom-width: 6px; border-radius: 3px; text-shadow: 1px 2px #26617F; border-color: #26617F; -moz-box-shadow: inset inset 0 1px 0 #59A5DB; -webkit-box-shadow: inset 0 1px 0 #59A5DB; box-shadow: inset 0 1px 0 #59A5DB; background: #367fb8; /* Old browsers */ background: -moz-linear-gradient(top,  #367fb8 0%, #2d7599 100%); /* FF3.6+ */ background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#367fb8), color-stop(100%,#2d7599)); /* Chrome,Safari4+ */ background: -webkit-linear-gradient(top,  #367fb8 0%,#2d7599 100%); /* Chrome10+,Safari5.1+ */ background: -o-linear-gradient(top,  #367fb8 0%,#2d7599 100%); /* Opera 11.10+ */ background: -ms-linear-gradient(top,  #367fb8 0%,#2d7599 100%); /* IE10+ */	background: linear-gradient(to bottom,  #367fb8 0%,#2d7599 100%); /* W3C */	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#367fb8\', endColorstr=\'#2d7599\',GradientType=0 ); /* IE6-9 */ margin-bottom: 20px; margin-top: 20px; font-size: 13px; ">Hesabını şimdi doğrula</span>';
			$content .= 'Veya aşağıdaki bağlantıya tıkla: <br />';
			$content .= '<a href="'.$connect->general_settings("url").'/index.php?do=confirm-email&email='.$user_email.'&code='.$hash.'" style="color: #3882BB; text-decoration: none; ">'.$connect->general_settings("url").'/index.php?do=confirm-email&email='.$user_email.'&code='.$hash.'</a>';
			$content .= '<div style="margin-top: 10px; margin-bottom: 13px; padding-right: 17px; text-align: right; position: relative; ">';
			$content .= 'Teşekkürler, <br />';
			$content .= 'bwallo<span style="color: #3882BB; font-weight: bold; ">.</span> ekibi';
			$content .= '</div>';
			$content .= '</p>';
			$subject = "hesap doğrulaması";
			$title = "bwallo. hesabını aktifleştir!";
			$to = $user_fullname." <".$user_email.">";
			bmail($content, $subject, $title, $to, $connect->general_settings("theme_url"));

			echo "ok";
		}else {
			echo "error";
		}
	}
}
?>