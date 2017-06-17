<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir �eyler ara..." value="Hesap Ayarlar�" lang="tr">
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
		<a href="[homepage]/settings"><span lang="tr"><div class="icon"></div>Hesap Ayarlar�</span></a>
		<a href="[homepage]/log-out"><span style="margin-bottom: 0; " lang="tr"><div class="icon"></div>��k�� Yap</span></a>
	</div>
</div>
<!-- [END]HEADER -->

<!-- LEFT -->
<ul id="left">
	<a href="#account"><li class="active" lang="tr">Hesap bilgileri</li></a>
	<a href="#password"><li lang="tr">�ifre</li></a>
	<a href="#notifications"><li lang="tr">E-posta bildirimleri</li></a>
	<a href="#profile"><li lang="tr">Profil</li></a>
	<a href="#social"><li lang="tr">Sosyal a�lar</li></a>
	<a href="#tools"><li lang="tr">Eklentiler</li></a>
</ul>
<!-- [END]LEFT -->

<!-- CONTAINER -->
<div id="container">
	<div class="account" style="display: block; ">
		<h1 lang="tr">Hesap Bilgileri</h1>
		<h2 lang="tr">Temel hesap bilgilerini g�ncelle, hesap ayarlar�n� de�i�tir.</h2>
		<table>
			<tr>
				<td><label for="user_name">Kullan�c� ad�</label></td>
				<td><input type="text" id="user_name" value="[my_username]"></td>
			</tr>
			<tr>
				<td><label for="email">E-posta</label></td>
				<td><input type="email" id="email" value="[my_email]"></td>
			</tr>
			<tr>
				<td><div class="button inactive">De�i�iklikleri kaydet</div></td>
				<td></td>
			</tr>
		</table>
		
		<div class="delete">
			<div class="hidden">
				E�er hesab�n� silersen, senin yaratt���n t�m duvarlar ve yazd���n t�m payla��mlar silinecektir. Onlar� bir daha geri getiremeyiz.<br /><br />Karar�n� tekrar g�zden ge�irmek istemedi�ine emin misin?
				<div class="button">Evet, sil</div>
				<div class="button cancel">Hay�r, yapma</div>
			</div>

			<p>Mutsuz musun? O halde <span>hesab� sil.</span></p>
		</div>
	</div>

	<div class="password">
		<h1>�ifre</h1>
		<h2>�ifreni de�i�tir veya �imdikini kurtar.</h2>
		<table>
			<tr>
				<td><label for="current_pass">Mevcut �ifre</label></td>
				<td>
					<a href="resend_password" onclick="resend_password(my_email); return false; ">�ifreni mi unuttun?</a>
					<input type="password" id="current_pass">
				</td>
			</tr>
			<tr>
				<td><label for="new_pass">Yeni �ifre</label></td>
				<td><input type="password" id="new_pass"></td>
			</tr>
			<tr>
				<td><label for="new_re_pass">Tekrar gir</label></td>
				<td><input type="password" id="new_re_pass"></td>
			</tr>
			<tr>
				<td><div class="button inactive">De�i�iklikleri kaydet</div></td>
				<td></td>
			</tr>
		</table>
	</div>

	<div class="notifications">
		<h1>E-Posta Bildirimleri</h1>
		<h2>bwallo.'dan ne zaman ve ne s�kl�kta e-posta g�nderece�ini kontrol et, ayarla.</h2>
		<input type="checkbox"
			<!-- if "[my_commentnotif]" == 1 -->
				checked="checked"
			<!-- endif -->
		id="comment_notif">
		<label for="comment_notif">Payla��m�m yorumland���nda e-posta bildirimi g�nder!</label>
		<div class="seperate"></div>
		<input type="checkbox"
			<!-- if "[my_weeklynotif]" == 1 -->
				checked="checked"
			<!-- endif -->
		id="info_notif">
		<label for="info_notif">Haftal�k bilgilendirme mailleri g�nder!</label>
		<div class="button inactive">De�i�iklikleri kaydet</div>
	</div>

	<div class="profile">
		<h1>Profil</h1>
		<h2>Genel profilinde, arama sonu�lar�nda ba�ka ki�ilere g�z�kecek bilgileri g�ncelle.</h2>
		<div class="info">Foto�raflar�n� ve ki�isel bilgilerini <a href="[homepage]/users/[my_username]&edit=true">profilinden</a> de d�zenlenleyebilirsin!</div>
		<table>
			<tr>
				<td><label for="user_name">Profil Foto�raf�</label></td>
				<td>
					<div id="profile-photo" class="img" style="background: url('[my_avatar]') no-repeat; background-size: 110% 110%; background-position: -2px -3px; "></div>
					<div class="button dropdown">Foto�raf� de�i�tir</div>
					<ul class="image-selector">
						<label for="uploadPImage" style="position: relative; top: 0; "><li>
							Foto�raf y�kle
							<input id="uploadPImage" type="file" style="display: none; " onchange="previewImage('profile-photo');" accept="image/png, image/gif, image/jpeg">
						</li></label>
						<li>Foto�raf �ek</li>
						<!-- if "[my_avatar]" != "[homepage]/includes/src/default-avatar.png" -->
						<li class="removep">Kald�r</li>
						<!-- endif -->
					</ul>
					<p>Bu foto�raf senin bwallo.'daki kimli�indir ve herkes taraf�ndan g�r�lebilir.</p>
				</td>
			</tr>
			<tr>
				<td><label for="email">Kapak G�rseli</label></td>
				<td>
					<div id="cover-photo" class="img" style="background: url('[my_cover]') no-repeat; background-size: 180% 130%; background-position: -2px -3px; "></div>
					<div class="button dropdown">G�rseli de�i�tir</div>
					<ul class="image-selector">
						<label for="uploadCImage" style="position: relative; top: 0; "><li>
							Foto�raf y�kle
							<input id="uploadCImage" type="file" style="display: none; " onchange="previewImage('cover-photo');" accept="image/png, image/gif, image/jpeg">
						</li></label>
						<!-- if "[my_cover]" != "[homepage]/includes/src/default-cover.png" -->
						<li class="removec">Kald�r</li>
						<!-- endif -->
					</ul>
					<p>T�m sayfay� kaplayacak bir g�rsel y�kle. G�rselin eninin geni�, boyunun k�sa olmas�na dikkat et.</p>
				</td>
			</tr>
			<div class="seperate"></div>
			<tr>
				<td><label for="name">�sim</label></td>
				<td>
					<input type="text" id="name" value="[my_fullname]">
					<p>Ger�ek ad�n� yaz ki insanlar seni tan�yabilsin.</p>
				</td>
			</tr>
			<tr>
				<td><label for="about">Hakk�nda</label></td>
				<td>
					<textarea id="about">[my_about]</textarea>
					<p>Kendin hakk�nda k�sa k�sa bi' �eyler karala.</p>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><div class="button inactive">De�i�iklikleri kaydet</div></td>
			</tr>
		</table>
	</div>

	<div class="social">
		<h1>Sosyal A�lar</h1>
		<h2>Di�er a�lara ba�lanarak dosyalar�n� bwallo.'ya aktar.</h2>
		<div class="errormessage">bu �zellik geli�tirme a�amas�nda :/<p>Di�er sosyal a�larla senkronize uygulamas� �u an geli�tirilmekte, bu �zellik i�in l�tfen bekleyin.</p><div class="icon"></div></div>
	</div>

	<div class="tools">
		<h1>Eklentiler</h1>
		<h2>bwallo. eklentilerini y�kleyerek daha iyi bir bwallo. deneyimi ya�a.</h2>
		<p>Butonu s�r�kleyerek web taray�c�n�z�n yer imleri �ubu�una b�rak�n: </p>
		<img src="[theme]src/add-bookmarklet.png">
		<a href="javascript:(function()%7Bwindow.s22%3Ddocument.createElement(%27script%27)%3Bwindow.s22.setAttribute(%27type%27,%27text/javascript%27)%3Bwindow.s22.setAttribute(%27src%27,%27https://s3.amazonaws.com/edcanvas-other/bookmarklet.js%27)%3Bdocument.getElementsByTagName(%27body%27)%5B0%5D.appendChild(window.s22)%3B%7D)()%3B" target="_blank" class="bookmarkletlink">
			bwallo.'ya kaydet!
		</a>
		<p style="margin-top: 25px; ">Art�k webde gezinirken bir sayfay� bwallo.'ya kaydetmen i�in tek yapman gereken "bwallo.'ya kaydet!" butonuna t�klaman! bwallo. bookmarklet ile kaydetti�in sayfalar� duvar olu�turuken "Yer �mleri" men�s�nden sayfaya ekleyebilirsin...</p>
	</div>
</div>
<!-- [END]CONTAINER -->