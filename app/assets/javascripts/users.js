$(document).ready(function(){	
	$(".delete-wizard").on("ajax:complete", function(e){
		$(e.currentTarget).parent().hide()
	});

	$('#id_link').click( function () {
		$(".sign_up_box").fadeOut(200)
		$(".sign_in_box").delay(300).fadeIn(800)
	});
})