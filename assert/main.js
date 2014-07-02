(function($) {
	if(!document.defaultView || !document.defaultView.getComputedStyle){ // IE6-IE8
		var oldCurCSS = $.curCSS;
		$.curCSS = function(elem, name, force){
			if(name === 'background-position'){
				name = 'backgroundPosition';
			}
			if(name !== 'backgroundPosition' || !elem.currentStyle || elem.currentStyle[ name ]){
				return oldCurCSS.apply(this, arguments);
			}
			var style = elem.style;
			if ( !force && style && style[ name ] ){
				return style[ name ];
			}
			return oldCurCSS(elem, 'backgroundPositionX', force) +' '+ oldCurCSS(elem, 'backgroundPositionY', force);
		};
	}
	
	var oldAnim = $.fn.animate;
	$.fn.animate = function(prop){
		if('background-position' in prop){
			prop.backgroundPosition = prop['background-position'];
			delete prop['background-position'];
		}
		if('backgroundPosition' in prop){
			prop.backgroundPosition = '('+ prop.backgroundPosition;
		}
		return oldAnim.apply(this, arguments);
	};
	
	function toArray(strg){
		strg = strg.replace(/left|top/g,'0px');
		strg = strg.replace(/right|bottom/g,'100%');
		strg = strg.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
		var res = strg.match(/(-?[0-9\.]+)(px|\%|em|pt)\s(-?[0-9\.]+)(px|\%|em|pt)/);
		return [parseFloat(res[1],10),res[2],parseFloat(res[3],10),res[4]];
	}
	
	$.fx.step. backgroundPosition = function(fx) {
		if (!fx.bgPosReady) {
			var start = $.curCSS(fx.elem,'backgroundPosition');
			if(!start){//FF2 no inline-style fallback
				start = '0px 0px';
			}
			
			start = toArray(start);
			fx.start = [start[0],start[2]];
			var end = toArray(fx.end);
			fx.end = [end[0],end[2]];
			
			fx.unit = [end[1],end[3]];
			fx.bgPosReady = true;
		}
		//return;
		var nowPosX = [];
		nowPosX[0] = ((fx.end[0] - fx.start[0]) * fx.pos) + fx.start[0] + fx.unit[0];
		nowPosX[1] = ((fx.end[1] - fx.start[1]) * fx.pos) + fx.start[1] + fx.unit[1];           
		fx.elem.style.backgroundPosition = nowPosX[0]+' '+nowPosX[1];
	};
})(jQuery);

$(function() {
	var navH = $("#nav").offset().top;
	$(window).scroll(function(){
		var scroH = $(this).scrollTop();
		if(scroH>=navH){
			$('#nav').addClass('float');
		}else if(scroH<navH){
			$('#nav').removeClass('float');
		}
	});
	
	$('#contact-panel a').tipsy({
		gravity : 's',
		fade : true
	});
	
	$('#subsites div.snap').hover(
		function(){
			try {
				var current = $(this).css('background-position');
				var pos = current.split(' ');
				var x = pos[0];
			}
			catch(e) {
				x = this.currentStyle.backgroundPositionX;
			}
			$(this).stop(true,true).animate({'background-position': x + ' 0'});
			$(this).find('h3').stop(true,true).animate({'margin-left' : 0});
			$(this).find('p').stop(true,true).animate({'margin-top' : 0});
			$(this).find('img').stop(true,true).animate({'left' : '243px'});
		},
		function(){
			try {
				var current = $(this).css('background-position');
				var pos = current.split(' ');
				var x = pos[0];
			}
			catch(e) {
				x = this.currentStyle.backgroundPositionX;
			}
			$(this).stop(true,true).animate({'background-position':x + ' -245px'});
			$(this).find('h3').stop(true,true).animate({'margin-left' : '462px'});
			$(this).find('p').stop(true,true).animate({'margin-top' : '245px'});
			$(this).find('img').stop(true,true).animate({'left' : '-500px'});
		}
	);
	
	$('#contact-panel i').hover(
		function(){
			try {
				var current = $(this).css('background-position');
				var pos = current.split(' ');
				var x = pos[0];
			}
			catch(e) {
				x = this.currentStyle.backgroundPositionX;
			}
			$(this).stop(true,true).animate({'background-position': x + ' 0'});
		},
		function(){
			try {
				var current = $(this).css('background-position');
				var pos = current.split(' ');
				var x = pos[0];
			}
			catch(e) {
				x = this.currentStyle.backgroundPositionX;
			}
			$(this).stop(true,true).animate({'background-position':x + ' -16px'});
		}
	);
	
	$('#nav a').hover(function() {
		$('#nav a').stop(true, true).not(this).css({
			backgroundPosition : '0px 60px'
		});
		$(this).animate({
			backgroundPosition : '0px 20px'
		}, 0).animate({
			backgroundPosition : '0px 0px'
		}, 120, 'swing');
	}, function() {
		$('#nav a').stop(true, true).not(this).css({
			backgroundPosition : '0px 60px'
		});
		$(this).animate({
			backgroundPosition : '0px 20px'
		}, 120, 'swing').animate({
			backgroundPosition : '0px 60px'
		}, 0);
	});
	
	var articleRowHeight = 0;
	$('article.subpost').each(function(i, el){
		var height = parseInt($(el).css('height'));
		if (height > articleRowHeight) {
			articleRowHeight = height;
		}
		if ( (i + 1) % 3 == 0) {
			$('article.subpost').slice(i - 2, i + 1).css('height', articleRowHeight + 'px');
			articleRowHeight = 0;
		}
	});
	
	if ($('div.gallery').length == 1) {
		//var html = [];
		$('dt.gallery-icon a').each(function(i, el) {
			this.rel = 'fancybox-item';
		});
		//$('div.gallery').remove();
		//$('article>div.entry-content').append('<div id="gallery">' + html.join('').replace(/<a /g, '<a class="gallery-item" rel="fancyitem" ') + '</div>');
		$('div.gallery a').fancybox({
			closeBtn : true,
			helpers : {
				title : { type : 'inside' },
				buttons : {}
			}
		});
	}
});