<div id='fb-root'></div>
<script type="text/javascript">
$(document).ready(function(){
	$.getScript('//connect.facebook.net/tr_TR/all.js', function(){
		FB.init({
		appId: '540440732776975',
		status: true,
		cookie: true,
		xfbml: true,
		channelURL: 'http://176.233.81.251',
		oauth: true
		});
	});
});
</script>

<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<a href="[homepage]/login" lang="tr">Giriþ Yap</a>
	<a href="[homepage]/sign-up" lang="tr">Kayýt Ol</a>
	<a href="[homepage]/create" class="create">+</a>
</div>
<!-- [END]HEADER -->

<!-- PAGE -->
<div id="page" lang="tr">Hemen Kayýt Ol!</div>
<!-- [END]PAGE -->

<!-- CONTAINER -->
<div id="container">
	<form action="" method="POST" onsubmit="return false; " onkeypress="skeyPress(event); ">
		<input type="text" placeholder="ad ve soyad" lang="tr">
		<input type="email" placeholder="e-posta adresi" lang="tr">
		<input type="password" placeholder="þifre" lang="tr">
		<div class="see">
			<div class="icon"></div>
		</div>
		<input type="text" placeholder="kullanýcý adý" style="margin-top: -11px; " lang="tr">
		<div class="button" onclick="sign_up(); " lang="tr">Kayýt Ol</div>
		<p lang="tr">* butona týklayarak <a href="[homepage]/page/terms" target="_blank">koþullarý</a> kabul etmiþ olursun.</p>
	</form>

	<!-- Connect with Social Networks -->
	<ul class="social">
		<a href="#" onclick="fb_signup(); "><li><img src="[theme]src/fb_connect.png"><div lang="tr"><span>facebook</span>'la kayýt ol!</div></li></a>
		<a href="#" onclick="dialog('Henüz aktif deðil!', 'Bu özellik henüz aktif deðil, lütfen daha sonra deneyin...'); "><li><img src="[theme]src/twitter_connect.png"><div lang="tr"><span>twitter</span>'la kayýt ol!</div></li></a>
		<a href="#" onclick="dialog('Henüz aktif deðil!', 'Bu özellik henüz aktif deðil, lütfen daha sonra deneyin...'); "><li><img src="[theme]src/google_connect.png"><div lang="tr"><span>google</span>'la kayýt ol!</div></li></a>
	</ul>
	<!--#Connect with Social Networks -->
</div>
<!-- [END]CONTAINER -->

<!-- DOTTED BACKGROUND -->
<div id="dotted-bg"></div>
<!-- DOTTED BACKGROUND -->