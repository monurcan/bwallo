<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir þeyler ara..." value="[search_keyword]" lang="tr">
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

<!-- RESULTS -->
<div id="results">
<!-- if [is_exists] == 1 -->
	<!-- Posts -->
	<div class="posts">
		<h4>Paylaþýmlar</h4>
		<!-- while_posts -->
		<a href="[homepage]/wall/{post_wall_domain}
						/post/{post_id}"><div>
			<h6>
				{post_title}
				<span>{post_user_name}</span>
			</h6>
			<span>{post_subtitle}</span>
		</div></a>

		<script type="text/javascript">
			if("{post_wall_authority}".substring(0, 1) == "p"){
				$("#results .posts > a:last").remove();
			}
		</script>
		<!-- endwhile -->
	</div>
	<!--#Posts -->
	
	<!-- Walls -->
	<div class="walls">
		<h4>Duvarlar</h4>
		<!-- while_walls -->
		<a href="[homepage]/wall/{wall_domain}"><div>
			<h6>
				{wall_title}
				<span>{wall_user_name}</span>
			</h6>
			<span>{wall_desc}</span>
		</div></a>

		<script type="text/javascript">
			if("{wall_authority}".substring(0, 1) == "p"){
				$("#results .walls > a:last").remove();
			}
		</script>
		<!-- endwhile -->
	</div>
	<!--#Walls -->
<!-- else -->
	<div class="errormessage">hiç sonuç bulunamamadý :/<p>Aradýðýnýz kelimeyle ilgili hiç sonuç bulamadýk, baþka anahtar kelimeler deneyebilirsin.</p><div class="icon"></div></div>
<!-- endif -->
</div>
<!-- [END]RESULTS -->

<!-- FOOTER -->
<div id="footer">
	<!-- Menu -->
	<ul class="menu">
		<li><a href="[homepage]" lang="tr">anasayfa</a></li>
		<li><a href="[homepage]/create" lang="tr">duvar yarat!</a></li>
		<li><a href="[homepage]/page/about" lang="tr">hakkýnda</a></li>
		<li><a href="[homepage]/page/terms" lang="tr">gizlilik ve kullaným</a></li>
		<li><a href="[homepage]/updates" lang="tr">güncellemeler</a></li>
		<li><a href="[homepage]/page/contact" lang="tr">iletiþim</a></li>
		<li><a href="[homepage]/page/faq" lang="tr">sss</a></li>
		<li lang="tr"><a onclick="window.lang.change('en');">english</a></li>
	</ul>
	<!--#Menu -->

	<!-- Copyright -->
	<div class="copyright"><span>powered by</span> <a href="[homepage]/blog">m.onurcan<b>kaya</b></a></div>
	<!--#Copyright -->
</div>
<!-- [END]FOOTER -->