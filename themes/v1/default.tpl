<style>
body {overflow: hidden}
</style>
<script type="text/javascript">
$(document).ready(function(){$("#account .notification li").mouseenter(function(){if($(this).hasClass("unread")){$(this).removeClass("unread");$("#account li .active").text($("#account li .active").text()-1);notif_read($(this).data("id"))}});$("#account .notification li:last").click(function(){$("#account li .active").text(0)})});
</script>
<!-- SIGN UP / LOGIN -->
	<!-- if is_logged_in() -->
		<ul id="account">
			<a href="[homepage]/create">
				<li title="Yeni duvar yarat!">
						<div class="icon"></div>
				</li>
			</a>
			
			<li title="Bildirimler">
					<div class="icon"></div>
					<div class="icon"></div>
					<div class="active">[notifs_count]</div>
			</li>

			<li class="img">
				<p>[my_fullname]</p>
				<img src="[my_avatar]" width="42" height="42">
			</li>

			<div class="notification">
				[notifs]
			</div>

			<div class="account">
				<a href="[homepage]/users/[my_username]"><span lang="tr"><div class="icon"></div>Profilim</span></a>
				<a href="[homepage]/settings"><span lang="tr"><div class="icon"></div>Hesap Ayarlarý</span></a>
				<a href="[homepage]/log-out"><span lang="tr"><div class="icon"></div>Çýkýþ Yap</span></a>
			</div>
		</ul>
	<!-- else -->
		<a id="slbutton" href="[homepage]/login" lang="tr">giriþ yap / kaydol</a>
	<!-- endif -->
<!-- [END]SIGN UP / LOGIN -->

<!-- CONTAINER -->
<div id="container">
	<!-- Logo -->
	<div class="logo">
		<p lang="tr">[site_desc]</p>
	</div>
	<!--#Logo -->

	<!-- Button -->
		<!-- if @$_GET["do"] == "welcome" -->
			<div class="welcome">
				<div class="arrow"></div>
				<span>butona týklayarak kendi duvarýný oluþturabilirsin!</span>
				<a href="[homepage]" class="close">
					tanýtýmý atla
					<div class="icon">x</div>
				</a>
			</div>
		<!-- endif -->
		
		<div class="button" onclick="window.location='[homepage]/create'" lang="tr">hemen baþla!</div>
	<!--#Button -->

	<!-- Shortcuts -->
	<ul class="shortcuts">
		<!-- Info -->
		<li class="info" onclick="window.location='[homepage]/page/about'">
			<div class="icon">i</div>
			<div class="desc" lang="tr">nedir?</div>
		</li>
		<!--#Info -->

		<!-- Discover -->
		<li class="discover" onclick="window.location='[homepage]/discover'">
			<div class="icon">
				<div class="d"></div><div class="dd"></div><div class="ddd"></div>
			</div>
			<div class="desc" lang="tr">keþfet!</div>
		</li>
		<!--#Discover -->

		<!-- Platforms -->
		<li class="platforms" onclick="window.location='[homepage]/page/platforms'">
			<div class="icon">
				<div class="s"></div>
				<div class="b"></div>
			</div>
			<div class="desc" lang="tr">platformlar.</div>
		</li>
		<!--#Platforms -->
	</ul>
	<!--#Shortcuts -->
</div>
<!-- [END]CONTAINER -->

<!-- FOOTER -->
<div id="footer">
	<!-- Menu -->
	<ul class="menu">
		<li class="active"><a href="#" lang="tr">anasayfa</a></li>
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