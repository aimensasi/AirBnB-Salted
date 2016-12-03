$(document).ready(function(){
	var dataJson = {};

	var $resultPanel = $('#instance-panel');
	var $searchBox = $('#search-box');
	var $btnFilter = $('.btn-filter');
	var $filterRow = $('.filter-row');
	var $btnCancel = $('.btn-cancel');
	var $resultRow = $('.result-row');
	var $btnApply = $('.btn-apply');

	// More Filter Elements
	var $wifi = $('input[name="wifi"]');


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
		hideFilterPanel();
	});

	//On canel button clicked hide and disable any filter
	$btnCancel.on('click', function(){
		hideFilterPanel();
	});

	//Handling Dates Filter Check In Check out and guests no
	$('input[type="date"], #guests, .room_check').on('change', function(){
		var $changed = $(this);
		var attrName = $changed.attr('name');
		dataJson[attrName] = $changed.val();

		if (attrName == 'check_in_date' || attrName == 'check_out_date') {
			handleDatesFilter($changed, attrName);
		}else if (attrName == 'guest_no') {
			if ($changed.val() == 'Guests') { return }
			dataJson[attrName] = $changed.val();
		}else if (attrName == 'room_type') {
			var attrValue = $changed.attr('data-value');	
			dataJson[attrName] = attrValue;
		}
		sendAjaxRequest(dataJson);
	});



	function handleDatesFilter($changed, attrName){
		if (attrName == 'check_in_date') {
				if ($changed.val().length == 0) {
					$('input[name="check_out_date"]').val('').prop('disabled', true);	
				}else{
					var date = new Date($changed.val());
					var htmlDate = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + (date.getDate() + 1) ).slice(-2);
					var $check_out_date = $('input[name="check_out_date"]');
					$check_out_date.val(htmlDate).prop('disabled', false);
					dataJson[$check_out_date.attr('name')] = $check_out_date.val();					
				}
		}else if (attrName == 'check_out_date') {
				if ($changed.val().length == 0) {
					var $check_in_date = $('input[name="check_in_date"]');
					$check_in_date.val('');
					$changed.val('');
					dataJson[attrName] = null;
					dataJson[$check_in_date.attr('name')] = null;
				}else{
					dataJson[attrName] = $changed.val();	
				}
		}
	}


	$btnApply.on('click', function(){
		hideFilterPanel();
		var $bathroomsNum = $('#bathrooms-number');
		var $bedsNum = $('#beds-number');

		if ($bathroomsNum.val() != 'Bathrooms Number') {
			dataJson[$bathroomsNum.attr('name')] = $bathroomsNum.val();
		}
		if ($bedsNum.val() != 'Beds Number') {
			dataJson[$bedsNum.attr('name')] = $bedsNum.val();
		}
		if ($('input[name="wifi"]:checked').length > 0) {
			dataJson['wifi'] = 1;
		}else{
			dataJson['wifi'] = 0;
		}
		if ($('input[name="tv"]:checked').length > 0) {
			dataJson['tv'] = 1;
		}else{
			dataJson['tv'] = 0;
		}
		if ($('input[name="Kitchen"]:checked').length > 0) {
			dataJson['Kitchen'] = 1;
		}else{
			dataJson['Kitchen'] = 0;
		}
		if ($('input[name="air-con"]:checked').length > 0) {
			dataJson['air-con'] = 1;
		}else{
			dataJson['air-con'] = 0;
		}
		if ($('input[name="pool"]:checked').length > 0) {
			dataJson['pool'] = 1;
		}else{
			dataJson['pool'] = 0;
		}
		if ($('input[name="smoking"]:checked').length > 0) {
			dataJson['smoking'] = 1;
		}else{
			dataJson['smoking'] = 0;
		}

		sendAjaxRequest(dataJson);
	});

//To Make An Ajax Call
	function sendAjaxRequest(data){
		console.log(data);
		$.ajax({
			url: '/search_enigne',
			type: 'POST',
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function(data){
				$('#reseult').html(data);
				console.log(data);
			},
			error: function(err){
				console.log(err);
			}
		});
	}//Ajax function

	function hideFilterPanel(){
		if ($filterRow.hasClass('hidden')) {
			$resultRow.addClass('hidden');
			$filterRow.removeClass('hidden');
		}else{
			$filterRow.addClass('hidden');
			$resultRow.removeClass('hidden');
		}
	}

});//On Document Ready Function
