<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0">
<style class="bg-style">
	body {
		background-image: url("[wall_wallpaper]")!important;
		background-size: auto!important;
		background-position: initial initial!important;
		background-repeat: initial initial!important;
	}	
</style>

<script type="text/javascript">
	var bg_image = new Image();
		bg_image.src = "[wall_wallpaper]";
		
	bg_image.onload = function(){
		var bg_width = bg_image.width,
			bg_height = bg_image.height;

		if($(window).height() < bg_height || $(window).width() < bg_width){
			$("body").attr("style", "background-size: cover!important; ");
		}
	}
</script>

<!-- WALL -->
	[posts]
<!-- [END]WALL -->

<!-- if ("[wall_authority]" == "p_view" || "[wall_authority]" == "p_write" || "[wall_authority]" == "p_moderate") && "[wall_userfullname]" != "[my_fullname]" -->
	<script type="text/javascript">
	$(function(){
		window.setInterval(function(){
			if(!$('#pass').length){
				location.reload();
			}
		}, 2000);

		$(".fake_border").animate({
			left: 0
		}, 600, function(){
			$(".lightbox").slideDown();
		});

		$("html").on("click", function(event){
			var pass = $("#pass input").val().trim();
			var target = $(event.target);

			if(!target.is(".lightbox") && !target.is(".lightbox *")){
				if(pass == ""){
					$("#pass input").css("border-color", "#d83434");
				}else {
					$("#pass input").css("border-color", "rgb(204, 204, 204)");
				}
			}
		});

		$("#pass .ok").click(function(){
			var pass = $("#pass input").val().trim();

			if(pass == ""){
				$("#pass input").css("border-color", "#d83434");
			}else {
				$("#pass input").css("border-color", "rgb(204, 204, 204)");
				check_wall_pass(pass, "[wall_domain]");
			}
		});
	});
	</script>

	<style>
		body *:not(#pass){
			-webkit-filter: blur(3px);
			-moz-filter: blur(3px);
			-ms-filter: blur(3px);
			-o-filter: blur(3px);
			filter: blur(3px);
		}

		body #pass * {
			-webkit-filter: blur(0)!important;
			-moz-filter: none;
			-ms-filter: none;
			-o-filter: none;
			filter: none;
		}
	</style>

	<!-- PASSWORD PROTECT -->
	<div id="pass">
		<div class="fake_border"></div>

		<div class="lightbox">
			<h1>��FRE KORUMALI DUVAR!</h1>
			<p>Bu duvar� g�rebilmek i�in �ifreyi girmelisin...</p>
			<input type="password" placeholder="Parola" maxlength="50">
			<div class="ok">></div>
			<div class="error">Yanl�� parola...</div>
		</div>
	</div>
	<!-- [END]PASSWORD PROTECT -->
<!-- endif -->

