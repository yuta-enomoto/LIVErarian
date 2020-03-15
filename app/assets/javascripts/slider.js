// $(document).on('turbolinks:load', function(){
  $(function(){
    $(".slider").not('.slick-initialized').slick({
      autoplay: true,
      autoplaySpeed: 5000,
      speed: 850,
      pauseOnHover: false,
      prevArrow: '<i class="fas fa-chevron-left left-arrow"></i>',
      nextArrow: '<i class="fas fa-chevron-right right-arrow"></i>',
      appendArrows: $('.arrows'),
      slidesToShow: 4,
      slidesToScroll: 2,
    });

    $(".home__container__contents-2").not('.slick-initialized').slick({
      autoplay: true,
      autoplaySpeed: 5000,
      speed: 850,
      pauseOnHover: false,
      prevArrow: '<i class="fas fa-chevron-left left-arrow-2"></i>',
      nextArrow: '<i class="fas fa-chevron-right right-arrow-2"></i>',
      appendArrows: $('.arrows-2'),
      slidesToShow: 3,
      slidesToScroll: 1
    });

  $(".home__container__contents-3").not('.slick-initialized').slick({
    autoplay: true,
    autoplaySpeed: 5000,
    speed: 850,
    pauseOnHover: false,
    prevArrow: '<i class="fas fa-chevron-left left-arrow-3"></i>',
    nextArrow: '<i class="fas fa-chevron-right right-arrow-3"></i>',
    appendArrows: $('.arrows-3'),
    slidesToShow: 3,
    slidesToScroll: 1
  });
});
// });
