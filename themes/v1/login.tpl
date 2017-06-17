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
<div id="page" lang="tr">Hoþgeldin, Giriþ Yap</div>
<!-- [END]PAGE -->

<!-- CONTAINER -->
<div id="container">
	<form action="" method="POST" onsubmit="return false;" onkeypress="lkeyPress(event); ">
		<input type="text" placeholder="e-posta adresi" lang="tr">
		<input type="password" placeholder="þifre" lang="tr">
		<div class="see">
			<div class="icon"></div>
		</div>
		
		<a class="button" href="#" onclick="login(); " lang="tr">Giriþ Yap</a>
		<div class="extras">
			<input type="checkbox" checked="checked" id="remember_me">
			<label for="remember_me" lang="tr">beni hatýrla!</label>

			<a href="[homepage]/resend_password" lang="tr">þifremi unuttum.</a>
		</div>
	</form>
	
	<!-- Connect with Social Networks -->
	<ul class="social">
		<a href="#" onclick="fb_login(); "><li><img src="[theme]src/fb_connect.png"><p lang="tr"><span>facebook</span>'la giriþ yap!</p></li></a>
		<a href="#" onclick="dialog('Henüz aktif deðil!', 'Bu özellik henüz aktif deðil, lütfen daha sonra deneyin...'); "><li><img src="[theme]src/twitter_connect.png"><p lang="tr"><span>twitter</span>'la giriþ yap!</p></li></a>
		<a href="#" onclick="dialog('Henüz aktif deðil!', 'Bu özellik henüz aktif deðil, lütfen daha sonra deneyin...'); "><li><img src="[theme]src/google_connect.png"><p lang="tr"><span>google</span>'la giriþ yap!</p></li></a>
	</ul>
	<!--#Connect with Social Networks -->
</div>
<!-- [END]CONTAINER -->

<!-- DOTTED BACKGROUND -->
<div id="dotted-bg"></div>
<!-- DOTTED BACKGROUND -->