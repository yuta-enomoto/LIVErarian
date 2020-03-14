$(document).on('turbolinks:load', function(){
  $(function(){
    $(".slider").not('.slick-initialized').slick({
      autoplay: true,
      autoplaySpeed: 3500,
      speed: 850,
      pauseOnHover: false,
      prevArrow: '<i class="fas fa-chevron-left left-arrow"></i>',
      nextArrow: '<i class="fas fa-chevron-right right-arrow"></i>',
      appendArrows: $('.arrows'),
      slidesToShow: 4,
      slidesToScroll: 2
    });
  });
});
