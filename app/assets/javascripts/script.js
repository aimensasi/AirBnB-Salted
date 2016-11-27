$(document).ready(function(){
	var $listingGallery = $('#listing-row');
  var $imageGallery = $('#img-gallery');

  // Showing Top Listings in lazymode
  $listingGallery.owlCarousel({
  	
  	items : 3,
    lazyLoad : true
  });

  $(".next").click(function(){
   $listingGallery.trigger('owl.next');
 });
 $(".prev").click(function(){
   $listingGallery.trigger('owl.prev');
 });

  // Showing Image Gallery of a listing
  $imageGallery.owlCarousel({
       slideSpeed : 300,
       paginationSpeed : 400,
       singleItem:true
   });

   $(".next").click(function(){
     $imageGallery.trigger('owl.next');
   });
   $(".prev").click(function(){
     $imageGallery.trigger('owl.prev');
   });
     
});