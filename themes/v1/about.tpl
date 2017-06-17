<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir þeyler ara..." value="Hakkýnda" lang="tr">
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
	<h3 lang="tr">bwallo<span>.</span> hakkýnda</h3>
</header>
<div class="stats">
	<li>
		<div>[user_count]</div>
		<span>kullanýcý</span>
	</li>
	<li>
		<div>[wall_count]</div>
		<span>duvar</span>
	</li>
	<li>
		<div>[post_count]</div>
		<span>paylaþým</span>
	</li>
	<li>
		<div>1</div>
		<span>çalýþan</span>
	</li>
</div>
<!-- [END]PAGE -->

<!-- ARTICLE -->
<p class="article">
<b>bwallo. zahmetsizce dilediðini paylaþmaný, içerikleri kolayca bulmaný saðlar.</b><br><br>
Tarayýcýndan, telefonundan, masaüstünden, e-postandan veya mümkün olan her yerden metin, fotoðraf, alýntý, baðlantý, müzik ve video gönder. Duvarýna temalar yükleyerek özelleþtirebilir, geliþmiþ editörden yararlanabilir, not býrakabilir, makale yazabilir veya içerikleri keþfedebilirsin.<br><br>
2014 yýlýnda açýlan bwallo. þu an beta sürecindedir. Bu aþamada bazý hatalar olabilir, lütfen sitede bulduðunuz hatalarý iletiþim bölümünü kullanarak bildirin.<br><br>
<b>Neden kullanmalýyým?</b><br><br>
<span>
	<i>Duyuru Panolarý Yap</i>
	<span>Gerçek duyuru panosundaki gibi duvarýnda paylaþýmlar yap. Duvarýnýn RSS beslemesini takip eden insanlara mesaj otomatik olarak ulaþsýn.</span>
</span>
<span>
	<i>Öðret</i>
	<span>bwallo. belki de bir çocuðun kullanabileceðini en basit sitedir. Tek bir sayfada soru sor, sorularýna cevap al ve cevaplara geri dönüþ yap.</span>
</span>
<span>
	<i>Favori Sitelerini Kaydet</i>
	<span>Tüm favori sayfa adreslerini tek bir sayfaya koy. Eðer bu linkler videolar veya dökümanlarsa sayfada görüntülebilirsin.</span>
</span>
<span>
	<i>Tartýþ</i>
	<span>Mac veya PC? iPhone veya Android? Tüm bunlarý tek bir grupta tartýþ. Edepsiz olanlardan kurtulmak için moderatörlük özelliðini kullan.</span>
</span>
<span>
	<i>Beyin Fýrtýnasý Yap</i>
	<span>Fikirlerini paylaþ. Ýyilerini kötülerinden ayýrmak için serbest akýþ özelliðini kullan. Alt baþlýk ve baþlýk dýþýnda upuzun içerik bile yazabilirsin.</span>
</span>
<span>
	<i>Arkadaþlarýný Kutla</i>
	<span>Özel bir günde onlara sürpriz yap. Kutlama duvarýna kartlar ve müzik ekleyebilirsin.</span>
</span>
<span>
	<i>Olaylarý Planla</i>
	<span>Neden basiti varken karmaþýk seçenekleri kullanasýn ki? Sadece bir duvar yarat, etkinliði e-postala, arkadaþlarýn duvar üzerinde gelip gelmeyeceklerini sana söylesin. Farklý þeyleri ayný sayfada yönet.</span>
</span>
<span>
	<i>Not Tut</i>
	<span>Telefon numaralarý, adresler, favori veciheler... Hepsini tek sayfada topla. Bu notlarý kendine saklamak için güvenlik seçeneklerini kullan.</span>
</span>
<span>
	<i>Listeler Yap</i>
	<span>Yapacak þeyler mi var? Veya alýþveriþ listelerin? Tüm bunlar bwallo. üzerinde yap. Ve bwallo.'nun tablet ve mobil eriþebilirliði sayesinde onlarý istediðin yere taþý.</span>
</span>
<span>
	<i>Video Ýzle ve Paylaþ</i>
	<span>Videolarý aramak için interneti kullan ve onlarý tek sayfada izle. Yorumunu arkadaþlarýnla paylaþ.</span>
</span>
<span>
	<i>Öðren</i>
	<span>Duvarýn sonsuz büyüklükte. Basit bir soru cevap sayfasý oluþturmak için ekraný yaratýcý bir þekilde kullan.</span>
</span>
<span>
	<i>Geri Bildirim Topla</i>
	<span>Arkadaþlarýndan, okurlarýndan veya misafirlerden anonim geri bildirimler al. Geri bildirimler için duvarýný bloguna veya sitene yerleþtir.</span>
</span>
<br><br>
Sitede þu an 2 dil aktif. Site lokalizasyonuna katkýda bulunmak isterseniz <a href="[homepage]/includes/langpack/en.js">buradaki dosyayý çevirip</a> iletiþim bölümünden gönderebilirsiniz.
</p>
<!-- [END]ARTICLE -->

<!-- FOOTER -->
<div id="footer">
	<!-- Menu -->
	<ul class="menu">
		<li><a href="[homepage]" lang="tr">anasayfa</a></li>
		<li><a href="[homepage]/create" lang="tr">duvar yarat!</a></li>
		<li class="active"><a href="#" lang="tr">hakkýnda</a></li>
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