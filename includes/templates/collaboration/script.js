jQuery.fn.closestToOffset = function(offset){
	var el = null, elOffset, x = offset.left, y = offset.top, distance, dx, dy, minDistance;
	this.each(function(){
		elOffset = $(this).offset();

		if((x >= elOffset.left)  && (x <= elOffset.right) && (y >= elOffset.top) && (y <= elOffset.bottom)){
			el = $(this);
			return false;
		}

		var offsets = [[elOffset.left, elOffset.top], [elOffset.right, elOffset.top], [elOffset.left, elOffset.bottom], [elOffset.right, elOffset.bottom]];
		for(off in offsets){
			dx = offsets[off][0] - x;
			dy = offsets[off][1] - y;
			distance = Math.sqrt((dx*dx) + (dy*dy));
			if(minDistance === undefined || distance < minDistance){
				minDistance = distance;
				el = $(this);
			}
		}
	});
	return el;
}

function colorToHex(color){
	if(color.substr(0, 1) === '#'){
		return color;
	}
	var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(color);

	var red = parseInt(digits[2]);
	var green = parseInt(digits[3]);
	var blue = parseInt(digits[4]);

	var rgb = blue | (green << 8) | (red << 16);
	return digits[1] + '#' + rgb.toString(16);
};


$(document).ready(function(){
	var title_height = $(".title").outerHeight();
	$(".fake_title").css("height", title_height);
	$(".title").animate({"left": 0});

	$(".title").click(function(){
		$(this).animate({"left": "-9999px"});
	});
	
	$(".fake_title").click(function(){
		$(".title").animate({"left": 0});
	});

	var a;
	$(document).on("contextmenu", ".post", function(event){
		$(".contextmenu").remove();
		if($(this).hasClass("editable")){
			$(this).append('<ul class="contextmenu" style="top: ' + event.pageY + '; left: ' + event.pageX + '; "><li onclick="article(' + $(this).data("id") + '); $(\'.contextmenu\').remove(); ">Aç</li><li onclick="$(this).dblclick(); $(\'.contextmenu\').hide(1, function(){$(this).remove();}); ">Düzenle</li><li onclick="post_update(' + $(this).data("id") + ', \'same\', \'same\', \'front\'); ">En öne getir</li><li onclick="post_update(' + $(this).data("id") + ', \'same\', \'same\', \'back\'); ">En arkaya gönder</li><li onclick="$(this).parent().parent(\'.post\').fadeOut(150, function(){$(this).remove(); post_delete(' + $(this).data("id") + ');}); ">Sil</li></div>').children(".contextmenu").fadeIn(200);
		}else {
			$(this).append('<ul class="contextmenu" style="top: ' + event.pageY + '; left: ' + event.pageX + '; "><li onclick="article(' + $(this).data("id") + '); $(\'.contextmenu\').remove(); ">Aç</li></div>').children(".contextmenu").fadeIn(200);
		}
		return false;
	}).on('mouseup', function(){
		$('.draggable').removeClass('draggable');
		$('.sortable').removeClass('sortable');
	}).on("click", function(event){
		if(!($(event.target).is(".contextmenu") || $(event.target).is(".contextmenu *"))){
			$(".contextmenu").fadeOut(150);
		}

		if(!($(event.target).is(".post.editting") || $(event.target).is(".post.editting *") || $(event.target).is("ul.settings span.prompt input"))){
			if($(".post.editting").length > 0){
				var subtitle;
				if($(".post.editting").children(".subtitle").html() == "<br>"){
					subtitle = "";
				}else {
					subtitle = $(".post.editting").children(".subtitle").html();
				}

				if(subtitle == "" && $(".post.editting").children(".crs").children("div").text().trim() == ""){
					post_delete($(".post.editting").data("id"))
				}else {
					post_update($(".post.editting").data("id"), "same", "same", "same", "same", $(".post.editting").children(".crs").children("div").text().trim(), subtitle);
				}
				$(".post").removeClass("editting").children(".subtitle, h3").attr('contenteditable', 'false');
				$(".post ul.short").removeClass("editting").hide().children("li").show();
			}
		}

		if(!($(event.target).is(".post.editting .subtitle") || $(event.target).is(".post.editting .subtitle *") || $(event.target).is("ul.settings") || $(event.target).is("ul.settings *"))){
			$("ul.settings").hide();
		}
	}).on("contextmenu", function(event){
		if(!$(event.target).is(".post") && !$(event.target).is(".post *") && $(event.target).is(".posts")){
			$(".contextmenu").remove();
			$(".posts").append('<ul class="contextmenu" style="top: ' + event.pageY + '; left: ' + event.pageX + '; "><li><span><p>X</p></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></li></div>').children(".contextmenu").fadeIn(200);
			return false;
		}else {
			$(".contextmenu").fadeOut(150);
		}
	}).on("click", ".posts > ul.contextmenu li span", function(){
		var filter = $(this).css("background-color");
		if(filter == "rgb(255, 255, 255)"){
			$(".post").show();
		}else {
			$(".posts .post").each(function(){
				if($(this).css("border-bottom-color") != filter){
					$(this).hide();
				}else {
					$(this).show();
				}
			});
		}
	});

	var a;
	$(document).on("mouseover", ".post.editable", function(){
		$("ul.short:not(.editting)").hide();
		$(this).children("ul.short").show();
	}).on("mouseout", ".post.editable", function(){
		$("ul.short:not(.editting)").hide();
	}).on("dblclick", ".post.editable", function(){
		$(this).addClass("editting").children(".subtitle").attr('contenteditable', 'true');
		$(this).children(".crs").children("div").attr('contenteditable', 'true');
		$(this).children("ul.short").addClass("editting").children("li:eq(1)").hide();
	}).on('mousedown', '.post.editable', function(event){
		if($(event.target).is("ul.short") || $(event.target).is("ul.short *") || $(event.target).is(".post.editable.editting") || $(event.target).is(".post.editable.editting *")){
			return;
		}

		a = 0;
		$(this).addClass('sortable').parents().on('mousemove', function(event){
			var top = event.clientY;
			$('.sortable').offset({
				top: event.clientY - $('.sortable').outerHeight() / 2
			});
		}).on('mouseup', function(event){
			if(a == 0){
				var z_index;
				if(top > event.clientY){
					z_index = $('.posts .post:not(.sortable)').closestToOffset({left: event.clientX, top: event.clientY}).data("z") - 1;
					if(z_index < 0){z_index = 0;}
				}else {
					z_index = $('.posts .post:not(.sortable)').closestToOffset({left: event.clientX, top: event.clientY}).data("z") + 1;
				}
				if($(".sortable").data("z") != $('.posts .post:not(.sortable)').closestToOffset({left: event.clientX, top: event.clientY}).data("z")){
					post_update($(".sortable").data("id"), 'same', 'same', z_index);
				}
				$('.sortable').css("top", "auto");
				$(".sortable").removeClass('sortable');
				a = 1;
			}
			return;
		});

		event.preventDefault();
	}).on("click", function(event){
		if(($(".post.new").length > 0 && !$(event.target).is(".post.new") && !$(event.target).is(".post.new *")) && ($(".post.new .subtitle").html() != "" || $(".post.new h3").text().trim() != "")){
			add_post($(".post.new").offset().left, $(".post.new").offset().top, $(".post.new").css("width").replace("px", ""), $(".post.new h3").text().trim(), $(".post.new .subtitle").html(), colorToHex($(".post.new").css("border-bottom-color")).replace("#", ""));
		}else if(!$(event.target).is(".post.new") && !$(event.target).is(".post.new *")){
			$(".post.new").remove();
		}
	});

	$(document).on("click", "ul.short li", function(){
		if($(this).index() == 0){
			$(this).parent().parent('.post').fadeOut(150, function(){post_delete($(this).data("id"))});
		}else {
			$(".post").removeClass("editting").children(".subtitle, h3").attr('contenteditable', 'false');
			$(this).hide().parent("ul.short").addClass("editting");
			$(this).parent().parent('.post').addClass("editting").children(".subtitle").attr('contenteditable', 'true');
			$(this).parent().parent('.post').children(".crs").children("div").attr('contenteditable', 'true');
		}
	});

	$(document).on("mouseup", ".post.editting .subtitle", function(event){
		$("ul.settings").show().css({"top": event.clientY + 35, "left": event.clientX - 100}).children("li");
	});
	
	$.pExec = function(name, args){
		document.execCommand(name, false, args);
	}

	var link_toggle = 0;
	var img_toggle = 0;
	var color_toggle = 0;
	$(document).on("click", "ul.settings li", function(event){
		if($(event.target).is("span.prompt") || $(event.target).is("span.prompt *")){
			return false;
		}
		
		$("ul.settings span.prompt").hide();
		if($(this).data('obj')){
			link_toggle = 0;
			img_toggle = 0;
			color_toggle = 0;
			var obj = $(this).data('obj'), args;

			if(obj.prompt){
				args = prompt(obj.promptText, obj.promptDefault);
			}else if(obj.arg){
				args = obj.arg;
			}

			$.pExec(obj.name, args);
		}else {
			if($(this).index() == 9){
				img_toggle = 0;
				color_toggle = 0;
				if(link_toggle == 0){
					var links = [];
					$(this).children().children("span.prompt").show().children("button").click(function(){
						$(".post.editting .subtitle a").each(function(){
							links.push($(this).attr("href"));
						});

						var link = $(this).siblings("input").val().trim();
						var urlPattern = /(http|ftp|https):\/\/[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:\/~+#-]*[\w@?^=%&amp;\/~+#-])?/

						if(!urlPattern.test(link)){
							$(this).siblings("input").val("Geçerli bir link girin.");
						}else {
							if(jQuery.inArray(link, links) == "-1"){
								$(".post.editting .subtitle").append("<br><a href='" + link + "'>" + link + "</a>");
							}					
						}
					});

					link_toggle = 1;
				}else {
					$("ul.settings span.prompt").hide();
					link_toggle = 0;
				}
			}else if($(this).index() == 10){
				link_toggle = 0;
				color_toggle = 0;
				if(img_toggle == 0){
					$("ul.settings > span.prompt").show().click(function(event){
						if(!$(event.target).is("input")){
							return false;
						}
					}).children("input").on('change', function(){
						var oFReader = new FileReader();
						
						if(!$(this).get(0).files[0].type.match('image/jpeg') && !$(this).get(0).files[0].type.match('image/png') && !$(this).get(0).files[0].type.match('image/gif')){
							dialog("Hay aksi!", "Lütfen bir resim dosyasý yükle...");
						}else {
							oFReader.readAsDataURL($(this).get(0).files[0]);

							oFReader.onload = function(oFREvent){
								if($(".post.editting .subtitle img").length == 0){
									post_update($(".post.editting").data("id"), "same", "same", "same", "same", "same", "same", oFREvent.target.result);
									$("ul.settings").hide();
								}else {
									dialog("Hay aksi!", "Bir paylaþýmýn alt baþlýðýna en fazla bir resim ekleyebilirsiniz... Daha fazla resim eklemek için paylaþýmdan resmi sildikten sonra ekleme yapabilirsiniz.");
								}
							};
						}
					});
					img_toggle = 1;
				}else {
					$("ul.settings span.prompt").hide();
					img_toggle = 0;
				}
			}else if($(this).index() == 14){
				link_toggle = 0;
				img_toggle = 0;
				var id;
				if(color_toggle == 0){
					$(this).children().children("span.prompt").show().children("span").click(function(){
						if($(".post.editting").length > 0){
							id = $(".post.editting").data("id");
						}
						post_update(id, "same", "same", "same", "same", "same", "same", "same", colorToHex($(this).css("background-color")).replace("#", ""));
					});
					color_toggle = 1;
				}else {
					$("ul.settings span.prompt").hide();
					color_toggle = 0;
				}
			}
		}
		return false;
	});

	var path = location.pathname.substring(24).replace("/", "");
	if(path){
		article(path);
	}

	window.onpopstate = function(){
		if(location.pathname.substring(19, 23) == "post"){
			article(location.pathname.substring(24));
		}else {
			$("#article").fadeOut(100);
			document.title = window.title;
		}
	}
});