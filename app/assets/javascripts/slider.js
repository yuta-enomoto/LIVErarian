$(document).on('turbolinks:load', function(){
  $('.slider').slick({
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 800,
    pauseOnHover: false,
    dots: true,
    prevArrow: '<img src="assets/left.jpg" class="left-arrow">',
    nextArrow: '<img src="assets/right.jpg" class="right-arrow">',
    appendArrows: $('.arrows'),
    slidesToShow: 4,
    slidesToScroll: 2
});
});
