<script type="text/javascript">
$(function(){if($(window).width()>1465){$(".article > img:nth-child(12)").css("display","inline")}if($(window).width()>1770){$(".article > img:nth-child(13)").css("display","inline")}$(window).resize(function(){if($(window).width()>1465){$(".article > img:nth-child(12)").css("display","inline")}else{$(".article > img:nth-child(12)").css("display","none")}if($(window).width()>1770){$(".article > img:nth-child(13)").css("display","inline")}else{$(".article > img:nth-child(13)").css("display","none")}})});
</script>
<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir þeyler ara..." value="Platformlar" lang="tr">
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

<!-- PAGE -->
<header>
	<h3 lang="tr">platformlar<span>.</span></h3>
</header>
<!-- [END]PAGE -->

<!-- ARTICLE -->
<div class="article">
	<h4>bwallo.'yu yanýna al!</h4>
	<p>Web sitesinde yapabildiðin her þeyi kolayca yapabileceðin uygulamamýzý indir.</p>
	<div><i></i><span>Download the app for <br><b>Android</b></span></div>
	<div><i><div></div><div></div><div></div></i><span>Download the app for <br><b>iPhone</b></span></div>
	<div><i></i><span>Get in on the <br><b>Mac App Store</b></span></div><br><br><br><br>
	<a href="#">Diðer cihazlar için</a>
	<p><img src="[theme]src/mbl_8.jpg">
	<img src="[theme]src/mbl_7.jpg">
	<img src="[theme]src/mbl_6.jpg">
	<img src="[theme]src/mbl_5.jpg">
	<img src="[theme]src/mbl_4.jpg">
	<img src="[theme]src/mbl_3.jpg"></p>
	<img src="[theme]src/mbl_2.jpg">
	<img src="[theme]src/mbl_1.jpg">
</div>
<!-- [END]ARTICLE -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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