$(document).ready(function(){
	var dataJson = [];

	var $resultPanel = $('#instance-panel');
	var $searchBox = $('#search-box');
	var $btnFilter = $('.btn-filter');
	var $filterRow = $('.filter-row');
	var $btnCancel = $('.btn-cancel');
	var $resultRow = $('.result-row');


	//On Search Bar input show and hide the reseult panel
	$searchBox.on('input', function(e){
		if ($.trim($searchBox.val()).length == 0) {
			$resultPanel.css({'opacity': '0', 'top': '-700px'});	
		}else{
			$resultPanel.css({'opacity': '1', 'top': '74px'});	
		}
	});
	//On filter button clicked show and hide the filter options
	$btnFilter.on('click', function(){
		if ($filterRow.hasClass('hidden')) {
			$resultRow.addClass('hidden');
			$filterRow.removeClass('hidden');
		}else{
			$filterRow.addClass('hidden');
			$resultRow.removeClass('hidden');
		}
	});

	//On canel button clicked hide and disable any filter
	$btnCancel.on('click', function(){
		$filterRow.addClass('hidden');
		$resultRow.removeClass('hidden');
	});

	$('input[type="date"], #guests').on('change', function(){
		var $changed = $(this);
		var attrName = $changed.attr('name');
		dataJson.push({'filter': attrName, 'value': $changed.val()})
		// if (attrName == 'guest_no') {
		// 	console.log($changed.val());
		// }else if (attrName == 'check_in_date'){
		// 	console.log($changed.val());
		// }else if (attrName == 'check_out_date'){
		// 	console.log($changed.val());
		// }
		sendAjaxRequest(dataJson);
	});

	function sendAjaxRequest(data){
		console.log(data);
		$.ajax({
			url: '/search_enigne',
			type: 'POST',
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function(data){
				console.log(data);
			},
			error: function(err){
				console.log(err);
			}
		});
	}//Ajax function

});
