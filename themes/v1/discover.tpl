<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir �eyler ara..." value="Ke�fet" lang="tr">
		<button class="icon"></button>
	</form>

	<!-- if is_logged_in() -->
	<span>
		<div class="dark_line"></div>
		<p>[my_fullname]</p>
		<img src="[my_avatar]">
	</span>

	<span class="notification">
		<span class="icon"></span>
		<span class="icon"></span>
		<span class="e">[notifs_count]</span>
	</span>

	<a href="[homepage]/create" class="create">+</a>

	<div class="notification">
		[notifs]
	</div>

	<div class="account">
		<a href="[homepage]/users/[my_username]"><span lang="tr"><div class="icon"></div>Profilim</span></a>
		<a href="[homepage]/settings"><span lang="tr"><div class="icon"></div>Hesap Ayarlar�</span></a>
		<a href="[homepage]/log-out"><span style="margin-bottom: 0; " lang="tr"><div class="icon"></div>��k�� Yap</span></a>
	</div>
	<!-- else -->
	<div class="guest">
		<a href="[homepage]/login" lang="tr">Giri� Yap</a>
		<a href="[homepage]/sign-up" lang="tr">Kay�t Ol</a>
		<a href="[homepage]/create" class="create">+</a>
	</div>
	<!-- endif -->
</div>
<!-- [END]HEADER -->

<!-- STREAM -->
<div id="stream">
	<!-- if [is_exists] == 0 -->
		<!-- if is_logged_in() -->
			<div class="errormessage">ke�ke birilerini takip etseydin :/<p>Hi� kimseyi takip etmedi�ini ya da takip ettiklerinin bir �ey payla�mad���n� g�rd�k, birka� ki�iyi takip etmeye ne dersin?</p><div class="icon"></div></div>
			<div class="suggestions"><h4>�NER�LER</h4><ul>
				[suggestions]
			</ul></div>
		<!-- else -->
			<div class="errormessage">ke�ke birilerini takip etseydin :/<p>Hi� kimseyi takip etmedi�ini g�rd�k, giri� yap�p birka� ki�iyi takip etmeye ne dersin?</p><div class="icon"></div></div>
		<!-- endif -->
	<!-- else -->
		<!-- Menu -->
		<ul class="menu">
			<li class="active">Payla��mlar</li>
			<li>Duvarlar</li>
			<!-- if is_logged_in() -->
			<li>Ki�iler</li>
			<!-- endif -->
		</ul>
		<!--#Menu -->
		
		<div class="stream">
		<!-- Posts -->
		<div class="posts">
			<h4>HABER AKI�I</h4>
			<!-- while_posts -->
			<div class="post">
				<a href="[homepage]/users/{post_user_name}">
				<div class="avatar" style="background: url({post_user_avatar}); background-size: 70px 70px; "></div>
				</a>
				<div class="details">
					<a href="[homepage]/wall/{post_wall_domain}
						/post/{post_id}">
						<h2>{post_title}</h2></a>
					<div>{post_subtitle}</div>
				<!-- if is_logged_in() -->
					<ul class="user_opt">
						<li onclick='post_update({post_id}, "same", "same", "same", "same", "same", "same", "same", "same", 1); $(this).addClass("active"); '>be�en</li>
						<a href="[homepage]/wall/{post_wall_domain}
						/post/{post_id}"><li>yorum yap</li></a>
						<a href="[homepage]/wall/{post_wall_domain}
						/post/{post_id}"><li>payla�</li></a>
					</ul>
				<!-- endif -->
				<script type="text/javascript">
					if("{post_wall_authority}".substring(0, 1) == "p"){
						$(".post:last").remove();
					}
				</script>
				</div>
			</div>
			<!-- endwhile -->
		</div>
		<!--#Posts -->

		<!-- Walls -->
		<div class="walls">
			<h4>DUVAR AKI�I</h4><ul>
			<!-- while_walls -->
			<a href="[homepage]/wall/{wall_domain}"><div class="wall">
				<div class="avatar" style="background: url({wall_avatar}) rgba(0, 0, 0, 0.15); background-size: 70px 70px; "></div>
				<div class="details">
						<h2>
							<b>{wall_title}</b>
							<span>/ {wall_desc}</span>
						</h2>
						<span>{wall_user_name}</span>
				<script type="text/javascript">
					if("{wall_authority}".substring(0, 1) == "p"){
						$(".wall:last").remove();
					}
					if("{wall_desc}" == ""){
						$(".wall:last").children(".details").children("h2").children("span").remove();
					}
				</script>
				</div>
			</div></a>
			<!-- endwhile -->
		</div>
		<!--#Walls -->
		
		<!-- if is_logged_in() -->
		<!-- Suggestions -->
		<div class="suggestions"><h4>K��� �NER�LER�</h4><ul>
			[suggestions]
		</ul></div>
		<!--#Suggestions -->
		<!-- endif -->
		</div>
	<!-- endif -->
</div>
<!-- [END]STREAM -->