
$(document).ready(function(){	
	$(".delete-wizard").on("ajax:complete", function(e){
		$(e.currentTarget).parent().hide()
	});
})