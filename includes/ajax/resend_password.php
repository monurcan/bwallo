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

$user_data = tr($_POST["user_data"]);

if($user_data){
	$selectq = "SELECT * FROM users WHERE user_email = '{$user_data}' || user_name = '{$user_data}' || user_fullname = '{$user_data}'";
	$user_email = $connect->selectq($selectq, "user_email");
	$user_fullname = $connect->selectq($selectq, "user_fullname");
	$user_name = $connect->selectq($selectq, "user_name");

	$content = $user_name.' adlı bwallo<span style="color: #3882BB; font-weight: bold; ">.</span> hesabının şifresini sıfırlamak istediğine dair bir ileti aldık. <br />';
	$content .= 'Şifreni sıfırlamak için aşağıdaki bağlantıya tıkla (veya bağlantıyı kopyalayıp tarayıcına yapıştır): <br />';
	$content .= '<a href="'.$connect->general_settings("url").'/index.php?do=confirm-email&email='.$user_email.'&code='.$hash.'" style="color: #3882BB; text-decoration: none; ">'.$connect->general_settings("url").'/index.php?do=confirm-email&email='.$user_email.'&code='.$hash.'</a>';
	$content .= '<div style="margin-top: 10px; margin-bottom: 13px; padding-right: 17px; text-align: right; position: relative; ">';
	$content .= 'Teşekkürler, <br />';
	$content .= 'bwallo<span style="color: #3882BB; font-weight: bold; ">.</span> ekibi';
	$content .= '</div>';
	$content .= '</p>';
	$subject = "Şifreni mi unuttun, ".$user_fullname;
	$title = "bwallo. şifreni sıfırla";
	$to = $user_fullname." <".$user_email.">";
	bmail($content, $subject, $title, $to, $connect->general_settings("theme_url"));

	echo "ok";
}else {
	header("Location: /index.php");
}
?>