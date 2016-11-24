$(document).ready(function(){
	var $owl = $('#listing-row');

  $owl.owlCarousel({
  	
  	items : 3,
    lazyLoad : true
  });

  $(".next").click(function(){
     $owl.trigger('owl.next');
   })
   $(".prev").click(function(){
     $owl.trigger('owl.prev');
   })
});