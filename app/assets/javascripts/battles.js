$(document).ready(function(){
	$('.button_to_hide').click( function () {
		$(".button_to_hide").hide(100)
		$(".battles_show_sprite_left").animate({
			bottom: "+=8vw",
		}, 500);
		$(".battles_show_sprite_left").animate({
			bottom: "-=8vw",
		}, 500);
		$(".battles_show_sprite_left").delay(100).animate({
			bottom: "+=8vw",
		}, 500);
		$(".battles_show_sprite_left").animate({
			bottom: "-=8vw",
		}, 500);
		$(".battles_show_sprite_left").delay(100).animate({
			bottom: "+=8vw",
		}, 500);
		$(".battles_show_sprite_left").animate({
			bottom: "-=8vw",
		}, 500);
		$(".battles_show_sprite_left").animate({
			bottom: "+=6vw",
			left: "+=8.2vw",
		}, 500);
		$(".battles_show_sprite_left").fadeOut(50);
		// BEGIN RIGHT --------------------------------
		$(".battles_show_sprite_right").animate({
			bottom: "+=8vw",
		}, 500);
		$(".battles_show_sprite_right").animate({
			bottom: "-=8vw",
		}, 500);
		$(".battles_show_sprite_right").delay(100).animate({
			bottom: "+=8vw",
		}, 500);
		$(".battles_show_sprite_right").animate({
			bottom: "-=8vw",
		}, 500);
		$(".battles_show_sprite_right").delay(100).animate({
			bottom: "+=8vw",
		}, 500);
		$(".battles_show_sprite_right").animate({
			bottom: "-=8vw",
		}, 500);
		$(".battles_show_sprite_right").animate({
			bottom: "+=6vw",
			right: "+=8.2vw",
		}, 500);
		$(".battles_show_sprite_right").fadeOut(50);
		$(".battles_show_fight_cloud").delay(3500).fadeIn(80);
	});
});