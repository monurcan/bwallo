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
	<a href="[homepage]/login" lang="tr">Giri� Yap</a>
	<a href="[homepage]/sign-up" lang="tr">Kay�t Ol</a>
	<a href="[homepage]/create" class="create">+</a>
</div>
<!-- [END]HEADER -->

<!-- PAGE -->
<div id="page" lang="tr">Ho�geldin, Giri� Yap</div>
<!-- [END]PAGE -->

<!-- CONTAINER -->
<div id="container">
	<form action="" method="POST" onsubmit="return false;" onkeypress="lkeyPress(event); ">
		<input type="text" placeholder="e-posta adresi" lang="tr">
		<input type="password" placeholder="�ifre" lang="tr">
		<div class="see">
			<div class="icon"></div>
		</div>
		
		<a class="button" href="#" onclick="login(); " lang="tr">Giri� Yap</a>
		<div class="extras">
			<input type="checkbox" checked="checked" id="remember_me">
			<label for="remember_me" lang="tr">beni hat�rla!</label>

			<a href="[homepage]/resend_password" lang="tr">�ifremi unuttum.</a>
		</div>
	</form>
	
	<!-- Connect with Social Networks -->
	<ul class="social">
		<a href="#" onclick="fb_login(); "><li><img src="[theme]src/fb_connect.png"><p lang="tr"><span>facebook</span>'la giri� yap!</p></li></a>
		<a href="#" onclick="dialog('Hen�z aktif de�il!', 'Bu �zellik hen�z aktif de�il, l�tfen daha sonra deneyin...'); "><li><img src="[theme]src/twitter_connect.png"><p lang="tr"><span>twitter</span>'la giri� yap!</p></li></a>
		<a href="#" onclick="dialog('Hen�z aktif de�il!', 'Bu �zellik hen�z aktif de�il, l�tfen daha sonra deneyin...'); "><li><img src="[theme]src/google_connect.png"><p lang="tr"><span>google</span>'la giri� yap!</p></li></a>
	</ul>
	<!--#Connect with Social Networks -->
</div>
<!-- [END]CONTAINER -->

<!-- DOTTED BACKGROUND -->
<div id="dotted-bg"></div>
<!-- DOTTED BACKGROUND -->