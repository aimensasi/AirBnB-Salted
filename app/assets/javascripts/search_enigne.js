$(document).ready(function(){
	var $resultPanel = $('#instance-panel');
	var $searchBox = $('#search-box');
	$searchBox.on('input', function(e){
		if ($.trim($searchBox.val()).length == 0) {
			$resultPanel.css({'opacity': '0', 'top': '-700px'});	
		}else{
			$resultPanel.css({'opacity': '1', 'top': '74px'});	
		}
	});	
});
