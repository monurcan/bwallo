<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir þeyler ara..." value="Hesap Ayarlarý" lang="tr">
		<button class="icon"></button>
	</form>

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
</div>
<!-- [END]HEADER -->

<!-- LEFT -->
<ul id="left">
	<a href="#account"><li class="active" lang="tr">Hesap bilgileri</li></a>
	<a href="#password"><li lang="tr">Þifre</li></a>
	<a href="#notifications"><li lang="tr">E-posta bildirimleri</li></a>
	<a href="#profile"><li lang="tr">Profil</li></a>
	<a href="#social"><li lang="tr">Sosyal aðlar</li></a>
	<a href="#tools"><li lang="tr">Eklentiler</li></a>
</ul>
<!-- [END]LEFT -->

<!-- CONTAINER -->
<div id="container">
	<div class="account" style="display: block; ">
		<h1 lang="tr">Hesap Bilgileri</h1>
		<h2 lang="tr">Temel hesap bilgilerini güncelle, hesap ayarlarýný deðiþtir.</h2>
		<table>
			<tr>
				<td><label for="user_name">Kullanýcý adý</label></td>
				<td><input type="text" id="user_name" value="[my_username]"></td>
			</tr>
			<tr>
				<td><label for="email">E-posta</label></td>
				<td><input type="email" id="email" value="[my_email]"></td>
			</tr>
			<tr>
				<td><div class="button inactive">Deðiþiklikleri kaydet</div></td>
				<td></td>
			</tr>
		</table>
		
		<div class="delete">
			<div class="hidden">
				Eðer hesabýný silersen, senin yarattýðýn tüm duvarlar ve yazdýðýn tüm paylaþýmlar silinecektir. Onlarý bir daha geri getiremeyiz.<br /><br />Kararýný tekrar gözden geçirmek istemediðine emin misin?
				<div class="button">Evet, sil</div>
				<div class="button cancel">Hayýr, yapma</div>
			</div>

			<p>Mutsuz musun? O halde <span>hesabý sil.</span></p>
		</div>
	</div>

	<div class="password">
		<h1>Þifre</h1>
		<h2>Þifreni deðiþtir veya þimdikini kurtar.</h2>
		<table>
			<tr>
				<td><label for="current_pass">Mevcut þifre</label></td>
				<td>
					<a href="resend_password" onclick="resend_password(my_email); return false; ">Þifreni mi unuttun?</a>
					<input type="password" id="current_pass">
				</td>
			</tr>
			<tr>
				<td><label for="new_pass">Yeni þifre</label></td>
				<td><input type="password" id="new_pass"></td>
			</tr>
			<tr>
				<td><label for="new_re_pass">Tekrar gir</label></td>
				<td><input type="password" id="new_re_pass"></td>
			</tr>
			<tr>
				<td><div class="button inactive">Deðiþiklikleri kaydet</div></td>
				<td></td>
			</tr>
		</table>
	</div>

	<div class="notifications">
		<h1>E-Posta Bildirimleri</h1>
		<h2>bwallo.'dan ne zaman ve ne sýklýkta e-posta göndereceðini kontrol et, ayarla.</h2>
		<input type="checkbox"
			<!-- if "[my_commentnotif]" == 1 -->
				checked="checked"
			<!-- endif -->
		id="comment_notif">
		<label for="comment_notif">Paylaþýmým yorumlandýðýnda e-posta bildirimi gönder!</label>
		<div class="seperate"></div>
		<input type="checkbox"
			<!-- if "[my_weeklynotif]" == 1 -->
				checked="checked"
			<!-- endif -->
		id="info_notif">
		<label for="info_notif">Haftalýk bilgilendirme mailleri gönder!</label>
		<div class="button inactive">Deðiþiklikleri kaydet</div>
	</div>

	<div class="profile">
		<h1>Profil</h1>
		<h2>Genel profilinde, arama sonuçlarýnda baþka kiþilere gözükecek bilgileri güncelle.</h2>
		<div class="info">Fotoðraflarýný ve kiþisel bilgilerini <a href="[homepage]/users/[my_username]&edit=true">profilinden</a> de düzenlenleyebilirsin!</div>
		<table>
			<tr>
				<td><label for="user_name">Profil Fotoðrafý</label></td>
				<td>
					<div id="profile-photo" class="img" style="background: url('[my_avatar]') no-repeat; background-size: 110% 110%; background-position: -2px -3px; "></div>
					<div class="button dropdown">Fotoðrafý deðiþtir</div>
					<ul class="image-selector">
						<label for="uploadPImage" style="position: relative; top: 0; "><li>
							Fotoðraf yükle
							<input id="uploadPImage" type="file" style="display: none; " onchange="previewImage('profile-photo');" accept="image/png, image/gif, image/jpeg">
						</li></label>
						<li>Fotoðraf çek</li>
						<!-- if "[my_avatar]" != "[homepage]/includes/src/default-avatar.png" -->
						<li class="removep">Kaldýr</li>
						<!-- endif -->
					</ul>
					<p>Bu fotoðraf senin bwallo.'daki kimliðindir ve herkes tarafýndan görülebilir.</p>
				</td>
			</tr>
			<tr>
				<td><label for="email">Kapak Görseli</label></td>
				<td>
					<div id="cover-photo" class="img" style="background: url('[my_cover]') no-repeat; background-size: 180% 130%; background-position: -2px -3px; "></div>
					<div class="button dropdown">Görseli deðiþtir</div>
					<ul class="image-selector">
						<label for="uploadCImage" style="position: relative; top: 0; "><li>
							Fotoðraf yükle
							<input id="uploadCImage" type="file" style="display: none; " onchange="previewImage('cover-photo');" accept="image/png, image/gif, image/jpeg">
						</li></label>
						<!-- if "[my_cover]" != "[homepage]/includes/src/default-cover.png" -->
						<li class="removec">Kaldýr</li>
						<!-- endif -->
					</ul>
					<p>Tüm sayfayý kaplayacak bir görsel yükle. Görselin eninin geniþ, boyunun kýsa olmasýna dikkat et.</p>
				</td>
			</tr>
			<div class="seperate"></div>
			<tr>
				<td><label for="name">Ýsim</label></td>
				<td>
					<input type="text" id="name" value="[my_fullname]">
					<p>Gerçek adýný yaz ki insanlar seni tanýyabilsin.</p>
				</td>
			</tr>
			<tr>
				<td><label for="about">Hakkýnda</label></td>
				<td>
					<textarea id="about">[my_about]</textarea>
					<p>Kendin hakkýnda kýsa kýsa bi' þeyler karala.</p>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><div class="button inactive">Deðiþiklikleri kaydet</div></td>
			</tr>
		</table>
	</div>

	<div class="social">
		<h1>Sosyal Aðlar</h1>
		<h2>Diðer aðlara baðlanarak dosyalarýný bwallo.'ya aktar.</h2>
		<div class="errormessage">bu özellik geliþtirme aþamasýnda :/<p>Diðer sosyal aðlarla senkronize uygulamasý þu an geliþtirilmekte, bu özellik için lütfen bekleyin.</p><div class="icon"></div></div>
	</div>

	<div class="tools">
		<h1>Eklentiler</h1>
		<h2>bwallo. eklentilerini yükleyerek daha iyi bir bwallo. deneyimi yaþa.</h2>
		<p>Butonu sürükleyerek web tarayýcýnýzýn yer imleri çubuðuna býrakýn: </p>
		<img src="[theme]src/add-bookmarklet.png">
		<a href="javascript:(function()%7Bwindow.s22%3Ddocument.createElement(%27script%27)%3Bwindow.s22.setAttribute(%27type%27,%27text/javascript%27)%3Bwindow.s22.setAttribute(%27src%27,%27https://s3.amazonaws.com/edcanvas-other/bookmarklet.js%27)%3Bdocument.getElementsByTagName(%27body%27)%5B0%5D.appendChild(window.s22)%3B%7D)()%3B" target="_blank" class="bookmarkletlink">
			bwallo.'ya kaydet!
		</a>
		<p style="margin-top: 25px; ">Artýk webde gezinirken bir sayfayý bwallo.'ya kaydetmen için tek yapman gereken "bwallo.'ya kaydet!" butonuna týklaman! bwallo. bookmarklet ile kaydettiðin sayfalarý duvar oluþturuken "Yer Ýmleri" menüsünden sayfaya ekleyebilirsin...</p>
	</div>
</div>
<!-- [END]CONTAINER -->