<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir �eyler ara..." value="�leti�im" lang="tr">
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

<!-- PAGE -->
<header>
	<h3 lang="tr">ileti�im<span>.</span></h3>
</header>
<!-- [END]PAGE -->

<!-- ARTICLE -->
<div class="article">
Yaz�l�mdaki hatalar�, sitede olmas�n� istedi�iniz �zellikleri veya site hakk�ndaki g�r��lerinizi l�tfen bana iletin. A�a��daki sosyal a�lardan bana ula�abilirsiniz veya e-posta g�nderebilirsiniz.<br><br>
	<a href="https://www.facebook.com/main.jsf">Facebook</a> / <a href="https://www.twitter.com/monurcan">Twitter</a> / <a href="mailto:monurcan55@gmail.com">E-Mail</a> / <a href="[homepage]/blog/page/contact">Website</a> / <a href="https://www.facebook.com/pages/Bwallo/779984328735423">bwallo. Facebook Sayfas�</a>
</div>
<!-- [END]ARTICLE -->

<!-- FOOTER -->
<div id="footer">
	<!-- Menu -->
	<ul class="menu">
		<li><a href="[homepage]" lang="tr">anasayfa</a></li>
		<li><a href="[homepage]/create" lang="tr">duvar yarat!</a></li>
		<li><a href="[homepage]/page/about" lang="tr">hakk�nda</a></li>
		<li><a href="[homepage]/page/terms" lang="tr">gizlilik ve kullan�m</a></li>
		<li><a href="[homepage]/updates" lang="tr">g�ncellemeler</a></li>
		<li class="active"><a href="#" lang="tr">ileti�im</a></li>
		<li><a href="[homepage]/page/faq" lang="tr">sss</a></li>
		<li lang="tr"><a onclick="window.lang.change('en');">english</a></li>
	</ul>
	<!--#Menu -->

	<!-- Copyright -->
	<div class="copyright"><span>powered by</span> <a href="[homepage]/blog">m.onurcan<b>kaya</b></a></div>
	<!--#Copyright -->
</div>
<!-- [END]FOOTER -->