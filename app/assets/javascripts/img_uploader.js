// Todo send an ajax request to save an update the user profile image
$(document).ready(function(){
	var $imgFile = $('#img-uploader'); 
	var reqUrl = '/users/' + $imgFile.attr('data-parent');
	$imgFile.on('change', function(){
		if ($imgFile.val() != "") {
			// $.ajax({
			// 	url: reqUrl,
			// 	data: 
			// });
			console.log($imgFile.val());
		}
	});
});


