<!-- HEADER -->
<div id="header">
	<a href="[homepage]"><img src="[theme]src/logo-white.png"></a>
	<form class="search" action="/index.php" method="GET">
		<input type="hidden" name="do" value="search">
		<input type="text" name="src" placeholder="Bir �eyler ara..." value="Hakk�nda" lang="tr">
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
	<h3 lang="tr">bwallo<span>.</span> hakk�nda</h3>
</header>
<div class="stats">
	<li>
		<div>[user_count]</div>
		<span>kullan�c�</span>
	</li>
	<li>
		<div>[wall_count]</div>
		<span>duvar</span>
	</li>
	<li>
		<div>[post_count]</div>
		<span>payla��m</span>
	</li>
	<li>
		<div>1</div>
		<span>�al��an</span>
	</li>
</div>
<!-- [END]PAGE -->

<!-- ARTICLE -->
<p class="article">
<b>bwallo. zahmetsizce diledi�ini payla�man�, i�erikleri kolayca bulman� sa�lar.</b><br><br>
Taray�c�ndan, telefonundan, masa�st�nden, e-postandan veya m�mk�n olan her yerden metin, foto�raf, al�nt�, ba�lant�, m�zik ve video g�nder. Duvar�na temalar y�kleyerek �zelle�tirebilir, geli�mi� edit�rden yararlanabilir, not b�rakabilir, makale yazabilir veya i�erikleri ke�fedebilirsin.<br><br>
2014 y�l�nda a��lan bwallo. �u an beta s�recindedir. Bu a�amada baz� hatalar olabilir, l�tfen sitede buldu�unuz hatalar� ileti�im b�l�m�n� kullanarak bildirin.<br><br>
<b>Neden kullanmal�y�m?</b><br><br>
<span>
	<i>Duyuru Panolar� Yap</i>
	<span>Ger�ek duyuru panosundaki gibi duvar�nda payla��mlar yap. Duvar�n�n RSS beslemesini takip eden insanlara mesaj otomatik olarak ula�s�n.</span>
</span>
<span>
	<i>��ret</i>
	<span>bwallo. belki de bir �ocu�un kullanabilece�ini en basit sitedir. Tek bir sayfada soru sor, sorular�na cevap al ve cevaplara geri d�n�� yap.</span>
</span>
<span>
	<i>Favori Sitelerini Kaydet</i>
	<span>T�m favori sayfa adreslerini tek bir sayfaya koy. E�er bu linkler videolar veya d�k�manlarsa sayfada g�r�nt�lebilirsin.</span>
</span>
<span>
	<i>Tart��</i>
	<span>Mac veya PC? iPhone veya Android? T�m bunlar� tek bir grupta tart��. Edepsiz olanlardan kurtulmak i�in moderat�rl�k �zelli�ini kullan.</span>
</span>
<span>
	<i>Beyin F�rt�nas� Yap</i>
	<span>Fikirlerini payla�. �yilerini k�t�lerinden ay�rmak i�in serbest ak�� �zelli�ini kullan. Alt ba�l�k ve ba�l�k d���nda upuzun i�erik bile yazabilirsin.</span>
</span>
<span>
	<i>Arkada�lar�n� Kutla</i>
	<span>�zel bir g�nde onlara s�rpriz yap. Kutlama duvar�na kartlar ve m�zik ekleyebilirsin.</span>
</span>
<span>
	<i>Olaylar� Planla</i>
	<span>Neden basiti varken karma��k se�enekleri kullanas�n ki? Sadece bir duvar yarat, etkinli�i e-postala, arkada�lar�n duvar �zerinde gelip gelmeyeceklerini sana s�ylesin. Farkl� �eyleri ayn� sayfada y�net.</span>
</span>
<span>
	<i>Not Tut</i>
	<span>Telefon numaralar�, adresler, favori veciheler... Hepsini tek sayfada topla. Bu notlar� kendine saklamak i�in g�venlik se�eneklerini kullan.</span>
</span>
<span>
	<i>Listeler Yap</i>
	<span>Yapacak �eyler mi var? Veya al��veri� listelerin? T�m bunlar bwallo. �zerinde yap. Ve bwallo.'nun tablet ve mobil eri�ebilirli�i sayesinde onlar� istedi�in yere ta��.</span>
</span>
<span>
	<i>Video �zle ve Payla�</i>
	<span>Videolar� aramak i�in interneti kullan ve onlar� tek sayfada izle. Yorumunu arkada�lar�nla payla�.</span>
</span>
<span>
	<i>��ren</i>
	<span>Duvar�n sonsuz b�y�kl�kte. Basit bir soru cevap sayfas� olu�turmak i�in ekran� yarat�c� bir �ekilde kullan.</span>
</span>
<span>
	<i>Geri Bildirim Topla</i>
	<span>Arkada�lar�ndan, okurlar�ndan veya misafirlerden anonim geri bildirimler al. Geri bildirimler i�in duvar�n� bloguna veya sitene yerle�tir.</span>
</span>
<br><br>
Sitede �u an 2 dil aktif. Site lokalizasyonuna katk�da bulunmak isterseniz <a href="[homepage]/includes/langpack/en.js">buradaki dosyay� �evirip</a> ileti�im b�l�m�nden g�nderebilirsiniz.
</p>
<!-- [END]ARTICLE -->

<!-- FOOTER -->
<div id="footer">
	<!-- Menu -->
	<ul class="menu">
		<li><a href="[homepage]" lang="tr">anasayfa</a></li>
		<li><a href="[homepage]/create" lang="tr">duvar yarat!</a></li>
		<li class="active"><a href="#" lang="tr">hakk�nda</a></li>
		<li><a href="[homepage]/page/terms" lang="tr">gizlilik ve kullan�m</a></li>
		<li><a href="[homepage]/updates" lang="tr">g�ncellemeler</a></li>
		<li><a href="[homepage]/page/contact" lang="tr">ileti�im</a></li>
		<li><a href="[homepage]/page/faq" lang="tr">sss</a></li>
		<li lang="tr"><a onclick="window.lang.change('en');">english</a></li>
	</ul>
	<!--#Menu -->

	<!-- Copyright -->
	<div class="copyright"><span>powered by</span> <a href="[homepage]/blog">m.onurcan<b>kaya</b></a></div>
	<!--#Copyright -->
</div>
<!-- [END]FOOTER -->