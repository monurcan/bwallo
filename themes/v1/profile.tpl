<script type="text/javascript" src="[theme]js/masonry.min.js"></script>

<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir þeyler ara..." value="[user_fullname]" lang="tr">
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
		<a href="[homepage]/settings"><span lang="tr"><div class="icon"></div>Hesap Ayarlarý</span></a>
		<a href="[homepage]/log-out"><span style="margin-bottom: 0; " lang="tr"><div class="icon"></div>Çýkýþ Yap</span></a>
	</div>
	<!-- else -->
	<div class="guest">
		<a href="[homepage]/login" lang="tr">Giriþ Yap</a>
		<a href="[homepage]/sign-up" lang="tr">Kayýt Ol</a>
		<a href="[homepage]/create" class="create">+</a>
	</div>
	<!-- endif -->
</div>
<!-- [END]HEADER -->

<!-- HEAD -->
<div id="head">
	<div style="background: url('[user_cover]') no-repeat; background-position: 0 -210px; background-size: 100% auto;" class="cover"></div>
	<div class="cover_shadow"></div>

	<img src="[user_avatar]" class="avatar">
	<!-- if "[user_about]" == "" -->
		<div class="info">
			<h1 style="margin-top: 12px; margin-bottom: 35px; ">[user_fullname]</h1>
		</div>
	<!-- else -->
		<div class="info">
			<h1>[user_fullname]</h1>
			<p>[user_about]</p>
		</div>
	<!-- endif -->

	<!-- if is_logged_in() -->
		<!-- if "[my_username]" != "[user_name]" -->
				<!-- if "[is_followed]" -->
				<div class="follow-button followed" onclick="unfollow('[user_name]'); ">
					<span lang="tr">Takip ediyorsun</span>
				</div>
				<!-- else -->
				<div class="follow-button" onclick="follow('[user_name]'); ">
					<span lang="tr">Takip et!</span>
				</div>
				<!-- endif -->
		<!-- endif -->
	<!-- endif -->

	<!-- if "[my_username]" == "[user_name]" -->
		<a class="profile-edit button" href="[homepage]/settings" lang="tr">Profili Düzenle</a>
	<!-- endif -->
</div>
<!-- [END]HEAD -->

<!-- CONTAINER -->
<div id="container">
	<!-- if "[have_wall]" -->
		<!-- if "[my_username]" == "[user_name]" -->
			<h1 class="wall_title" lang="tr">Senin duvarlarýn</h1>
		<!-- else -->
			<script type="text/javascript">
				$(function(){
					if(localStorage.getItem('langJs_currentLang') == "tr"){
						$("h1.wall_title").text(window.lang.convert("[user_fullname_suffix] duvarlarý"));
					}else {
						$("h1.wall_title").text(window.lang.convert("[user_fullname]'s walls"));
					}
				});
			</script>
			<h1 class="wall_title"></h1>
		<!-- endif -->
		[user_walls]
	<!-- else -->
		<!-- if "[my_username]" == "[user_name]" -->
			<div class="errormessage">
				keþke bir þeyler ekleseydin :/
				<p>Hiç duvar eklemediðini gördük, duvar eklemeye ne dersin?</p>
				<div class="icon"></div>
			</div>
		<!-- else -->
			<div class="errormessage">
				burada bi' þey yok :/
				<p>Bu kullanýcý henüz duvar eklememiþ.</p>
				<div class="icon"></div>
			</div>
		<!-- endif -->
	<!-- endif -->
</div>
<!-- [END]CONTAINER -->
<script type="text/javascript">
	$(function(){
		$("#preloader").remove();
	});
</script>