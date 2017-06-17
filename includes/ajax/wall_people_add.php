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

$email = mysql_real_escape_string($_POST["email"]);
$authority = $_POST["authority"];
$wall_id = $connect->wall_info($_POST["wall_domain"], "wall_id");

if(empty($email) || empty($wall_id) || empty($authority)){
	header("Location: /index.php");
}else {
	$q = $connect->query("INSERT INTO wall_peoples (wallid_fk, people_authority, people_email) VALUES ('{$wall_id}', '{$authority}', '{$email}')");
	
	if($q){
		$content = 'Hey! <span style="font-weight: bold; ">'.$_SESSION["user_fullname"].'</span> adlý kiþi duvarýný görmen için sabýrsýzlanýyor!';
		$content .= '<span onclick="window.location=\''.$connect->general_settings("url").'/index.php?do=wall&wall_domain='.$_POST["wall_domain"].'&verify_email='.$email.'\'" style="display: block; width: 170px; text-decoration: none; padding: 4px 2px; text-align: center; cursor: pointer; font-size: 17px; color: #fff; font-weight: bold; text-shadow: 1px 2px #287242;	border: 2.8px solid #2A7242; border-bottom-width: 6px; border-radius: 3px; text-shadow: 1px 2px #26617F; border-color: #26617F; -moz-box-shadow: inset inset 0 1px 0 #59A5DB; -webkit-box-shadow: inset 0 1px 0 #59A5DB; box-shadow: inset 0 1px 0 #59A5DB; background: #367fb8; /* Old browsers */ background: -moz-linear-gradient(top,  #367fb8 0%, #2d7599 100%); /* FF3.6+ */ background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#367fb8), color-stop(100%,#2d7599)); /* Chrome,Safari4+ */ background: -webkit-linear-gradient(top,  #367fb8 0%,#2d7599 100%); /* Chrome10+,Safari5.1+ */ background: -o-linear-gradient(top,  #367fb8 0%,#2d7599 100%); /* Opera 11.10+ */ background: -ms-linear-gradient(top,  #367fb8 0%,#2d7599 100%); /* IE10+ */	background: linear-gradient(to bottom,  #367fb8 0%,#2d7599 100%); /* W3C */	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#367fb8\', endColorstr=\'#2d7599\',GradientType=0 ); /* IE6-9 */ margin-bottom: 20px; margin-top: 20px; font-size: 13px; ">Duvarý gör!</span>';
		$content .= 'Veya aþaðýdaki baðlantýya týkla: <br />';
		$content .= '<a href="'.$connect->general_settings("url").'/index.php?do=wall&wall_domain='.$_POST["wall_domain"].'&verify_email='.$email.'" style="color: #3882BB; text-decoration: none; ">'.$connect->general_settings("url").'/index.php?do=wall&wall_domain='.$_POST["wall_domain"].'&verify_email='.$email.'</a>';
		$content .= '<div style="margin-top: 10px; margin-bottom: 13px; padding-right: 17px; text-align: right; position: relative; ">';
		$content .= 'Teþekkürler, <br />';
		$content .= 'bwallo<span style="color: #3882BB; font-weight: bold; ">.</span> ekibi';
		$content .= '</div>';
		$content .= '</p>';
		$subject = "duvar paylaþýmý";
		$title = "bwallo. duvar paylaþýmý!";
		bmail($content, $subject, $title, $email, $connect->general_settings("theme_url"));

		echo "ok";
	}else {
		echo "error";
	}
}
?>