<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/

## PDO Connection Class ##
class Config {
	## Connection Variables ##
	private $host_name;
	private $mysql_user;
	private $mysql_pass;
	private $db_name;
	private $pdo;
	private $query;

	public function __construct($host_name, $mysql_user, $mysql_pass, $db_name){
		$this->host_name = $host_name;
		$this->mysql_user = $mysql_user;
		$this->mysql_pass = $mysql_pass;
		$this->db_name = $db_name;

		try {
			$this->pdo = new PDO("mysql:host=".$host_name."; dbname=".$db_name."", $mysql_user, $mysql_pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES latin5"));
		}catch(PDOException $e){
			exit("<b>Database Error: </b>".$e->getMessage());
		}
	}

	public function general_settings($param){
		$query = $this->pdo->query("SELECT * FROM general_settings LIMIT 1")->fetch();

		switch ($param) {
			case "path":
				return realpath(".");
			break;

			case "url":
				return $query["site_url"];
			break;

			case "theme_url":
				return $query["site_url"]."/themes/".$query["site_theme"];
			break;

			case "theme":
				return realpath(".")."/themes/".$query["site_theme"];
			break;
			
			case "site_title":
				return $query["site_title"];
			break;

			case "site_desc":
				return $query["site_desc"];
			break;

			case "site_desc_en":
				return $query["site_desc_en"];
			break;

			case "site_keyw":
				return $query["site_keyw"];
			break;

			case "site_favicon":
				return $query["site_favicon"];
			break;

			case "site_status":
				return $query["site_status"];
			break;

			default:
				return false;
				exit();
			break;
		}
	}

	public function query($par){
		$query = $this->pdo->exec($par);
		return $query;
	}

	public function exists($par, $count_p = 0){
		$count = $this->pdo->query($par)->rowCount();
		if($count_p == 0){
			if($count > 0){
				return true;
			}else {
				return false;
			}
		}else {
			return $count;
		}
	}

	public function selectq($q, $par){
		$query = $this->pdo->query($q);
		$count = $query->rowCount();

		if($count > 0){
			$q = $query->fetch();
			return $q[$par];
		}else {
			return false;
		}
	}

	public function user_info($where, $par){
		return $this->selectq("SELECT * FROM users WHERE user_name = '{$where}'", $par);
	}

	public function user_walls($share_mode){
		if(isset($share_mode)){
			if(is_logged_in()){
				$user_id = $this->user_info($_SESSION["user_name"], "user_id");
				$sth = $this->pdo->prepare("SELECT * FROM walls WHERE userid_fk = {$user_id} OR user_ip = '".get_client_ip()."' ORDER BY wall_id DESC; SELECT * FROM wall_peoples INNER JOIN walls ON walls.wall_id = wall_peoples.wallid_fk WHERE people_ip = '".get_client_ip()."' AND people_authority > 1 ORDER BY walls.wall_id DESC; ");
			}else {
				$sth = $this->pdo->prepare("SELECT * FROM walls WHERE userid_fk = 1 AND user_ip = '".get_client_ip()."' ORDER BY wall_id DESC");
			}
			$sth->execute();
			$result = $sth->fetchAll();
			$array = array();
			foreach($result as $key){
				$array[] = array(
					"title" => mb_convert_encoding(xss_protect($key["wall_title"], true), "UTF-8", "ISO-8859-9"),
					"desc" => mb_convert_encoding(xss_protect($key["wall_desc"], true), "UTF-8", "ISO-8859-9"),
					"avatar" => $key["wall_avatar"],
					"id" => $key["wall_id"]
				);
			}
			$sth->nextRowset();
			$result = $sth->fetchAll();
			foreach($result as $key){
				$array[] = array(
					"title" => mb_convert_encoding(xss_protect($key["wall_title"], true), "UTF-8", "ISO-8859-9"),
					"desc" => mb_convert_encoding(xss_protect($key["wall_desc"], true), "UTF-8", "ISO-8859-9"),
					"avatar" => $key["wall_avatar"],
					"id" => $key["wall_id"]
				);
			}
			return json_encode($array, JSON_UNESCAPED_UNICODE);
		}else {
			$user_id = $this->user_info($_GET["user_name"], "user_id");
			$sth = $this->pdo->prepare("SELECT * FROM walls WHERE userid_fk = '{$user_id}' ORDER BY wall_id DESC");
			$sth->execute();
			$count = $sth->rowCount();

			if($count > 0){
				$result = $sth->fetchAll();
				$wall = '';
				$wall .= '<div id="walls">';
				
				foreach($result as $key){
					if(!($key["wall_privacy"] == 0 && ($_GET["user_name"] != $_SESSION["user_name"] && $this->wall_authority($key["wall_domain"]) != "admin"))){
						$wall .= "<div class='box ";
						if($_GET["user_name"] == $_SESSION["user_name"] || $this->wall_authority($key["wall_domain"]) == "admin"){
							$wall .= "edit";
						}

						$wall .= "' style=\"background: url('".$key["wall_wallpaper"]."') repeat scroll 10% 30% rgb(47, 167, 0); \">";
							$wall .= '<a href="'.$this->general_settings("url").'/wall/'.$key["wall_domain"].'" title="Duvara git!"><div class="container">';
								$wall .= $key["wall_avatar"] != "none" ? '<div class="wall_avatar"><img src="'.$key["wall_avatar"].'" /></div>' : null;
								$wall .= '<div style="background-image: url(\''.$key["wall_wallpaper"].'\'); background-size: auto; " class="preview"></div>';
								$wall .= '<h1 ';
								$wall .= $key["wall_desc"] ? null : 'style="border: none; margin-bottom: -17px; "';
								$wall .= '>'.$key["wall_title"].'</h1>';
								$wall .= "<br />";
								$wall .= '<p>'.$key["wall_desc"].'</p>';
								if($_GET["user_name"] == $_SESSION["user_name"] || $this->wall_authority($key["wall_domain"]) == "admin"){
									$wall .= '<div class="wall_edit">
											<div class="settings"><a href="'.$this->general_settings("url").'/wall/'.$key["wall_domain"].'#settings" title="Duvarý düzenle">Duvarý düzenle</a></div>
											<a href="#" title="Duvarý sil" onclick=\'deleteWall("'.$key["wall_domain"].'"); $("#walls").masonry("remove", $(this).parents(".box")).masonry(container, {itemSelector: ".box"}).masonry(container, {itemSelector: ".box"}).masonry("on", "removeComplete", function(){if($("#walls .box").length == 0){location.reload();}}); \'><div class="icon"></div></a></div>';
								}

							$wall .= '</div></a>';
						$wall .= '</div>';
					}
				}
				$wall .= '</div>';

				return $wall;
			}else {
				return false;
			}
		}
	}

	public function user_avatars(){
		if(is_logged_in()){
			$user_id = $this->user_info($_SESSION["user_name"], "user_id");
			$user_ip = get_client_ip();
			$sth = $this->pdo->prepare("SELECT * FROM user_avatars WHERE userid_fk = '{$user_id}' || avatar_ip = '{$user_ip}'");
		}else {
			$user_ip = get_client_ip();
			$sth = $this->pdo->prepare("SELECT * FROM user_avatars WHERE avatar_ip = '{$user_ip}'");
		}
		
		$wall_avatar = $this->wall_info($_GET["wall_domain"], "wall_avatar");

		$sth->execute();
		$count = $sth->rowCount();
		$result = $sth->fetchAll();

		$avatars = '';
		$avatars .= '<div class="avatar none ';
		$avatars .= $wall_avatar == "none" ? 'selected' : null;
		$avatars .= '"><span class="icon"></span><p>HÝÇBÝRÝ</p></div><div class="avatar add"><div class="icon"></div><p>EKLE</p><div class="add_box"><div class="tabs"><span class="selected">1</span><span>2</span><span>3</span></div><div class="content"><div><input type="text"><button>></button><img src=""></div><div>2</div><div>3</div></div></div></div>';
		
		$files = glob($_SERVER["DOCUMENT_ROOT"]."/includes/src/user_wallavatars/*.jpg");

		for($i=0; $i < count($files); $i++){
			$file = $this->general_settings("url")."/includes/src/user_wallavatars/".substr($files[$i], strlen($_SERVER["DOCUMENT_ROOT"]."/includes/src/user_wallavatars/"), strpos($files[$i], '.'));
			$avatars .= '<div class="avatar ';
			$avatars .= $wall_avatar == $file ? 'selected' : null;
			$avatars .= '">';
			$avatars .= '<img src="'.$file.'"></div>';
		}

		foreach($result as $key){
			$avatars .= '<div class="avatar ';
			$avatars .= $wall_avatar == $key["avatar_url"] ? 'selected' : null;
			$avatars .= '">';
			$avatars .= '<img src="'.$key["avatar_url"].'"></div>';
		}

		return $avatars;
	}

	public function user_wallpapers(){
		if(is_logged_in()){
			$user_id = $this->user_info($_SESSION["user_name"], "user_id");
			$user_ip = get_client_ip();
			$sth = $this->pdo->prepare("SELECT * FROM user_wallpapers WHERE userid_fk = '{$user_id}' || wallpaper_ip = '{$user_ip}'");
		}else {
			$user_ip = get_client_ip();
			$sth = $this->pdo->prepare("SELECT * FROM user_wallpapers WHERE wallpaper_ip = '{$user_ip}'");
		}
		
		$wall_wallpaper = $this->wall_info($_GET["wall_domain"], "wall_wallpaper");

		$sth->execute();
		$count = $sth->rowCount();
		$result = $sth->fetchAll();

		$wallpapers = '<div class="wallpaper add"><div class="icon"></div><p>DUVAR KAÐIDI EKLE</p><div class="add_box"><div class="tabs"><span class="selected">1</span><span>2</span><span>3</span></div><div class="content"><div>1</div><div>2</div><div>3</div></div></div></div>';
		$files = glob($_SERVER["DOCUMENT_ROOT"]."/includes/src/user_wallpapers/*.png");

		for($i = 0; $i < count($files); $i++){
			$file = $this->general_settings("url")."/includes/src/user_wallpapers/".substr($files[$i], strlen($_SERVER["DOCUMENT_ROOT"]."/includes/src/user_wallpapers/"), strpos($files[$i], '.'));
			$name = substr($files[$i], strlen($_SERVER["DOCUMENT_ROOT"]."/includes/src/user_wallpapers/"));
			$name = str_replace('_', ' ', preg_replace("/\\.[^.\\s]{3,4}$/", "", $name));
			$wallpapers .= '<div class="wallpaper';
			$wallpapers .= $wall_wallpaper == $file ? ' selected' : null;
			$wallpapers .= '">';
			$wallpapers .= '<div class="img" style="background: url('.$file.')"><div class="w_title">'.$name.'</div></div></div>';
		}

		foreach($result as $key){
			$name = str_replace('_', ' ', preg_replace("/\\.[^.\\s]{3,4}$/", "", preg_replace('/^.+[\\\\\\/]/', '', $key["wallpaper_url"])));
			$wallpapers .= '<div class="wallpaper';
			$wallpapers .= $wall_wallpaper == $key["wallpaper_url"] ? ' selected' : null;
			$wallpapers .= '">';
			$wallpapers .= '<div class="img" style="background: url('.$key["wallpaper_url"].')"><div class="w_title">'.$name.'</div></div></div>';
		}

		return $wallpapers;
	}

	public function user_themes(){
		if(is_logged_in()){
			$user_id = $this->user_info($_SESSION["user_name"], "user_id");
			$user_ip = get_client_ip();
			$sth = $this->pdo->prepare("SELECT * FROM user_themes WHERE userid_fk = '{$user_id}' || theme_ip = '{$user_ip}'");
		}else {
			$user_ip = get_client_ip();
			$sth = $this->pdo->prepare("SELECT * FROM user_themes WHERE theme_ip = '{$user_ip}'");
		}
		
		$wall_theme = $this->wall_info($_GET["wall_domain"], "wall_template");

		$sth->execute();
		$count = $sth->rowCount();
		$result = $sth->fetchAll();

		$themes = '';
		$themes .= '<li';
		$themes .= $wall_theme == "default" ? ' class="selected"' : null;
		$themes .= ' data-name="default">';
		$html = file_get_contents($this->general_settings("url")."/includes/templates/default/index.bwl");
		$dom = new DOMDocument();
		$dom->loadHTML(mb_convert_encoding($html, 'HTML-ENTITIES', 'ISO-8859-9'));
		$theme_options = "";
		foreach($dom->getElementsByTagName("script")->item(0)->childNodes as $child) {
			$theme_options .= $dom->saveHTML($child);
		}
		$theme_options = json_fix(preg_replace("/var theme_options = /i", "", $theme_options));
		$theme_options = json_decode($theme_options);
		$themes .= "<h3>".$theme_options->name."</h3><p>".$theme_options->desc."</p><div>Geliþtirici: <a href='".$theme_options->url."''>".$theme_options->developer."</a></div>";
		$themes .= '<img src="'.$this->general_settings("url")."/includes/templates/default/thumbnail.png".'" /></li>';

		$themes .= '<li';
		$themes .= $wall_theme == "collaboration" ? ' class="selected"' : null;
		$themes .= ' data-name="collaboration">';
		$html = file_get_contents($this->general_settings("url")."/includes/templates/collaboration/index.bwl");
		$dom = new DOMDocument();
		$dom->loadHTML(mb_convert_encoding($html, 'HTML-ENTITIES', 'ISO-8859-9'));
		$theme_options = "";
		foreach($dom->getElementsByTagName("script")->item(0)->childNodes as $child) {
			$theme_options .= $dom->saveHTML($child);
		}
		$theme_options = json_fix(preg_replace("/var theme_options = /i", "", $theme_options));
		$theme_options = json_decode($theme_options);
		$themes .= "<h3>".$theme_options->name."</h3><p>".$theme_options->desc."</p><div>Geliþtirici: <a href='".$theme_options->url."''>".$theme_options->developer."</a></div>";
		$themes .= '<img src="'.$this->general_settings("url")."/includes/templates/collaboration/thumbnail.png".'" /></li>';

		$themes .= '<li';
		$themes .= $wall_theme == "updates" ? ' class="selected"' : null;
		$themes .= ' data-name="updates">';
		$html = file_get_contents($this->general_settings("url")."/includes/templates/updates/index.bwl");
		$dom = new DOMDocument();
		$dom->loadHTML(mb_convert_encoding($html, 'HTML-ENTITIES', 'ISO-8859-9'));
		$theme_options = "";
		foreach($dom->getElementsByTagName("script")->item(0)->childNodes as $child) {
			$theme_options .= $dom->saveHTML($child);
		}
		$theme_options = json_fix(preg_replace("/var theme_options = /i", "", $theme_options));
		$theme_options = json_decode($theme_options);
		$themes .= "<h3>".$theme_options->name."</h3><p>".$theme_options->desc."</p><div>Geliþtirici: <a href='".$theme_options->url."''>".$theme_options->developer."</a></div>";
		$themes .= '<img src="'.$this->general_settings("url")."/includes/templates/updates/thumbnail.png".'" /></li>';

		foreach($result as $key){
			$themes .= '<li';
			$themes .= $wall_theme == $key["theme_name"] ? ' class="selected"' : null;
			$themes .= ' data-name="'.$key["theme_name"].'">';
			$html = file_get_contents($this->general_settings("url")."/includes/templates/".$key["theme_name"]."/index.bwl");
			$dom = new DOMDocument();
			$dom->loadHTML(mb_convert_encoding($html, 'HTML-ENTITIES', 'ISO-8859-9'));
			$theme_options = "";
			foreach($dom->getElementsByTagName("script")->item(0)->childNodes as $child) {
				$theme_options .= $dom->saveHTML($child);
			}
			$theme_options = json_fix(preg_replace("/var theme_options = /i", "", $theme_options));
			$theme_options = json_decode($theme_options);
			$themes .= "<h3>".$theme_options->name."</h3><p>".$theme_options->desc."</p><div>Geliþtirici: <a href='".$theme_options->url."''>".$theme_options->developer."</a></div>";
			$themes .= '<img src="'.$this->general_settings("url")."/includes/templates/".$key["theme_name"]."/thumbnail.png".'" /></li>';
		}

		$themes .= '<li class="add"><div>+</div><span>TEMA YÜKLE</span></li>';
		return $themes;
	}

	public function wall_peoples($wall_domain){
		$wall_id = $this->wall_info($wall_domain, "wall_id");
		$sth = $this->pdo->prepare("SELECT * FROM wall_peoples WHERE wallid_fk = '{$wall_id}'");
		$sth->execute();
		$count = $sth->rowCount();
		$result = $sth->fetchAll();
		$wall_privacy = $this->wall_info($wall_domain, "wall_privacy");

		$peoples = '<script type="text/javascript">window.wall_privacy = '.$wall_privacy.'</script>';
		foreach($result as $key){
			$peoples .= '<li>';
			$peoples .= '<div class="remove"></div>';
			$peoples .= '<p>'.$key["people_email"].'</p>';
			$peoples .= '<div class="selectBox">';
			$peoples .= '<input type="hidden" value="';
			$peoples .= $key["people_authority"] == 1 ? 'can_view' : null;
			$peoples .= $key["people_authority"] == 2 ? 'can_write' : null;
			$peoples .= $key["people_authority"] == 3 ? 'can_read' : null;
			$peoples .= $key["people_authority"] == 4 ? 'can_admin' : null;
			$peoples .=	'" class="price_values">';
			$peoples .= '<span class="selected">';
			$peoples .= $key["people_authority"] == 1 ? 'Görüntüleyebilir' : null;
			$peoples .= $key["people_authority"] == 2 ? 'Yazabilir' : null;
			$peoples .= $key["people_authority"] == 3 ? 'Denetleyebilir' : null;
			$peoples .= $key["people_authority"] == 4 ? 'Yönetebilir' : null;
			$peoples .= '</span>';
			$peoples .= '<span class="selectArrow">&#9660</span>';
			$peoples .= '<ul class="selectOptions">';
			$peoples .= '<li class="selectOption ';
			if($wall_privacy == 0 || $wall_privacy == 1){
				$peoples .= 'selectable';
			}
			$peoples .= '" data-value="can_view">';
			$peoples .= '<h1>Görüntüleyebilir</h1>';
			$peoples .= '<p>Bu duvarý ve paylaþýmlarý görüntüleyebilir. Ama duvarý denetleyemez, yeni paylaþýmlar yapamaz ve mevcut paylaþýmlarý düzenleyemez. Duvar ayarlarýný deðiþtiremez</p>';
			$peoples .= '</li>';
			$peoples .= '<li class="selectOption ';
			if($wall_privacy == 0 || $wall_privacy == 1 || $wall_privacy == 2 || $wall_privacy == 4 || $wall_privacy == 7){
				$peoples .= 'selectable';
			}
			$peoples .= '" data-value="can_write">';
			$peoples .= '<h1>Yazabilir</h1>';
			$peoples .= '<p>Bu duvarý görüntüleyebilir ve duvarda paylaþým yapabilir. Sadece kendi paylaþýmlarýný düzenleyebilir, diðer kiþilerin paylaþtýklarýný düzenleyemez. Duvar ayarlarýný deðiþtiremez.</p>';
			$peoples .= '</li>';
			$peoples .= '<li class="selectOption ';
			if($wall_privacy != 6 && $wall_privacy != 9){
				$peoples .= 'selectable';
			}
			$peoples .= '" data-value="can_read">';
			$peoples .= '<h1>Denetleyebilir</h1>';
			$peoples .= '<p>Bu duvarý görüntüleyebilir ve duvarda paylaþým yapabilir. Denetlemeyi gerektiren paylaþýmlarý düzenleyebilir ve onaylayabilir. Ama duvar ayarlarýný deðiþtiremez.</p>';
			$peoples .= '</li>';
			$peoples .= '<li class="selectOption selectable" data-value="can_admin">';
			$peoples .= '<h1>Yönetebilir</h1>';
			$peoples .= '<p>Duvardaki yetkileri sýnýrsýzdýr. Duvar ayarlarýný deðiþtirebilir, duvarý silebilir, görüntüleyebilir, yazabilir, düzenleyebilir, denetleyebilir.</p>';
			$peoples .= '</li>';
			$peoples .= '</ul>';
			$peoples .= '</div>';
			$peoples .= '</li>';
		}

		return $peoples;
	}

	public function have_wall(){
		$user_id = $this->user_info($_GET["user_name"], "user_id");
		$sth = $this->pdo->query("SELECT * FROM walls WHERE userid_fk = '{$user_id}'");
		$count = $sth->rowCount();

		if($count > 0){
			return true;
		}else {
			return false;
		}
	}

	public function wall_info($where, $par){
		return $this->selectq("SELECT * FROM walls WHERE wall_domain = '{$where}'", $par);
	}

	public function wall_userinfo($where, $par){
		return $this->selectq("SELECT * FROM users WHERE user_id = '{$where}'", $par);
	}

	public function wall_posts($wall_domain){
		if(!isset($wall_domain)){
			$wall_domain = $_GET["wall_domain"];
		}
		$posts .= "<div class='post_loader'>";
		$posts .= file_get_contents($this->general_settings("url")."/includes/templates/".$this->wall_info($wall_domain, "wall_template")."/index.bwl");
		$posts .= '<link type="text/css" rel="stylesheet" href="'.$this->general_settings("url")."/includes/templates/".$this->wall_info($wall_domain, "wall_template")."/style.css".'" /><script type="text/javascript" src="'.$this->general_settings("url")."/includes/templates/".$this->wall_info($wall_domain, "wall_template")."/script.js".'"></script><script type="text/javascript">theme_options.thumbnail = "'.$this->general_settings("url")."/includes/templates/".$this->wall_info($wall_domain, "wall_template")."/thumbnail.png".'"; </script>';
		$posts .= '<div class="posts"></div>';
		$posts .= "
		<script type='text/javascript' src='".$this->general_settings("url").":8000/socket.io/socket.io.js'></script>
		<script type='text/javascript'>
			$(document).ready(function(){
				$(post_path).hide();
				window.socket = io.connect('".$this->general_settings("url").":8000');
				var lastList = '';
				window.socket.emit('posts', '".$this->wall_info($wall_domain, "wall_id")."').on('notification', function(data){
					$('#preloader').hide();
					if(data.wall_id == '".$this->wall_info($wall_domain, "wall_id")."'){
						var postsList = '';

						$.each(data.posts, function(index, post){
							postsList += $(post_path).html().replace(/{title}/g, post.post_title).replace(/{subtitle}/g, post.post_subtitle).replace(/{content}/g, post.post_content).replace(/{like}/g, post.post_like).replace(/{hit}/g, post.post_hit).replace(/{width}/g, post.post_width).replace(/{width}/g, post.post_width).replace(/{x}/g, post.post_x).replace(/{y}/g, post.post_y).replace(/{z}/g, post.post_z).replace(/{color}/g, '#' + post.post_color).replace(/{created_time}/g, post.post_created).replace(/{updated_time}/g, post.post_updated).replace(/{id}/g, post.post_id);
								if(post.post_ip == '".get_client_ip()."' || '".$this->wall_authority($wall_domain)."' == 'moderate' || '".$this->wall_authority($wall_domain)."' == 'p_moderate' || '".$this->wall_authority($wall_domain)."' == 'h_moderate' || '".$this->wall_authority($wall_domain)."' == 'e_moderate' || '".$this->wall_authority($wall_domain)."' == 'admin'";
									if(is_logged_in()){
										$posts .= "|| '".$this->wall_info($wall_domain, "userid_fk")."' == ".$this->user_info($_SESSION['user_name'], 'user_id')." || post.userid_fk == ".$this->user_info($_SESSION['user_name'], 'user_id');
									}
									$posts .= "){
									if(post.user_idfk == undefined){
										postsList = postsList.replace(/{is_editable}/g, 'editable');
									}else {
										postsList = postsList.replace(/{is_editable}/g, '');
									}
								}else {
									postsList = postsList.replace(/{is_editable}/g, '');
								}
						});
						
						if(lastList != postsList){
							$('.posts').html(postsList);
							if(theme_options.reverse){
								$('.posts').children().each(function(){
									$(this).insertBefore($('.posts').children().eq(0));
								});
							}
						}
						
						lastList = postsList;
					}
				});
			});
		</script>";
		$posts = preg_replace("/{wall_title}/", htmlspecialchars(stripslashes($this->wall_info($wall_domain, "wall_title")), ENT_QUOTES, 'ISO-8859-1'), $posts);
		$posts = preg_replace("/{wall_desc}/", htmlspecialchars(stripslashes($this->wall_info($wall_domain, "wall_desc")), ENT_QUOTES, 'ISO-8859-1'), $posts);
		$posts = preg_replace("/{wall_avatar}/", $this->wall_info($wall_domain, "wall_avatar"), $posts);
		if($this->wall_info($wall_domain, "wall_layout") == 0){
			$posts = preg_replace("/{is_freeform}/", 1, $posts);
		}else {
			$posts = preg_replace("/{is_freeform}/", 0, $posts);		
		}
		if(!preg_match("/view/", $this->wall_authority($wall_domain))){
			$posts = preg_replace("/{is_writable}/", 1, $posts);
		}elseif($this->user_info($_SESSION["user_name"], "user_id") == $this->wall_info($wall_domain, "userid_fk")){
			$posts = preg_replace("/{is_writable}/", 1, $posts);
		}else {
			$posts = preg_replace("/{is_writable}/", 0, $posts);
		}
		$posts = preg_replace("/\<\!\-\- if (.*) \-\-\>/", "<?php if($1): ?>", $posts);
		$posts = preg_replace("/\<\!\-\- else \-\-\>/", "<?php else: ?>", $posts);
		$posts = preg_replace("/\<\!\-\- endif \-\-\>/", "<?php endif; ?>", $posts);
		$posts .= '<ul class="settings"><li data-obj=\'{"name":"undo"}\'><a href="#"><i></i></a></li><li data-obj=\'{"name":"redo"}\'><a href="#"><i></i></a></li><li data-obj=\'{"name":"FontSize", "arg":"2"}\'><a href="#">A<span>-</span></a></li><li data-obj=\'{"name":"FontSize", "arg":"4"}\'><a href="#">A<span>+</span></a></li><li data-obj=\'{"name":"bold"}\'><a href="#"><b>B</b></a></li><li data-obj=\'{"name":"underline"}\'><a href="#"><u>U</u></a></li><li data-obj=\'{"name":"italic"}\'><a href="#"><i>I</i></a></li><li data-obj=\'{"name":"insertOrderedList"}\'><a href="#" ><i><span>1</span><span>2</span><span>3</span></i></a></li><li data-obj=\'{"name":"InsertUnorderedList"}\'><a href="#" ><i></i></a></li><li><a href="#"><div></div><span class="prompt"><input type="text" placeholder="Link adresi girin. " /><button>+</button></span></a></li><li><a href="#"><div></div></a></li><li data-obj=\'{"name":"justifyLeft"}\'><a href="#">___<br>_<br>__</a></li><li data-obj=\'{"name":"justifyCenter"}\'><a href="#">___<br>_<br>__</a></li><li data-obj=\'{"name":"justifyRight"}\'><a href="#">___<br>_<br>__</a></li><li><a href="#"><span class="prompt"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></a></li><span class="prompt"><p>Resmi buraya sürekleyin <span>veya</span></p><input type="file" accept="image/x-png, image/gif, image/jpeg" /></span></ul>';
		$posts .= "</div>";

		eval(" ?>".$posts."<?php ");
	}

	public function is_followed(){
		if(isset($_SESSION["login"])){
			$follower = $this->user_info($_SESSION["user_name"], "user_id");
			$followed = $this->user_info($_GET["user_name"], "user_id");
			if($this->exists("SELECT * FROM following WHERE following_follower = '{$follower}' AND following_followed = '{$followed}'")){
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}

	public function wall_authority($wall_domain){
		if(!isset($wall_domain)){
			$wall_domain = $_GET["wall_domain"];
		}

		$user_ip = get_client_ip();
		$wall_ip = $this->wall_info($wall_domain, "user_ip");
		$wall_id = $this->wall_info($wall_domain, "wall_id");
		$sth = $this->pdo->query("SELECT * FROM wall_peoples WHERE wallid_fk = '{$wall_id}' AND people_ip = '{$user_ip}'");
		$count = $sth->rowCount();

		if($count > 0 || $user_ip == $wall_ip){
			$q = $sth->fetch();
			$p = $q["people_authority"];

			if($p == "1"){
				return "view";
			}elseif($p == "2"){
				return "write";
			}elseif($p == "3"){
				return "moderate";
			}elseif($p == "4"){
				return "admin";
			}
		}else {
			$user_id = $this->user_info($_SESSION["user_name"], "user_id");
			$pth = $this->pdo->query("SELECT * FROM wall_pass WHERE wallid_fk = '{$wall_id}' AND pass_ip = '{$user_ip}' || userid_fk = '{$user_id}'");
			$c = $pth->rowCount();
			$a = $this->wall_info($wall_domain, "wall_privacy");

			if($c > 0){
				if($a == "1"){
					return "view";
				}elseif($a == "2"){
					return "write";
				}elseif($a == "3"){
					return "moderate";
				}
			}else {
				if($a == "0"){
					return "private";
				}elseif($a == "1"){
					return "p_view";
				}elseif($a == "2"){
					return "p_write";
				}elseif($a == "3"){
					return "p_moderate";
				}elseif($a == "4"){
					return "h_view";
				}elseif($a == "5"){
					return "h_write";
				}elseif($a == "6"){
					return "h_moderate";
				}elseif($a == "7"){
					return "e_view";
				}elseif($a == "8"){
					return "e_write";
				}elseif($a == "9"){
					return "e_moderate";
				}
			}
		}
	}

	public function discover($type = "posts"){
		if(is_logged_in()){
			$user_id = $this->user_info($_SESSION["user_name"], "user_id");
		}else {
			$user_id = 1;
		}
		if($type == "posts"){
			$sth = $this->pdo->prepare("SELECT posts.* FROM posts INNER JOIN following ON posts.userid_fk = following.following_followed WHERE following.following_follower = {$user_id} ORDER BY posts.post_created DESC");
		}elseif($type == "walls"){
			$sth = $this->pdo->prepare("SELECT walls.* FROM walls INNER JOIN following ON walls.userid_fk = following.following_followed WHERE following.following_follower = {$user_id} ORDER BY walls.wall_since DESC");
		}else {
			return false;
		}
		$sth->execute();
		$result = $sth->fetchAll();
		return $result;
	}

	public function suggestions($limit){
		$sth = $this->pdo->prepare("SELECT users.* FROM users INNER JOIN posts ON posts.userid_fk = users.user_id GROUP BY users.user_id ORDER BY posts.post_hit DESC LIMIT {$limit}");
		$sth->execute();
		$result = $sth->fetchAll();
		return $result;
	}

	public function followings(){
		$sth = $this->pdo->prepare("SELECT following_followed FROM following WHERE following_follower = ".$this->user_info($_SESSION["user_name"], "user_id"));
		$sth->execute();
		$result = $sth->fetchAll();
		return $result;
	}

	public function search($src, $type){
		if(is_logged_in()){
			$user_id = $this->user_info($_SESSION["user_name"], "user_id");
		}else {
			$user_id = 1;
		}
		if($type == "posts"){
			$sth = $this->pdo->prepare("SELECT posts.* FROM posts INNER JOIN following ON posts.userid_fk = following.following_followed WHERE following.following_follower = {$user_id} AND posts.post_title LIKE '%".$src."%' OR posts.post_subtitle LIKE '%".$src."%' ORDER BY posts.post_created DESC");
		}elseif($type == "walls"){
			$sth = $this->pdo->prepare("SELECT walls.* FROM walls INNER JOIN following ON walls.userid_fk = following.following_followed WHERE following.following_follower = {$user_id} AND walls.wall_title LIKE '%".$src."%' OR walls.wall_desc LIKE '%".$src."%' ORDER BY walls.wall_since DESC");
		}else {
			return false;
		}
		$sth->execute();
		$result = $sth->fetchAll();
		return $result;
	}

	public function notifications($user_id, $t = 0){
		if($t == 0){
			$sth = $this->pdo->prepare("SELECT notifications.* FROM notifications INNER JOIN users ON notifications.userid_fk = users.user_id WHERE notifications.userid_fk = {$user_id} ORDER BY notifications.notif_time DESC LIMIT 6");
			$sth->execute();
			$result = $sth->fetchAll();
			$notifs = "";
			foreach($result as $key){
				$notifs .= "<a href='".$key["notif_href"]."'>";
				$notifs .= "<li data-id='".$key["notif_id"]."' class='type".$key["notif_type"];
				$notifs .= $key["notif_isread"] == 1 ? null : " unread";
				$notifs .= "'>";
				$notifs .= "<span></span><p>".$key["notif_text"]."<i> &mid; ".distanceOfTimeInWords_tr($key["notif_time"])."</i></p>";
				$notifs .= "</li>";
				$notifs .= "</a>";
			}
			$notifs .= "<a><li style='font-weight: bold; cursor: pointer; height: 10px; padding: 15px; ' onclick='notif_read_all(); '>Tümü okundu</li></a>";
			return $notifs;
		}else {
			$sth = $this->pdo->prepare("SELECT notifications.* FROM notifications INNER JOIN users ON notifications.userid_fk = users.user_id WHERE notifications.userid_fk = {$user_id} AND notifications.notif_isread = 0 ORDER BY notifications.notif_time DESC");
			$sth->execute();
			$result = $sth->fetchAll();
			return count($result);
		}
	}
}

## Template Class ##
class Template {
	private $vars = array();

	public function assign($key, $value){
		$this->vars[$key] = $value;
	}

	public function render($template = v1, $site_status = 1){
		if($site_status){
			$path = $template."/homepage.tpl";
		}else {
			$path = $template."/close.tpl";
		}

		if(file_exists($path)){
			$contents = file_get_contents($path);
			foreach($this->vars as $key => $value){
				$contents = preg_replace("/\[".$key."\]/", $value, $contents);
			}

			$contents = preg_replace("/\<\!\-\- if (.*) \-\-\>/", "<?php if($1): ?>", $contents);
			$contents = preg_replace("/\<\!\-\- else \-\-\>/", "<?php else: ?>", $contents);
			$contents = preg_replace("/\<\!\-\- endif \-\-\>/", "<?php endif; ?>", $contents);

			eval(" ?>".$contents."<?php ");
		}else {
			exit("<b>".$path."</b> doesn't found :/");
		}
	}

	public function variables(){
		return $this->vars;
	}
}

## Site Title Function ##
function site_title($title, $desc){
	$do = @$_GET["do"];

	switch($do){
		case "login":
			return $title." / Giriþ Yap";
		break;

		case "resend_password":
			return $title." / Þifreyi Yeniden Gönder";
		break;

		case "sign-up":
			return $title." / Kayýt Ol";
		break;

		case "profile":
			return $GLOBALS["user_fullname"]." / ".$title;
		break;

		case "settings":
			return "Hesap Ayarlarý / ".$title;
		break;

		case "delete-account":
			return "Hesabýný Sil / ".$title;
		break;

		case "404":
			return $title." / Sayfa Bulunamadý!";
		break;

		case "welcome":
			return $title." / Hoþ Geldin";
		break;

		case "wall";
			return $GLOBALS["wall_title"]." / ".$title;
		break;

		case "about";
			return $title." / Hakkýnda";
		break;

		case "terms";
			return $title." / Gizlilik ve Kullaným";
		break;

		case "contact";
			return $title." / Ýletiþim";
		break;

		case "faq";
			return $title." / Sýkça Sorulan Sorular";
		break;

		case "discover";
			return $title." / Keþfet";
		break;


		case "platforms";
			return $title." / Platformlar";
		break;

		default:
			return $title." / ".$desc;
		break;
	}
}

## Content Function ##
function content($template, $vars, $connect){
	$do = @$_GET["do"];
	$file = @file_get_contents($template."{$do}.tpl");
	if((($do == "sign-up" || $do == "login" || $do == "resend_password") && is_logged_in()) || $do == "welcome" && !is_logged_in()){
		header("Location: index.php");
	}

	if($do == "log-out"){
		log_out();
	}

	if($do == "profile" && ($GLOBALS["user_fullname"] == "" || $GLOBALS["user_fullname"] == "Ýsimsiz")){
		header("Location: /404");
	}

	if($do == "wall" && $GLOBALS["wall_title"] == ""){
		header("Location: /404");
	}

	if(($do == "settings" || $do == "delete-account") && !is_logged_in()){
		header("Location: index.php?do=login");
	}

	if(isset($_GET['ref'])){
		$ref = $_GET['ref'];
		switch($ref){
			case 'verify':
				info("Hesap aktifleþtirildi!", "Hesabýn aktif durumda artýk giriþ yapabilirsin...");
			break;
		}
	}

	if(!$file){
		$file = file_get_contents($template."default.tpl");
	}

	foreach($vars as $key => $value){
		$file = preg_replace("/\[".$key."\]/", $value, $file);
	}

	$file = preg_replace("/\<\!\-\- if (.*) \-\-\>/", "<?php if($1) : ?>", $file);
	$file = preg_replace("/\<\!\-\- else \-\-\>/", "<?php else : ?>", $file);
	$file = preg_replace("/\<\!\-\- endif \-\-\>/", "<?php endif; ?>", $file);
	if($do == "discover"){
		if(empty($connect->discover("walls"))){
			$file = preg_replace("/\[is_exists\]/", 0, $file);
		}else {
			$file = preg_replace("/\[is_exists\]/", 1, $file);
			$file = preg_replace("/\<\!\-\- while_posts \-\-\>/", '<?php foreach($connect->discover("posts") as $key){ ?>', $file);
			$file = preg_replace("/\<\!\-\- while_walls \-\-\>/", '<?php foreach($connect->discover("walls") as $key){ ?>', $file);
			$file = preg_replace("/\<\!\-\- endwhile \-\-\>/", '<?php } ?>', $file);
			$file = preg_replace("/\{(.*)\}/", '<?php switch("$1"){case "post_user_avatar": echo $connect->selectq("SELECT user_avatar FROM users WHERE user_id = ".$key["userid_fk"], "user_avatar"); break; case "post_user_name": echo $connect->selectq("SELECT user_name FROM users WHERE user_id = ".$key["userid_fk"], "user_name"); break; case "post_wall_domain": echo $connect->selectq("SELECT wall_domain FROM walls WHERE wall_id = ".$key["wallid_fk"], "wall_domain"); break; case "post_wall_authority": echo $connect->wall_authority($connect->selectq("SELECT wall_domain FROM walls WHERE wall_id = ".$key["wallid_fk"], "wall_domain")); break; case "wall_user_name": echo $connect->selectq("SELECT user_name FROM users WHERE user_id = ".$key["userid_fk"], "user_name"); break; case "wall_authority": echo $connect->wall_authority($key["wall_domain"]); break; default: echo $key["$1"]; break;} ?>', $file);
		}

		$suggestions = '';
		if(empty($connect->followings())){
			foreach($connect->suggestions(100) as $key){
				if($key["user_id"] != 1 && $key["user_id"] != $connect->user_info($_SESSION["user_name"], "user_id")){
					$suggestions .= '<li style="background: url('.$key["user_avatar"].') rgba(0, 0, 0, 0.1); background-size: cover; background-position: center center; "><div data-id="'.$key["user_name"].'"><div>+</div></div><a href="'.$connect->general_settings("url").'/users/'.$key["user_name"].'">'.$key["user_fullname"].'</a></li>';
				}
			}
		}else {
			$followings = array();
			foreach($connect->followings() as $keyb){
				$followings[] = $keyb["following_followed"];
			}
			foreach($connect->suggestions(100) as $key){
				$is_followed = 0;
				foreach($followings as $follow){
					if($follow == $key["user_id"]){
						$is_followed = 1;
					}
				}
				if($key["user_id"] != 1 && $key["user_id"] != $connect->user_info($_SESSION["user_name"], "user_id") && $is_followed == 0){
					$suggestions .= '<li style="background: url('.$key["user_avatar"].') rgba(0, 0, 0, 0.1); background-size: cover; background-position: center center; "><div data-id="'.$key["user_name"].'"><div>+</div></div><a href="'.$connect->general_settings("url").'/users/'.$key["user_name"].'">'.$key["user_fullname"].'</a></li>';
				}
				$is_followed = 0;
			}
			if(empty($suggestions)){
				$suggestions .= '<div class="errormessage">takip edecek kiþi kalmadý :/<p>Veritabanýnda sana gösterebileceðimiz popüler kiþileri takip ettin.</p><div class="icon"></div></div>';
			}
		}
		
		$file = preg_replace("/\[suggestions\]/", $suggestions, $file);
	}elseif($do == "search"){
		if(empty($connect->search($_GET["src"], "posts")) && empty($connect->search($_GET["src"], "walls"))){
			$file = preg_replace("/\[is_exists\]/", 0, $file);
		}else {
			$file = preg_replace("/\[is_exists\]/", 1, $file);
			$file = preg_replace("/\<\!\-\- while_posts \-\-\>/", '<?php foreach($connect->search("'.$_GET["src"].'", "posts") as $key){ ?>', $file);
			$file = preg_replace("/\<\!\-\- while_walls \-\-\>/", '<?php foreach($connect->search("'.$_GET["src"].'", "walls") as $key){ ?>', $file);
			$file = preg_replace("/\<\!\-\- endwhile \-\-\>/", '<?php } ?>', $file);
			$file = preg_replace("/\{(.*)\}/", '<?php switch("$1"){case "post_user_name": echo $connect->selectq("SELECT user_name FROM users WHERE user_id = ".$key["userid_fk"], "user_name"); break; case "post_wall_domain": echo $connect->selectq("SELECT wall_domain FROM walls WHERE wall_id = ".$key["wallid_fk"], "wall_domain"); break; case "post_wall_authority": echo $connect->wall_authority($connect->selectq("SELECT wall_domain FROM walls WHERE wall_id = ".$key["wallid_fk"], "wall_domain")); break; case "wall_user_name": echo $connect->selectq("SELECT user_name FROM users WHERE user_id = ".$key["userid_fk"], "user_name"); break; case "wall_authority": echo $connect->wall_authority($key["wall_domain"]); break; default: echo strip_tags(stripslashes($key["$1"])); break;} ?>', $file);
		}
	}
	
	eval(" ?>".$file."<?php ");
}

## Style File Function ##
function style_file($template){
	 $style_file = $template."css/".@$_GET["do"].".css";
	 if(!@file_get_contents($style_file)){
	 	$style_file = $template."css/homepage.css";
	 }
	 
	 return $style_file;
}

## JavaScript File Function ##
function js_file($template){
	 $js_file = $template."js/".@$_GET["do"].".js";
	 if(file_get_contents($js_file)){
	 	return $js_file;
	 }
}

## Creating Session Function ##
function create_session($par){
	foreach ($par as $anahtar => $deger) {
		$_SESSION[$anahtar] = $deger;
	}
}

## Is User Logged In Function ##
function is_logged_in(){
	if(isset($_SESSION["login"])){
		return true;
	}else {
		return false;
	}
}

## Log Out Function ##
function log_out(){
	$_SESSION = array();
	session_destroy();

	header("Location: index.php");
}

## Possessive Suffix Function ##
function p_suffix($ad){
	$buyuk = array("A", "I", "E", "i", "U","O", "Ü", "Ö");
	$kucuk = array("a", "ý", "e", "i", "u","o", "ü", "ö");
	$kucultulmus = str_replace($buyuk, $kucuk, $ad);

	$isim=trim($kucultulmus);
	$sonharf = substr($isim, -1);
	$bugcheckkaynak = array("ý", "ö", "ü");
	$bugcheckhedef = array("a", "`", "`");
	$bugfixed=str_replace($bugcheckkaynak, $bugcheckhedef, $isim);
	preg_match_all('/[aeiou`]/', $bugfixed, $bulunanlar);
	$sesliler=$bulunanlar[0];
	$sonsesli=end($sesliler);

	if ($sonharf=="a" or $sonharf=="ý") {$eki="'nýn";}
	elseif ($sonharf=="e" or $sonharf=="i") {$eki="'nin";}
	elseif ($sonharf=="u" or $sonharf=="o") {$eki="'nun";}
	elseif ($sonharf=="ü" or $sonharf=="ö") {$eki="'nün";}

	elseif ($sonsesli=="a" or $sonsesli=="ý") {$eki="'ýn";}
	elseif ($sonsesli=="e" or $sonsesli=="i") {$eki="'in";}
	elseif ($sonsesli=="u" or $sonsesli=="o") {$eki="'un";}
	elseif ($sonsesli=="`" ) {$eki="'ün";}
	else  {$eki="'ýn";}

	return $eki;
}

## Client IP Getting Function ##
function get_client_ip(){
	$ipaddress = '';
	if (getenv('HTTP_CLIENT_IP'))
		$ipaddress = getenv('HTTP_CLIENT_IP');
	else if(getenv('HTTP_X_FORWARDED_FOR'))
		$ipaddress = getenv('HTTP_X_FORWARDED_FOR');
	else if(getenv('HTTP_X_FORWARDED'))
		$ipaddress = getenv('HTTP_X_FORWARDED');
	else if(getenv('HTTP_FORWARDED_FOR'))
		$ipaddress = getenv('HTTP_FORWARDED_FOR');
	else if(getenv('HTTP_FORWARDED'))
		$ipaddress = getenv('HTTP_FORWARDED');
	else if(getenv('REMOTE_ADDR'))
		$ipaddress = getenv('REMOTE_ADDR');
	else
		$ipaddress = 'UNKNOWN';
	return $ipaddress;
}

## Date to Turkish Converter Function ##
function date_tr($f, $zt = 'now'){
	$z = date("$f", strtotime($zt));
	$convert = array(
		'Monday'	=> 'Pazartesi',
		'Tuesday'	=> 'Salý',
		'Wednesday'	=> 'Çarþamba',
		'Thursday'	=> 'Perþembe',
		'Friday'	=> 'Cuma',
		'Saturday'	=> 'Cumartesi',
		'Sunday'	=> 'Pazar',
		'January'	=> 'Ocak',
		'February'	=> 'Þubat',
		'March'		=> 'Mart',
		'April'		=> 'Nisan',
		'May'		=> 'Mayýs',
		'June'		=> 'Haziran',
		'July'		=> 'Temmuz',
		'August'	=> 'Aðustos',
		'September'	=> 'Eylül',
		'October'	=> 'Ekim',
		'November'	=> 'Kasým',
		'December'	=> 'Aralýk',
		'Mon'		=> 'Pts',
		'Tue'		=> 'Sal',
		'Wed'		=> 'Çar',
		'Thu'		=> 'Per',
		'Fri'		=> 'Cum',
		'Sat'		=> 'Cts',
		'Sun'		=> 'Paz',
		'Jan'		=> 'Oca',
		'Feb'		=> 'Þub',
		'Mar'		=> 'Mar',
		'Apr'		=> 'Nis',
		'Jun'		=> 'Haz',
		'Jul'		=> 'Tem',
		'Aug'		=> 'Aðu',
		'Sep'		=> 'Eyl',
		'Oct'		=> 'Eki',
		'Nov'		=> 'Kas',
		'Dec'		=> 'Ara',
	);
	foreach($convert as $en => $tr){
		$z = str_replace($en, $tr, $z);
	}
	if(strpos($z, 'Mayýs') !== false && strpos($f, 'F') === false) $z = str_replace('Mayýs', 'May', $z);
	return $z;
}

## E-Mail Function ##
function bmail($content, $subject, $title, $to, $template){
	$g_mail = $GLOBALS["site_email"];
	$g_name = $GLOBALS["site_title"];
	$site_url = $GLOBALS["site_url"];
	
	$message = file_get_contents($template."/email.tpl");
	$message = preg_replace("/\[content\]/", $content, $message);
	$message = preg_replace("/\[subject\]/", $subject, $message);
	$message = preg_replace("/\[homepage\]/", $site_url, $message);
	
	$header = "From: $g_name <".$g_mail.">\n"; 
	$header .= "Reply-To: $g_name <".$g_mail.">\n";
	$header .= "Return-Path: $g_name <".$g_mail.">\n";  
	$header .= "Delivered-to:  $g_name <".$g_mail.">\n";
	$header .= "Date: ".date(r)."\n";
	$header .= "Content-Type: text/html; charset=iso-8859-9\n";   
	$header .= "MIME-Version: 1.0\n";
	$header .= "Importance: Normal\n";
	$header .= "X-Sender: $g_name <".$g_mail.">\n";   
	$header .= "X-Priority: 3\n";   
	$header .= "X-MSMail-Priority: Normal\n";
	$header .= "X-Mailer: Microsoft Office Outlook, Build 11.0.5510\n";
	// $header .= "Disposition-Notification-To: $g_name <".$g_mail.">\n";
	$header .= "X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2869\n";

	mail($to, $title, $message, $header);
}

## E-Mail Verification Function ##
function confirm_email($con_class){
	if(isset($_GET["email"]) && !empty($_GET['email']) AND isset($_GET['code']) && !empty($_GET['code'])){  
		$email = mysql_escape_string($_GET['email']);
		$hash = mysql_escape_string($_GET['code']);

		$control = $con_class->exists("SELECT user_email, user_hash, user_rank FROM users WHERE user_email = '".$email."' AND user_hash = '".$hash."' AND user_rank = '0'");
		if($control == 1){
			$con_class->query("UPDATE users SET user_rank = '1' WHERE user_email = '".$email."' AND user_hash = '".$hash."' AND user_rank = '0'");
			header("Location: ?do=login&ref=verify");
		}else {
			header("Location: index.php");
		}
	}else{  
		header("Location: index.php");
	}
}

## Deleting Wall Function ##
function delete_wall($con_class){
	if(isset($_GET["wall_domain"])){  
		$wall_domain = mysql_escape_string($_GET['wall_domain']);
		$user_ip = get_client_ip();
		$user_name = $con_class->selectq("SELECT * FROM users WHERE user_id = '".$con_class->wall_info($_GET["wall_domain"], "userid_fk")."'", "user_name");

		if($user_name != $_SESSION["user_name"] && $con_class->wall_info($_GET["wall_domain"], "user_ip") != $user_ip && $con_class->wall_authority($_GET["wall_domain"]) != "admin"){
			header("Location: /index.php");
		}else {
			$con_class->query("DELETE FROM walls WHERE wall_domain = '{$wall_domain}'");
			header("Location: /index.php");
		}
	}else{  
		header("Location: /index.php");
	}
}

## Information Function ##
function info($title, $desc, $type = "info"){
	if($type == "info"){
		echo "<!-- INFO -->";
		echo '<div class="notify"><b>'.$title.'</b><br /><p style="margin-top: 4px; ">'.$desc.'</p></div>';
		echo "<!-- [END]INFO -->";
	}elseif($type == "error"){
		echo "<!-- ERROR -->";
		echo '<div class="notify error"><b>'.$title.'</b><br /><p style="margin-top: 4px; ">'.$desc.'</p></div>';
		echo "<!-- [END]ERROR -->";
	}
}

## JSON Decode Function ##
function json_fix($j){
	$j = trim($j);
	$j = ltrim($j, '(');
	$j = rtrim($j, ')');
	$a = preg_split('#(?<!\\\\)\"#', $j);
	for($i=0; $i < count( $a ); $i+=2){
		$s = $a[$i];
		$s = preg_replace('#([^\s\[\]\{\}\:\,]+):#', '"\1":', $s);
		$a[$i] = $s;
	}
	$j = implode('"', $a);
	return $j;
}

## XSS Protection Function ##
function xss_protect($data, $strip_tags = false, $allowed_tags = ""){ 
	if($strip_tags){
		$data = strip_tags($data, $allowed_tags."<b>");
	}

	if(stripos($data, "script") !== false){
		$result = str_replace("script","scr<b></b>ipt", htmlspecialchars($data, ENT_QUOTES, 'ISO-8859-1'));
	}else { 
		$result = htmlspecialchars($data, ENT_QUOTES, 'ISO-8859-1');
	}

	return $result;
}

function distanceOfTimeInWords_tr($time){
	date_default_timezone_set('Europe/Istanbul');
	$time_difference = time() - strtotime($time);
	$seconds = $time_difference;
	$minutes = round($time_difference / 60);
	$hours = round($time_difference / 3600);
	$days = round($time_difference / 86400);
	$weeks = round($time_difference / 604800);
	$months = round($time_difference / 2419200);
	$years = round($time_difference / 29030400);

	if($seconds <= 60){
		return "$seconds saniye önce";
	}else if($minutes <= 60){
		return "$minutes dakika önce";
	}else if($hours <= 24){
		return "$hours saat önce";
	}else if($days <= 7){
		return "$days gün önce";
	}else if($weeks <= 4){
		return "$weeks hafta önce";
	}else if($months <= 12){
		return "$months ay önce";
	}else {
		return "$years yýl önce";
	}
}
?>