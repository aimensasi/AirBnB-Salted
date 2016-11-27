$(document).ready(function(){


	var $imageGallery = $('#img-gallery');

	$imageGallery.owlCarousel({
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true
  });

   // Custom Navigation Events
  $(".next").click(function(){
    $imageGallery.trigger('owl.next');
  })
  $(".prev").click(function(){
    $imageGallery.trigger('owl.prev');
  })
});