<!-- MENU -->
<ul id="menu">
	<a href="[homepage]">
		<li class="homepage" title="Ana Sayfa">
			<div class="icon">.</div>
		</li>
	</a>

	<a href="[homepage]/create">
		<li class="create" title="Yeni duvar yarat!">+</li>
	</a>
	<!-- if "[wall_userid]" == "1" -->
		<!-- if is_logged_in() -->
			<li title="Bu duvar�n sahibi anonim">
				<div class="icon"></div>
				<div class="qmark">?</div>
			</li>
		<!-- else -->
			<!-- if "[wall_userip]" == "[my_ip]" -->
				<a href="[homepage]/login">
					<li class="login" title="Giri� Yap veya Kay�t Ol">
						<div class="keyicon">
							<div class="key_base"></div>
							<div class="key_squares"></div>
						</div>
					</li>
				</a>
			<!-- else -->
				<li title="Bu duvar�n sahibi anonim">
					<div class="icon"></div>
					<div class="qmark">?</div>
				</li>
			<!-- endif -->
		<!-- endif -->
	<!-- else -->
		<!-- if "[wall_userfullname]" == "[my_fullname]" -->
			<a href="[homepage]/users/[wall_username]">
				<li class="profile" title="Senin profilin">
					<div class="icon"></div>
				</li>
			</a>
		<!-- else -->
			<a href="[homepage]/users/[wall_username]">
				<li class="profile" title="[wall_userfullname_suffix] profili">
					<div class="icon"></div>
				</li>
			</a>
		<!-- endif -->
	<!-- endif -->

	<div class="seperate"></div>

	<li title="Payla� / D��a aktar">
		<div class="icon"></div>
		<div class="icon_back"></div>
		<div class="icon_arrow"></div>
	</li>

	<li title="Duvar bilgileri">
		<div class="icon">i</div>
	</li>

	<li title="Yard�m">
		<div class="icon">?</div>
	</li>

	<div class="seperate"></div>

	<!-- if "[wall_userid]" == "1" -->
		<!-- if !is_logged_in() -->
			<!-- if "[wall_userip]" == "[my_ip]" -->
				<li title="Duvar� d�zenle">
					<div class="icon"></div>
				</li>
			<!-- endif -->
		<!-- endif -->
	<!-- else -->
		<!-- if "[wall_userfullname]" == "[my_fullname]" || "[wall_authority]" == "admin" -->
			<li title="Duvar� d�zenle">
				<div class="icon"></div>
			</li>
		<!-- endif -->
	<!-- endif -->

	<div class="seperate"></div>

	<li class="errready" title="Bilgilendirme">
		<div class="icon"></div>
	</li>

	<!-- if "[wall_userfullname]" == "[my_fullname]" || ("[wall_authority]" != "view" && "[wall_authority]" != "p_view" && "[wall_authority]" != "h_view"  && "[wall_authority]" != "e_view" && "[wall_authority]" != "private") && is_logged_in() -->
		<div class="seperate"></div>
		
		<li title="Yer imleri" class="bookmarks">
			<div class="icon"></div>
		</li>
	<!-- endif -->

	<div class="container">
		<div class="edit">
			<div class="row">
				<div class="profile">
					<div class="left">
						<h1>AVATAR</h1>
						<p>Duvar ile ili�kili k���k bir resim se�in.</p>
						[user_avatars]
					</div>

					<div class="right">
						<h1>BA�LIK</h1>
						<p>�rn: Taare Zameen Par</p>
						<input type="text" name="title" maxlength="125" placeholder="[wall_title]">
						<hr>
						<h1>A�IKLAMA</h1>
						<p>�rn: Her �ocuk �zeldir</p>
						<textarea name="desc" placeholder="[wall_desc]"></textarea>
					</div>
				</div>

				<div class="wallpaper">
					<div class="right">
						<div class="wallpapers">
						<h1>ARKAPLAN</h1>
						<p>G�zel bir duvar ka��d� se�.</p>
							[user_wallpapers]
						</div>
					</div>
				</div>

				<div class="layout">
					<div class="right">
						<h1>D�ZEN</h1>
						<p>Yay�nlar�n�n nas�l g�r�nece�ini se�.</p>
						<ul class="layouts">
							<li>
								<div class="thumb">
									<div></div>
									<div></div>
									<div></div>
									<div></div>
									<div></div>
									<div></div>
								</div>
								<span
								<!-- if "[wall_layout]" == 0 -->
								style="background: #000!important; "
								<!-- endif -->>SERBEST</span>
							</li>
							<li>
								<div class="thumb">
									<div></div>
									<div></div>
									<div></div>
								</div>
								<span
								<!-- if "[wall_layout]" == 1 -->
								style="background: #000!important; "
								<!-- endif -->>AKI�</span>
							</li>
						</ul>
						<hr>
						<h1>�U ANK� TEMA</h1>
						<p>�u an duvar�nda ge�erli olan tema.</p>
						<div class="now">
							<a href="#" onClick="window.location = theme_options.url;"><img></a>
							<h3><a href="#" onClick="window.location = theme_options.url;"><script type="text/javascript">document.write(theme_options.name);</script></a></h1>
							<p><script type="text/javascript">document.write(theme_options.desc);</script></p>
						</div>
						<hr>
						<h1>T�M TEMALARIN</h1>
						<p>Duvar�nda hangi temay� kullanaca��n� se�.</p>
						<ul class="themes">
							[user_themes]
						</ul>
					</div>
				</div>

				<div class="privacy">
					<div class="right">
						<h1>G�ZL�L�K</h1>
						<p>Duvar�n�n g�r�n�rl�l�k ayarlar�n� de�i�tir.</p>
						<form class="privacy_settings" method="post">
							<input type="hidden" value="[wall_authority_e]">
							<br/>
							<input type="radio" name="privacy" value="private" id="private"
							<!-- if "[wall_authority_e]" == "0" -->
							checked="checked"
							<!-- endif -->>
							<label for="private">
								<div>
									<h1>�zel</h1>
									<p>Yaln�z sen ve senin e-posta yoluyla ekledi�in ki�iler duvar�na eri�ebilir.</p>
								</div>
							</label>
							<hr/>
							<input type="radio" name="privacy" value="protected" id="protected"
							<!-- if "[wall_authority_e]" == "1" || "[wall_authority_e]" == "2" || "[wall_authority_e]" == "3" -->
							checked="checked"
							<!-- endif -->>
							<label for="protected">
								<div>
									<h1>
										�ifre Korumal�
										<div class="selectBox">
											<input type="hidden" 
												<!-- if '[wall_authority_e]' == '1' -->
													value="can_view"
												<!-- endif -->

												<!-- if '[wall_authority_e]' == '2' -->
													value="can_write"
												<!-- endif -->

												<!-- if '[wall_authority_e]' == '3' -->
													value="can_read"
												<!-- endif -->
											class="price_values">
											<span class="selected">
											<!-- if "[wall_authority_e]" == "1" -->
												G�r�nt�leyebilir
											<!-- endif -->

											<!-- if "[wall_authority_e]" == "2" -->
												Yazabilir
											<!-- endif -->

											<!-- if "[wall_authority_e]" == "3" -->
												Denetleyebilir
											<!-- endif -->
											</span>
											<span class="selectArrow">&#9660</span>
											<ul class="selectOptions">
												<li class="selectOption" data-value="can_view">
													<h1>G�r�nt�leyebilir</h1>
													<p>Bu duvar� ve payla��mlar� g�r�nt�leyebilir. Ama duvar� denetleyemez, yeni payla��mlar yapamaz ve mevcut payla��mlar� d�zenleyemez. Duvar ayarlar�n� de�i�tiremez</p>
												</li>
												<li class="selectOption" data-value="can_write">
													<h1>Yazabilir</h1>
													<p>Bu duvar� g�r�nt�leyebilir ve duvarda payla��m yapabilir. Sadece kendi payla��mlar�n� d�zenleyebilir, di�er ki�ilerin payla�t�klar�n� d�zenleyemez. Duvar ayarlar�n� de�i�tiremez.</p>
												</li>
												<li class="selectOption" data-value="can_read">
													<h1>Denetleyebilir</h1>
													<p>Bu duvar� g�r�nt�leyebilir ve duvarda payla��m yapabilir. Denetlemeyi gerektiren payla��mlar� d�zenleyebilir ve onaylayabilir. Ama duvar ayarlar�n� de�i�tiremez.</p>
												</li>
											</ul>
										</div>
									</h1>
									<p>
										Duvara eri�im i�in yazd���n �ifrenin girilmesi gerekmektedir.
										<input type="text">
									</p>
								</div>
							</label>
							<hr/>
							<input type="radio" name="privacy" value="hidden" id="hidden"
							<!-- if "[wall_authority_e]" == "4" || "[wall_authority_e]" == "5" || "[wall_authority_e]" == "6" -->
							checked="checked"
							<!-- endif -->>
							<label for="hidden">
								<div>
									<h1>
										Gizli Ba�lant�
										<div class="selectBox">
											<input type="hidden" 
											<!-- if '[wall_authority_e]' == '4' -->
												value="can_view"
											<!-- endif -->

											<!-- if '[wall_authority_e]' == '5' -->
												value="can_write"
											<!-- endif -->

											<!-- if '[wall_authority_e]' == '6' -->
												value="can_read"
											<!-- endif -->
											class="price_values">
											<span class="selected">
											<!-- if "[wall_authority_e]" == "4" -->
												G�r�nt�leyebilir
											<!-- endif -->

											<!-- if "[wall_authority_e]" == "5" -->
												Yazabilir
											<!-- endif -->

											<!-- if "[wall_authority_e]" == "6" -->
												Denetleyebilir
											<!-- endif -->
											</span>
											<span class="selectArrow">&#9660</span>
											<ul class="selectOptions">
												<li class="selectOption" data-value="can_view">
													<h1>G�r�nt�leyebilir</h1>
													<p>Bu duvar� ve payla��mlar� g�r�nt�leyebilir. Ama duvar� denetleyemez, yeni payla��mlar yapamaz ve mevcut payla��mlar� d�zenleyemez. Duvar ayarlar�n� de�i�tiremez</p>
												</li>
												<li class="selectOption" data-value="can_write">
													<h1>Yazabilir</h1>
													<p>Bu duvar� g�r�nt�leyebilir ve duvarda payla��m yapabilir. Sadece kendi payla��mlar�n� d�zenleyebilir, di�er ki�ilerin payla�t�klar�n� d�zenleyemez. Duvar ayarlar�n� de�i�tiremez.</p>
												</li>
												<li class="selectOption" data-value="can_read">
													<h1>Denetleyebilir</h1>
													<p>Bu duvar� g�r�nt�leyebilir ve duvarda payla��m yapabilir. Denetlemeyi gerektiren payla��mlar� d�zenleyebilir ve onaylayabilir. Ama duvar ayarlar�n� de�i�tiremez.</p>
												</li>
											</ul>
										</div>
									</h1>
									<p>Duvara herkes eri�ebilir ancak bu duvar arama motorlar�ndan gizlenir ve bwallo. ana ak���na d��mez.</p>
								</div>
							</label>
							<hr/>
							<input type="radio" name="privacy" value="public" id="public"
							<!-- if "[wall_authority_e]" == "7" || "[wall_authority_e]" == "8" || "[wall_authority_e]" == "9" -->
							checked="checked"
							<!-- endif -->>
							<label for="public">
								<div>
									<h1>
										Herkese A��k
										<div class="selectBox">
											<input type="hidden" 
											<!-- if '[wall_authority_e]' == '7' -->
												value="can_view"
											<!-- endif -->

											<!-- if '[wall_authority_e]' == '8' -->
												value="can_write"
											<!-- endif -->

											<!-- if '[wall_authority_e]' == '9' -->
												value="can_read"
											<!-- endif -->
											class="price_values">
											<span class="selected">
											<!-- if "[wall_authority_e]" == "7" -->
												G�r�nt�leyebilir
											<!-- endif -->

											<!-- if "[wall_authority_e]" == "8" -->
												Yazabilir
											<!-- endif -->

											<!-- if "[wall_authority_e]" == "9" -->
												Denetleyebilir
											<!-- endif -->
											</span>
											<span class="selectArrow">&#9660</span>
											<ul class="selectOptions">
												<li class="selectOption" data-value="can_view">
													<h1>G�r�nt�leyebilir</h1>
													<p>Bu duvar� ve payla��mlar� g�r�nt�leyebilir. Ama duvar� denetleyemez, yeni payla��mlar yapamaz ve mevcut payla��mlar� d�zenleyemez. Duvar ayarlar�n� de�i�tiremez</p>
												</li>
												<li class="selectOption" data-value="can_write">
													<h1>Yazabilir</h1>
													<p>Bu duvar� g�r�nt�leyebilir ve duvarda payla��m yapabilir. Sadece kendi payla��mlar�n� d�zenleyebilir, di�er ki�ilerin payla�t�klar�n� d�zenleyemez. Duvar ayarlar�n� de�i�tiremez.</p>
												</li>
												<li class="selectOption" data-value="can_read">
													<h1>Denetleyebilir</h1>
													<p>Bu duvar� g�r�nt�leyebilir ve duvarda payla��m yapabilir. Denetlemeyi gerektiren payla��mlar� d�zenleyebilir ve onaylayabilir. Ama duvar ayarlar�n� de�i�tiremez.</p>
												</li>
											</ul>
										</div>
									</h1>
									<p>Duvar herkesin eri�imine a��k olur, ana ak��ta ve arama motorlar�nda g�sterilir.</p>
								</div>
							</label>
						</form>

						<h1>E-POSTA �LE K��� EKLE</h1>
						<p style="width: 370px; ">Duvara �zel yetkili ki�iler ekleyebilir ve onlar�n yetkilerini d�zenleyebilirsin. Onlara ba�lant�y� e-posta ile g�nderece�iz.</p>
						<div class="email">
							<ul class="emails">
								[wall_peoples]
							</ul>

							<div class="add">
								<input type="text" placeholder="E-Posta adresi">
								<div class="button inactive">Ekle</div>
							</div>
						</div>
						
						<h1>D��ER</h1>
						<p>Duvar� kontrol etmek i�in di�er gizlilik ayarlar�</p>
						<div class="other">
							<input type="checkbox"
								<!-- if '[wall_moderatedp]' == 1 -->
								checked="checked"
								<!-- endif -->
							id="moderate_posts">
							<label for="moderate_posts">
								<h1>Moderat�r onayl� payla��m</h1>
								<p>Payla��m�n duvarda g�r�lebilmesi i�in moderat�rlerden birinin onay� gereksin.</p>
							</label>
						</div>

						<div class="button">Kaydet</div>
						<div class="button cancel">S�f�rla</div>
					</div>
				</div>

				<div class="notifications">
					<div class="right">
						<h1>B�LD�R�MLER</h1>
						<p>Duvar�ndaki aktivitelerde nas�l bildirim almak istersin?</p>
						<div class="other">
							<input type="checkbox"
								<!-- if '[wall_notifs]' == 1 -->
								checked="checked"
								<!-- endif -->
							id="wall_notifs">
							<label for="wall_notifs">
								<h1>Bildirim g�nder</h1>
								<p>Duvar�ndaki herhangi bir aktivitede bwallo. �zerinden bildirim g�nderelim mi?</p>
							</label>

							<span>
								<hr><p>Genel e-posta bildirimlerine gitmek i�in <a href="[homepage]/settings#notifications">t�kla</a>.</p>
							</span>
						</div>
					</div>
				</div>

				<div class="address">
					<div class="right">
						<h1>DUVAR ADRES�</h1>
						<p>Duvar�n�n benzersiz alan ad�.</p>
						<span>�U AN GE�ERL� ADRES</span>
						<div class="now"><script type="text/javascript">document.write('http://' + window.location.hostname + window.location.pathname);</script></div>
						<span>YEN� B�' ADRES!</span>
						<div class="new">
							<p>[homepage]/</p>
							<input type="text" name="address" maxlength="225">
							<input type="button" value="+">
						</div>
						<hr>
						<p>* Gelecek g�ncellemeyle alan adlar�n�zda da duvarlar�n�z� kullanabileceksiniz. Server i�in para biriktiriyorum.</p>
					</div>
				</div>

				<div class="delete">
					<div class="right">
						<h1>DUVARDAK� G�NDER�LER� S�L</h1>
						<p>
							Duvar� tamamen silmeden i�indeki t�m payla��mlar� silmene olanak sa�lar.
						</p>
						<a onclick="clear_posts('[wall_domain]'); "><div class="button clear">Duvar� temizle.</div></a>
						<br><hr>
						<h1>DUVARI S�L</h1>
						<p>
							Duvar� silmenle birlikte �zerindeki b�t�n yay�nlar da silinecektir.<br><br>
							<b>Bu duvar� silmek istedi�inden emin misin?</b>
						</p>
						<a href="[homepage]/delete-wall/[wall_domain]"><div class="button cancel">Evet! Hemen sil.</div></a>
					</div>
				</div>
			</div>

			<div class="sections">
				<div class="active">
					<div class="icon"></div>
					<h1>Temel</h1>
				</div>

				<div>
					<div class="icon"></div>
					<h1>Arkaplan</h1>
				</div>

				<div>
					<div class="icon"></div>
					<h1>G�r�n�m</h1>
				</div>

				<div>
					<div class="icon_base"></div>
					<div class="icon_handle"></div>
					<h1>Gizlilik</h1>
				</div>

				<div>
					<div class="icon_top"></div>
					<div class="icon_bottom"></div>
					<h1>Bildirimler</h1>
				</div>

				<div>
					<div class="icon"></div>
					<h1>Adres</h1>
				</div>
				
				<div>
					<div class="icon"></div>
					<h1>Duvar� Sil</h1>
				</div>
			</div>
			
			<div class="notifs">
				<div class="saving">
					<div class="icon">i</div>
					<p>Bekleyin, de�i�iklikler kaydediliyor...</p>
				</div>

				<div class="info">
					<div class="icon">i</div>
					<p>S�f�rlamak i�in space tu�unu kullan�n...</p>
				</div>

				<div style="clear: both; "></div>
			</div>
		</div>

		<div class="share">
			<h1>Bu Duvar� Payla�</h1>
			<div class="icons">
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
			</div>

			<h1>D��a Aktar</h1>
			<div class="export_icons">
				<div class="icon" title="PDF"></div>
				<div class="icon" title="Excel"></div>
				<div class="icon" title="CSV"></div>
			</div>
			
			<div class="other">
				<div>Yazd�r</div>
				<div>Arkada��na Yolla</div>
				<div>RSS Beslemesi</div>
			</div>

			<h1>Websitene Ekle!</h1>
			<p>Bu kodu kopyal�p website ya da bloguna yap��t�r.</p>
			<textarea readonly><iframe src='[wall_url]' frameborder='0' width='100%' height='280px' style='padding: 0; margin: 0; border: none'></iframe><a href='[homepage]' style='color: #41555f; text-decoration: none;'><div style='border-top: 2px solid #347BB2; padding: 8px;margin: 0; font-size: 12px;text-align: right'>bwallo. ile yarat�ld�<img valign='middle' style='margin: 0 0 0 10px; padding: 0;border: none; width: 16px; height: 16px' src='[homepage]/[site_favicon]'></div></a></textarea>
			<p><b>Wordpress mi kullan�yorsun?</b><br />Bu kodu kopyal�p Wordpress makalene yap��t�r. Fakat �nce bloguna <a href="http://wordpress.org/plugins/">bwallo. shortcode eklentisi</a>ni kurmal�s�n.</p>
			<textarea class="wordpress" readonly>[bwallo key='[wall_domain]' width='100%' height='280']</textarea>

			<h1>Telefon i�in QR Kodu</h1>
			<img src="[wall_qr]">
		</div>

		<div class="info">
			<h1 class="total_post"><script type="text/javascript">setTimeout(function(){timer = setInterval(function(){$("h1.total_post").text($(".posts").children().size()); clearInterval(timer);}, 50);}, 2000);</script></h1>
			<p>Toplam payla��m</p>

			<h1 class="user_fullname">[wall_userfullname]</h1>
			<p>Duvar�n sahibi</p>

			<h1 class="created_time">[wall_createdtime]</h1>
			<p>Olu�turulma zaman�</p>
		</div>

		<div class="help">
			<a href="[homepage]/page/faq" class="button">SSS</a>
			<a href="https://www.facebook.com/main.jsf" class="button">SORU SOR</a><br><br><br>
			<hr>
			Bu bir bwallo. duvar�. Bunu bo� bir sayfaya benzetebilirsin.
			<hr>
			<h3>OLU�TURMA</h3>
			<ol>
				<li>Anasayfadaki "hemen ba�la!" butonuna, "+" butonlar�na veya <a href="[homepage]/create">buraya</a> t�klayarak yeni duvar yaratabilirsiniz.</li>
				<li>Duvar�n kenar men�s�ndeki kalem i�aretiyle g�sterilen "Duvar� d�zenle" tab�ndan duvar�n� d�zenleyebilirsin.</li>
				<li>E�er duvar� hesab�na kay�tl� olarak olu�turduysan �ncelikle giri� yapmal�s�n. Siteye kay�t oldu�unda ise daha �nce anonim olarak olu�turdu�un duvarlar otomatik olarak hesab�na aktar�l�r. Ad�n�n gizli kalmas�n� istiyorsan ��k�� yaparak duvar olu�turabilirsin.</li>
			</ol><hr>
			<h3>G�R�NT�LEME</h3>
			<ol>
				<li>Yay�n� okumak i�in yay�na sa� t�klay�p a� demelisin.</li>
				<li>A��lan sayfada yay�n�n makalesini okuyabilir, yorum yapabilir, be�enebilir ve yay�n� kendi duvarlar�nda birinde payla�abilirsin.</li>
			</ol><hr>
			<h3>OLU�TURMA</h3>
			<ol>
				<li>Herhangi bir yere �ift t�klayarak yay�n olu�turabilirsin.</li>
			</ol><hr>
			<h3>D�ZENLEME</h3>
			<ol>
				<li>Yay�n�n alt k�sm�ndaki kalem i�aretine veya yay�n�n �st�ne sa� t�klay�nca a��lan men�deki d�zenleye t�klayarak yay�n� d�zenleyebilirsin, yay�ndan farkl� bir yere t�klay�nca de�i�ikli�in kaydedilmi� olur.</li>
			</ol><hr>
			<h3>PAYLA�IM</h3>
			<ol>
				<li>Yay�n� kendi duvar�nda payla�mak i�in yay�n� a� ve daha sonra payla� butonuna t�kla.</li>
				<li>Yay�n� sosyal a�larda payla�mak i�in URL'i kullanabilirsin.</li>
				<li>Duvar� sosyal a�larda payla�mak i�in duvar�n kenar men�s�ndeki "Payla� / D��a Aktar" sekmesini kullanabilirsin.</li>
			</ol><hr>
		</div>
		
		<!-- if "[wall_userid]" == "1" -->
			<!-- if !is_logged_in() -->
				<div class="notice">
				<!-- if "[wall_userip]" == "[my_ip]" -->
					<h1>Hey! Duvar�n haz�rland�.</h1>
					<h2>Hemen ba�la!</h2>
					<p><b>�ift t�klayarak</b> veya <b>bir dosyay� s�r�kleyerek</b> payla��m yap�n.</p>
					<div class="or">
						<p>VEYA</p>
						<hr />
					</div>
					<h2>Duvar� d�zenle</h2>
					<p>
						Ba�l�k, a��klama ekle, arkaplan� veya gizlili�i de�i�tir...
						<div class="button">Duvar� d�zenle.</div>
					</p>
				<!-- else -->
					<h1>L�tfen giri� yap�n.</h1>
					<p>Dosyay� d�zenlemek i�in giri� yapman�z gerekmektedir. Devam etmek i�in l�tfen giri� yap�n.</p>	
				<!-- endif -->
				</div>
			<!-- endif -->
		<!-- else -->
			<div class="notice">
			<!-- if "[wall_userfullname]" == "[my_fullname]" || ("[wall_authority]" != "view" && "[wall_authority]" != "p_view" && "[wall_authority]" != "h_view"  && "[wall_authority]" != "e_view" && "[wall_authority]" != "private") -->
				<h1>Hey! Duvar�n haz�rland�.</h1>
				<h2>Hemen ba�la!</h2>
				<p><b>�ift t�klayarak</b> veya <b>bir dosyay� s�r�kleyerek</b> payla��m yap�n.</p>
				<div class="or">
					<p>VEYA</p>
					<hr />
				</div>
				<h2>Duvar� d�zenle</h2>
				<p>
					Ba�l�k, a��klama ekle, arkaplan� veya gizlili�i de�i�tir...
					<div class="button">Duvar� d�zenle.</div>
				</p>
			<!-- else -->
				<h1>L�tfen giri� yap�n.</h1>
				<p>Dosyay� d�zenlemek i�in giri� yapman�z gerekmektedir. Devam etmek i�in l�tfen giri� yap�n.</p>	
			<!-- endif -->
			</div>
		<!-- endif -->

		<div class="bookmarks">
			Yer imlerin burada
		</div>
	</div>
</ul>

<div class="expand">
	<div class="icon"></div>
</div>
<!-- [END]MENU -->

<!-- if "[wall_userid]" == "1" -->
	<!-- if !is_logged_in() -->
		<!-- if "[wall_userip]" == "[my_ip]" -->
			<div class="notify"><b>�ift t�klayarak</b> veya <b>bir dosyay� s�r�kleyerek</b> payla��m yap�n.</div>
		<!-- endif -->
	<!-- endif -->
<!-- else -->
	<!-- if "[wall_userfullname]" == "[my_fullname]" || ("[wall_authority]" != "view" && "[wall_authority]" != "p_view" && "[wall_authority]" != "h_view"  && "[wall_authority]" != "e_view" && "[wall_authority]" != "private") -->
		<div class="notify"><b>�ift t�klayarak</b> veya <b>bir dosyay� s�r�kleyerek</b> payla��m yap�n.</div>
	<!-- endif -->
<!-- endif -->