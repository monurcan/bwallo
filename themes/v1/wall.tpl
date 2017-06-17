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
			<h1>ÞÝFRE KORUMALI DUVAR!</h1>
			<p>Bu duvarý görebilmek için þifreyi girmelisin...</p>
			<input type="password" placeholder="Parola" maxlength="50">
			<div class="ok">></div>
			<div class="error">Yanlýþ parola...</div>
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
			<li title="Bu duvarýn sahibi anonim">
				<div class="icon"></div>
				<div class="qmark">?</div>
			</li>
		<!-- else -->
			<!-- if "[wall_userip]" == "[my_ip]" -->
				<a href="[homepage]/login">
					<li class="login" title="Giriþ Yap veya Kayýt Ol">
						<div class="keyicon">
							<div class="key_base"></div>
							<div class="key_squares"></div>
						</div>
					</li>
				</a>
			<!-- else -->
				<li title="Bu duvarýn sahibi anonim">
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

	<li title="Paylaþ / Dýþa aktar">
		<div class="icon"></div>
		<div class="icon_back"></div>
		<div class="icon_arrow"></div>
	</li>

	<li title="Duvar bilgileri">
		<div class="icon">i</div>
	</li>

	<li title="Yardým">
		<div class="icon">?</div>
	</li>

	<div class="seperate"></div>

	<!-- if "[wall_userid]" == "1" -->
		<!-- if !is_logged_in() -->
			<!-- if "[wall_userip]" == "[my_ip]" -->
				<li title="Duvarý düzenle">
					<div class="icon"></div>
				</li>
			<!-- endif -->
		<!-- endif -->
	<!-- else -->
		<!-- if "[wall_userfullname]" == "[my_fullname]" || "[wall_authority]" == "admin" -->
			<li title="Duvarý düzenle">
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
						<p>Duvar ile iliþkili küçük bir resim seçin.</p>
						[user_avatars]
					</div>

					<div class="right">
						<h1>BAÞLIK</h1>
						<p>Örn: Taare Zameen Par</p>
						<input type="text" name="title" maxlength="125" placeholder="[wall_title]">
						<hr>
						<h1>AÇIKLAMA</h1>
						<p>Örn: Her Çocuk Özeldir</p>
						<textarea name="desc" placeholder="[wall_desc]"></textarea>
					</div>
				</div>

				<div class="wallpaper">
					<div class="right">
						<div class="wallpapers">
						<h1>ARKAPLAN</h1>
						<p>Güzel bir duvar kaðýdý seç.</p>
							[user_wallpapers]
						</div>
					</div>
				</div>

				<div class="layout">
					<div class="right">
						<h1>DÜZEN</h1>
						<p>Yayýnlarýnýn nasýl görüneceðini seç.</p>
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
								<!-- endif -->>AKIÞ</span>
							</li>
						</ul>
						<hr>
						<h1>ÞU ANKÝ TEMA</h1>
						<p>Þu an duvarýnda geçerli olan tema.</p>
						<div class="now">
							<a href="#" onClick="window.location = theme_options.url;"><img></a>
							<h3><a href="#" onClick="window.location = theme_options.url;"><script type="text/javascript">document.write(theme_options.name);</script></a></h1>
							<p><script type="text/javascript">document.write(theme_options.desc);</script></p>
						</div>
						<hr>
						<h1>TÜM TEMALARIN</h1>
						<p>Duvarýnda hangi temayý kullanacaðýný seç.</p>
						<ul class="themes">
							[user_themes]
						</ul>
					</div>
				</div>

				<div class="privacy">
					<div class="right">
						<h1>GÝZLÝLÝK</h1>
						<p>Duvarýnýn görünürlülük ayarlarýný deðiþtir.</p>
						<form class="privacy_settings" method="post">
							<input type="hidden" value="[wall_authority_e]">
							<br/>
							<input type="radio" name="privacy" value="private" id="private"
							<!-- if "[wall_authority_e]" == "0" -->
							checked="checked"
							<!-- endif -->>
							<label for="private">
								<div>
									<h1>Özel</h1>
									<p>Yalnýz sen ve senin e-posta yoluyla eklediðin kiþiler duvarýna eriþebilir.</p>
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
										Þifre Korumalý
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
												Görüntüleyebilir
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
													<h1>Görüntüleyebilir</h1>
													<p>Bu duvarý ve paylaþýmlarý görüntüleyebilir. Ama duvarý denetleyemez, yeni paylaþýmlar yapamaz ve mevcut paylaþýmlarý düzenleyemez. Duvar ayarlarýný deðiþtiremez</p>
												</li>
												<li class="selectOption" data-value="can_write">
													<h1>Yazabilir</h1>
													<p>Bu duvarý görüntüleyebilir ve duvarda paylaþým yapabilir. Sadece kendi paylaþýmlarýný düzenleyebilir, diðer kiþilerin paylaþtýklarýný düzenleyemez. Duvar ayarlarýný deðiþtiremez.</p>
												</li>
												<li class="selectOption" data-value="can_read">
													<h1>Denetleyebilir</h1>
													<p>Bu duvarý görüntüleyebilir ve duvarda paylaþým yapabilir. Denetlemeyi gerektiren paylaþýmlarý düzenleyebilir ve onaylayabilir. Ama duvar ayarlarýný deðiþtiremez.</p>
												</li>
											</ul>
										</div>
									</h1>
									<p>
										Duvara eriþim için yazdýðýn þifrenin girilmesi gerekmektedir.
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
										Gizli Baðlantý
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
												Görüntüleyebilir
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
													<h1>Görüntüleyebilir</h1>
													<p>Bu duvarý ve paylaþýmlarý görüntüleyebilir. Ama duvarý denetleyemez, yeni paylaþýmlar yapamaz ve mevcut paylaþýmlarý düzenleyemez. Duvar ayarlarýný deðiþtiremez</p>
												</li>
												<li class="selectOption" data-value="can_write">
													<h1>Yazabilir</h1>
													<p>Bu duvarý görüntüleyebilir ve duvarda paylaþým yapabilir. Sadece kendi paylaþýmlarýný düzenleyebilir, diðer kiþilerin paylaþtýklarýný düzenleyemez. Duvar ayarlarýný deðiþtiremez.</p>
												</li>
												<li class="selectOption" data-value="can_read">
													<h1>Denetleyebilir</h1>
													<p>Bu duvarý görüntüleyebilir ve duvarda paylaþým yapabilir. Denetlemeyi gerektiren paylaþýmlarý düzenleyebilir ve onaylayabilir. Ama duvar ayarlarýný deðiþtiremez.</p>
												</li>
											</ul>
										</div>
									</h1>
									<p>Duvara herkes eriþebilir ancak bu duvar arama motorlarýndan gizlenir ve bwallo. ana akýþýna düþmez.</p>
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
										Herkese Açýk
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
												Görüntüleyebilir
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
													<h1>Görüntüleyebilir</h1>
													<p>Bu duvarý ve paylaþýmlarý görüntüleyebilir. Ama duvarý denetleyemez, yeni paylaþýmlar yapamaz ve mevcut paylaþýmlarý düzenleyemez. Duvar ayarlarýný deðiþtiremez</p>
												</li>
												<li class="selectOption" data-value="can_write">
													<h1>Yazabilir</h1>
													<p>Bu duvarý görüntüleyebilir ve duvarda paylaþým yapabilir. Sadece kendi paylaþýmlarýný düzenleyebilir, diðer kiþilerin paylaþtýklarýný düzenleyemez. Duvar ayarlarýný deðiþtiremez.</p>
												</li>
												<li class="selectOption" data-value="can_read">
													<h1>Denetleyebilir</h1>
													<p>Bu duvarý görüntüleyebilir ve duvarda paylaþým yapabilir. Denetlemeyi gerektiren paylaþýmlarý düzenleyebilir ve onaylayabilir. Ama duvar ayarlarýný deðiþtiremez.</p>
												</li>
											</ul>
										</div>
									</h1>
									<p>Duvar herkesin eriþimine açýk olur, ana akýþta ve arama motorlarýnda gösterilir.</p>
								</div>
							</label>
						</form>

						<h1>E-POSTA ÝLE KÝÞÝ EKLE</h1>
						<p style="width: 370px; ">Duvara özel yetkili kiþiler ekleyebilir ve onlarýn yetkilerini düzenleyebilirsin. Onlara baðlantýyý e-posta ile göndereceðiz.</p>
						<div class="email">
							<ul class="emails">
								[wall_peoples]
							</ul>

							<div class="add">
								<input type="text" placeholder="E-Posta adresi">
								<div class="button inactive">Ekle</div>
							</div>
						</div>
						
						<h1>DÝÐER</h1>
						<p>Duvarý kontrol etmek için diðer gizlilik ayarlarý</p>
						<div class="other">
							<input type="checkbox"
								<!-- if '[wall_moderatedp]' == 1 -->
								checked="checked"
								<!-- endif -->
							id="moderate_posts">
							<label for="moderate_posts">
								<h1>Moderatör onaylý paylaþým</h1>
								<p>Paylaþýmýn duvarda görülebilmesi için moderatörlerden birinin onayý gereksin.</p>
							</label>
						</div>

						<div class="button">Kaydet</div>
						<div class="button cancel">Sýfýrla</div>
					</div>
				</div>

				<div class="notifications">
					<div class="right">
						<h1>BÝLDÝRÝMLER</h1>
						<p>Duvarýndaki aktivitelerde nasýl bildirim almak istersin?</p>
						<div class="other">
							<input type="checkbox"
								<!-- if '[wall_notifs]' == 1 -->
								checked="checked"
								<!-- endif -->
							id="wall_notifs">
							<label for="wall_notifs">
								<h1>Bildirim gönder</h1>
								<p>Duvarýndaki herhangi bir aktivitede bwallo. üzerinden bildirim gönderelim mi?</p>
							</label>

							<span>
								<hr><p>Genel e-posta bildirimlerine gitmek için <a href="[homepage]/settings#notifications">týkla</a>.</p>
							</span>
						</div>
					</div>
				</div>

				<div class="address">
					<div class="right">
						<h1>DUVAR ADRESÝ</h1>
						<p>Duvarýnýn benzersiz alan adý.</p>
						<span>ÞU AN GEÇERLÝ ADRES</span>
						<div class="now"><script type="text/javascript">document.write('http://' + window.location.hostname + window.location.pathname);</script></div>
						<span>YENÝ BÝ' ADRES!</span>
						<div class="new">
							<p>[homepage]/</p>
							<input type="text" name="address" maxlength="225">
							<input type="button" value="+">
						</div>
						<hr>
						<p>* Gelecek güncellemeyle alan adlarýnýzda da duvarlarýnýzý kullanabileceksiniz. Server için para biriktiriyorum.</p>
					</div>
				</div>

				<div class="delete">
					<div class="right">
						<h1>DUVARDAKÝ GÖNDERÝLERÝ SÝL</h1>
						<p>
							Duvarý tamamen silmeden içindeki tüm paylaþýmlarý silmene olanak saðlar.
						</p>
						<a onclick="clear_posts('[wall_domain]'); "><div class="button clear">Duvarý temizle.</div></a>
						<br><hr>
						<h1>DUVARI SÝL</h1>
						<p>
							Duvarý silmenle birlikte üzerindeki bütün yayýnlar da silinecektir.<br><br>
							<b>Bu duvarý silmek istediðinden emin misin?</b>
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
					<h1>Görünüm</h1>
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
					<h1>Duvarý Sil</h1>
				</div>
			</div>
			
			<div class="notifs">
				<div class="saving">
					<div class="icon">i</div>
					<p>Bekleyin, deðiþiklikler kaydediliyor...</p>
				</div>

				<div class="info">
					<div class="icon">i</div>
					<p>Sýfýrlamak için space tuþunu kullanýn...</p>
				</div>

				<div style="clear: both; "></div>
			</div>
		</div>

		<div class="share">
			<h1>Bu Duvarý Paylaþ</h1>
			<div class="icons">
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
				<a><div class="icon"></div></a>
			</div>

			<h1>Dýþa Aktar</h1>
			<div class="export_icons">
				<div class="icon" title="PDF"></div>
				<div class="icon" title="Excel"></div>
				<div class="icon" title="CSV"></div>
			</div>
			
			<div class="other">
				<div>Yazdýr</div>
				<div>Arkadaþýna Yolla</div>
				<div>RSS Beslemesi</div>
			</div>

			<h1>Websitene Ekle!</h1>
			<p>Bu kodu kopyalýp website ya da bloguna yapýþtýr.</p>
			<textarea readonly><iframe src='[wall_url]' frameborder='0' width='100%' height='280px' style='padding: 0; margin: 0; border: none'></iframe><a href='[homepage]' style='color: #41555f; text-decoration: none;'><div style='border-top: 2px solid #347BB2; padding: 8px;margin: 0; font-size: 12px;text-align: right'>bwallo. ile yaratýldý<img valign='middle' style='margin: 0 0 0 10px; padding: 0;border: none; width: 16px; height: 16px' src='[homepage]/[site_favicon]'></div></a></textarea>
			<p><b>Wordpress mi kullanýyorsun?</b><br />Bu kodu kopyalýp Wordpress makalene yapýþtýr. Fakat önce bloguna <a href="http://wordpress.org/plugins/">bwallo. shortcode eklentisi</a>ni kurmalýsýn.</p>
			<textarea class="wordpress" readonly>[bwallo key='[wall_domain]' width='100%' height='280']</textarea>

			<h1>Telefon için QR Kodu</h1>
			<img src="[wall_qr]">
		</div>

		<div class="info">
			<h1 class="total_post"><script type="text/javascript">setTimeout(function(){timer = setInterval(function(){$("h1.total_post").text($(".posts").children().size()); clearInterval(timer);}, 50);}, 2000);</script></h1>
			<p>Toplam paylaþým</p>

			<h1 class="user_fullname">[wall_userfullname]</h1>
			<p>Duvarýn sahibi</p>

			<h1 class="created_time">[wall_createdtime]</h1>
			<p>Oluþturulma zamaný</p>
		</div>

		<div class="help">
			<a href="[homepage]/page/faq" class="button">SSS</a>
			<a href="https://www.facebook.com/main.jsf" class="button">SORU SOR</a><br><br><br>
			<hr>
			Bu bir bwallo. duvarý. Bunu boþ bir sayfaya benzetebilirsin.
			<hr>
			<h3>OLUÞTURMA</h3>
			<ol>
				<li>Anasayfadaki "hemen baþla!" butonuna, "+" butonlarýna veya <a href="[homepage]/create">buraya</a> týklayarak yeni duvar yaratabilirsiniz.</li>
				<li>Duvarýn kenar menüsündeki kalem iþaretiyle gösterilen "Duvarý düzenle" tabýndan duvarýný düzenleyebilirsin.</li>
				<li>Eðer duvarý hesabýna kayýtlý olarak oluþturduysan öncelikle giriþ yapmalýsýn. Siteye kayýt olduðunda ise daha önce anonim olarak oluþturduðun duvarlar otomatik olarak hesabýna aktarýlýr. Adýnýn gizli kalmasýný istiyorsan çýkýþ yaparak duvar oluþturabilirsin.</li>
			</ol><hr>
			<h3>GÖRÜNTÜLEME</h3>
			<ol>
				<li>Yayýný okumak için yayýna sað týklayýp aç demelisin.</li>
				<li>Açýlan sayfada yayýnýn makalesini okuyabilir, yorum yapabilir, beðenebilir ve yayýný kendi duvarlarýnda birinde paylaþabilirsin.</li>
			</ol><hr>
			<h3>OLUÞTURMA</h3>
			<ol>
				<li>Herhangi bir yere çift týklayarak yayýn oluþturabilirsin.</li>
			</ol><hr>
			<h3>DÜZENLEME</h3>
			<ol>
				<li>Yayýnýn alt kýsmýndaki kalem iþaretine veya yayýnýn üstüne sað týklayýnca açýlan menüdeki düzenleye týklayarak yayýný düzenleyebilirsin, yayýndan farklý bir yere týklayýnca deðiþikliðin kaydedilmiþ olur.</li>
			</ol><hr>
			<h3>PAYLAÞIM</h3>
			<ol>
				<li>Yayýný kendi duvarýnda paylaþmak için yayýný aç ve daha sonra paylaþ butonuna týkla.</li>
				<li>Yayýný sosyal aðlarda paylaþmak için URL'i kullanabilirsin.</li>
				<li>Duvarý sosyal aðlarda paylaþmak için duvarýn kenar menüsündeki "Paylaþ / Dýþa Aktar" sekmesini kullanabilirsin.</li>
			</ol><hr>
		</div>
		
		<!-- if "[wall_userid]" == "1" -->
			<!-- if !is_logged_in() -->
				<div class="notice">
				<!-- if "[wall_userip]" == "[my_ip]" -->
					<h1>Hey! Duvarýn hazýrlandý.</h1>
					<h2>Hemen baþla!</h2>
					<p><b>Çift týklayarak</b> veya <b>bir dosyayý sürükleyerek</b> paylaþým yapýn.</p>
					<div class="or">
						<p>VEYA</p>
						<hr />
					</div>
					<h2>Duvarý düzenle</h2>
					<p>
						Baþlýk, açýklama ekle, arkaplaný veya gizliliði deðiþtir...
						<div class="button">Duvarý düzenle.</div>
					</p>
				<!-- else -->
					<h1>Lütfen giriþ yapýn.</h1>
					<p>Dosyayý düzenlemek için giriþ yapmanýz gerekmektedir. Devam etmek için lütfen giriþ yapýn.</p>	
				<!-- endif -->
				</div>
			<!-- endif -->
		<!-- else -->
			<div class="notice">
			<!-- if "[wall_userfullname]" == "[my_fullname]" || ("[wall_authority]" != "view" && "[wall_authority]" != "p_view" && "[wall_authority]" != "h_view"  && "[wall_authority]" != "e_view" && "[wall_authority]" != "private") -->
				<h1>Hey! Duvarýn hazýrlandý.</h1>
				<h2>Hemen baþla!</h2>
				<p><b>Çift týklayarak</b> veya <b>bir dosyayý sürükleyerek</b> paylaþým yapýn.</p>
				<div class="or">
					<p>VEYA</p>
					<hr />
				</div>
				<h2>Duvarý düzenle</h2>
				<p>
					Baþlýk, açýklama ekle, arkaplaný veya gizliliði deðiþtir...
					<div class="button">Duvarý düzenle.</div>
				</p>
			<!-- else -->
				<h1>Lütfen giriþ yapýn.</h1>
				<p>Dosyayý düzenlemek için giriþ yapmanýz gerekmektedir. Devam etmek için lütfen giriþ yapýn.</p>	
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
			<div class="notify"><b>Çift týklayarak</b> veya <b>bir dosyayý sürükleyerek</b> paylaþým yapýn.</div>
		<!-- endif -->
	<!-- endif -->
<!-- else -->
	<!-- if "[wall_userfullname]" == "[my_fullname]" || ("[wall_authority]" != "view" && "[wall_authority]" != "p_view" && "[wall_authority]" != "h_view"  && "[wall_authority]" != "e_view" && "[wall_authority]" != "private") -->
		<div class="notify"><b>Çift týklayarak</b> veya <b>bir dosyayý sürükleyerek</b> paylaþým yapýn.</div>
	<!-- endif -->
<!-- endif -->