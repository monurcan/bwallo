<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
	## Requires ##
	require_once("includes/functions.php");
	require_once("includes/config.php");

		//  JavaScript Files
			// Multiple Language
			echo '<script src="'.$connect->general_settings("url").'/includes/js/lang.js" charset="utf-8" type="text/javascript"></script>';
			echo '<script src="'.$connect->general_settings("url").'/includes/langpack/en.js" charset="utf-8" type="text/javascript"></script>';
			
			// System Files
			//echo '<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>';
			echo '<script type="text/javascript" src="'.$connect->general_settings("url").'/includes/js/jquery.min.js"></script>';
			echo "<script type='text/javascript' src='".$connect->general_settings("url")."/includes/js/script.js'></script>";

	$do = $_GET["do"];
	if(isset($do) && $do != "" && $do != "login" && $do != "resend_password" && $do != "sign-up" && $do != "profile" && $do != "settings" && $do != "delete-account" && $do != "404" && $do != "welcome" && $do != "wall" && $do != "log-out" && $do != "delete-wall" && $do != "page" && $do != "discover" && $do != "search"){
		$_GET["do"] = "wall";
		$_GET["wall_domain"] = $connect->selectq("SELECT W.wall_domain FROM walls W INNER JOIN wall_domains D ON D.wallid_fk = W.wall_id WHERE D.domain = '{$do}'", "wall_domain");
	}elseif($do == "page"){
		$_GET["do"] = $_GET["page_name"];
	}

	## User Full Name Variable for Title ##
	$GLOBALS["user_fullname"] = $connect->user_info($_GET["user_name"], "user_fullname");
	$GLOBALS["wall_title"] = $connect->wall_info($_GET["wall_domain"], "wall_title");
	$GLOBALS["site_title"] = $connect->general_settings("site_title");
	$GLOBALS["site_email"] = $connect->general_settings("site_email");
	$GLOBALS["site_url"] = $connect->general_settings("url");

	$template = new Template;

		## Template Variables ##
		$template->assign("site_name", $connect->general_settings("site_title"));
		$template->assign("site_desc", $connect->general_settings("site_desc"));
		$template->assign("site_desc_en", $connect->general_settings("site_desc_en"));
		$template->assign("site_title", site_title($connect->general_settings("site_title"), $connect->general_settings("site_desc")));
		$template->assign("site_favicon", $connect->general_settings("site_favicon"));
		$template->assign("homepage", $connect->general_settings("url"));
		$template->assign("theme", $connect->general_settings("theme_url")."/");
		$template->assign("style_file", style_file($connect->general_settings("theme_url")."/"));
		$template->assign("js_file", js_file($connect->general_settings("theme_url")."/"));

			// Session Informations
			$template->assign("my_username", htmlspecialchars(stripslashes($_SESSION["user_name"]), ENT_QUOTES, 'ISO-8859-1'));
			$template->assign("my_fullname", htmlspecialchars(stripslashes($_SESSION["user_fullname"]), ENT_QUOTES, 'ISO-8859-1'));
			$template->assign("my_avatar", $_SESSION["user_avatar"]);
			$template->assign("my_cover", $connect->user_info($_SESSION["user_name"], "user_cover"));
			$template->assign("my_email", $connect->user_info($_SESSION["user_name"], "user_email"));
			$template->assign("my_about", $connect->user_info($_SESSION["user_name"], "user_about"));
			$template->assign("my_commentnotif", $connect->user_info($_SESSION["user_name"], "user_commentnotif"));
			$template->assign("my_weeklynotif", $connect->user_info($_SESSION["user_name"], "user_weeklynotif"));
			$template->assign("my_ip", get_client_ip());
			$template->assign("notifs", $connect->notifications($connect->user_info($_SESSION["user_name"], "user_id")));
			$template->assign("notifs_count", $connect->notifications($connect->user_info($_SESSION["user_name"], "user_id"), 1));

			// User Informations
			$template->assign("user_fullname", htmlspecialchars(stripslashes($connect->user_info($_GET["user_name"], "user_fullname")), ENT_QUOTES, 'ISO-8859-1'));
			$template->assign("user_fullname_suffix", $connect->user_info($_GET["user_name"], "user_fullname").p_suffix($connect->user_info($_GET["user_name"], "user_fullname")));
			$template->assign("user_name", htmlspecialchars(stripslashes($_GET["user_name"]), ENT_QUOTES, 'ISO-8859-1'));
			$template->assign("user_avatar", $connect->user_info($_GET["user_name"], "user_avatar"));
			$template->assign("user_cover", $connect->user_info($_GET["user_name"], "user_cover"));
			$template->assign("user_about", $connect->user_info($_GET["user_name"], "user_about"));
			$template->assign("user_walls", $connect->user_walls());
			$template->assign("user_avatars", $connect->user_avatars());
			$template->assign("user_wallpapers", $connect->user_wallpapers());
			$template->assign("user_themes", $connect->user_themes());
			$template->assign("have_wall", $connect->have_wall());
			$template->assign("is_followed", $connect->is_followed());
			
			if($_GET["do"] == "wall"){
			// Wall Informations
			$template->assign("wall_wallpaper", $connect->wall_info($_GET["wall_domain"], "wall_wallpaper"));
			$template->assign("wall_userid", $connect->wall_userinfo($connect->wall_info($_GET["wall_domain"], "userid_fk"), "user_id"));
			$template->assign("wall_username", htmlspecialchars(strip_tags($connect->wall_userinfo($connect->wall_info($_GET["wall_domain"], "userid_fk"), "user_name")), ENT_QUOTES, 'ISO-8859-1'));
			$template->assign("wall_userfullname", htmlspecialchars(strip_tags($connect->wall_userinfo($connect->wall_info($_GET["wall_domain"], "userid_fk"), "user_fullname")), ENT_QUOTES, 'ISO-8859-1'));
			$template->assign("wall_userfullname_suffix", htmlspecialchars(strip_tags($connect->wall_userinfo($connect->wall_info($_GET["wall_domain"], "userid_fk"), "user_name")), ENT_QUOTES, 'ISO-8859-1').p_suffix(htmlspecialchars(strip_tags($connect->wall_userinfo($connect->wall_info($_GET["wall_domain"], "userid_fk"), "user_name")), ENT_QUOTES, 'ISO-8859-1')));
			$template->assign("wall_userip", $connect->wall_info($_GET["wall_domain"], "user_ip"));
			$template->assign("wall_title", htmlspecialchars(stripslashes($connect->wall_info($_GET["wall_domain"], "wall_title")), ENT_QUOTES, 'ISO-8859-1'));
			$template->assign("wall_desc", htmlspecialchars(stripslashes($connect->wall_info($_GET["wall_domain"], "wall_desc")), ENT_QUOTES, 'ISO-8859-1'));
			$template->assign("wall_avatar", $connect->wall_info($_GET["wall_domain"], "wall_avatar"));
			$template->assign("wall_createdtime", date_tr("d F Y", $connect->wall_info($_GET["wall_domain"], "wall_since")));
			$template->assign("wall_qr", "https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=".$connect->general_settings("url")."/index.php?do=wall&wall_domain=".$_GET["wall_domain"]);
			$template->assign("wall_url", $connect->general_settings("url")."/wall/".$_GET["wall_domain"]);
			$template->assign("wall_domain", $_GET["wall_domain"]);
			$template->assign("wall_authority", $connect->wall_authority($_GET["wall_domain"]));
			$template->assign("wall_authority_e", $connect->wall_info($_GET["wall_domain"], "wall_privacy"));
			$template->assign("wall_moderatedp", $connect->wall_info($_GET["wall_domain"], "wall_moderatedp"));
			$template->assign("wall_notifs", $connect->wall_info($_GET["wall_domain"], "wall_notifs"));
			$template->assign("wall_peoples", $connect->wall_peoples($_GET["wall_domain"]));
			$template->assign("wall_layout", $connect->wall_info($_GET["wall_domain"], "wall_layout"));
			$template->assign("posts", $connect->wall_posts($_GET["wall_domain"]));
			}

			if($_GET["do"] == "search"){
			// Search Informations
			$template->assign("search_keyword", $_GET["src"]);
			}

			// Site Informations
			$template->assign("user_count", $connect->exists("SELECT user_id FROM users", 1));
			$template->assign("wall_count", $connect->exists("SELECT wall_id FROM walls", 1));
			$template->assign("post_count", $connect->exists("SELECT post_id FROM posts", 1));

		$template->assign("content", content($connect->general_settings("theme_url")."/", $template->variables(), $connect));

	$template->render($connect->general_settings("theme"), $connect->general_settings("site_status"));

	if($do == "create"){
		$alphabet = "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPrRsStTuUvVyYzZ0123456789";
		$domain = array();

		for($i = 1; $i <= 12; $i++){
			$rand = rand(0, 55);
			$domain[] = $alphabet[$rand];
		}
		
		if(is_logged_in()){
			$connect->query("INSERT INTO walls (wall_title, userid_fk, wall_wallpaper, wall_avatar, wall_privacy, wall_layout, wall_domain, wall_template) VALUES ('Baþlýksýz', ".$connect->user_info($_SESSION['user_name'], 'user_id').", '".$GLOBALS["site_url"]."/includes/src/user_wallpapers/robots.png', 'none', 7, 0, '".implode($domain)."', 'default')");
		}else {
			$connect->query("INSERT INTO walls (wall_title, userid_fk, user_ip, wall_wallpaper, wall_avatar, wall_privacy, wall_layout, wall_domain, wall_template) VALUES ('Baþlýksýz', '1', '".get_client_ip()."', '".$GLOBALS["site_url"]."/includes/src/user_wallpapers/robots.png', 'none', 7, 0, '".implode($domain)."', 'default')");
		}

		header("Location: /wall/".implode($domain)."#ready");
	}elseif($do == "confirm-email"){
		confirm_email($connect);
	}elseif($_GET["do"] == "wall"){
		$wall_authority = $connect->wall_authority($_GET["wall_domain"]);
		$wall_id = $connect->wall_info($_GET["wall_domain"], "wall_id");
		
		if(strstr($_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'], "/wall") && $connect->exists("SELECT * FROM wall_domains WHERE wallid_fk = '{$wall_id}'") && !isset($_GET["article_id"])){
			$wall_domain = $connect->selectq("SELECT domain FROM wall_domains WHERE wallid_fk = '{$wall_id}'", "domain");
			header("Location: /{$wall_domain}");
		}

		if($wall_authority == "private" && $connect->wall_info($_GET["wall_domain"], "userid_fk") != $connect->user_info($_SESSION["user_name"], "user_id")){
			header("Location: /404");
		}else {
			if(isset($_GET["verify_email"])){
				$user_ip = get_client_ip();
				$wall_id = $connect->wall_info($_GET["wall_domain"], "wall_id");
				$connect->query("UPDATE wall_peoples SET people_ip = '".$user_ip."' WHERE people_email = '".$_GET["verify_email"]."' AND wallid_fk = '".$wall_id."'");
				header("Location: /wall/".$_GET["wall_domain"]."#ready");
			}
		}
	}elseif($do == "delete-wall"){
		delete_wall($connect); 
	}
?>