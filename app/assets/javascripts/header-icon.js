$(document).on('turbolinks:load', function(){
  $(function(){
    //マウスが乗った時色を変更==========================
    $(".header-icon").on("mouseover", function () {
      $('.header-profile').css("color", "#1bfd1b")
    });

    $(".header-profile").on("mouseover", function () {
      $(this).css("color", "#1bfd1b")
    });

    //マウスが外れた時色を変更==========================
    $(".header-icon").on("mouseout", function () {
      $('.header-profile').css("color", "#fff")
    });

    $(".header-profile").on("mouseout", function () {
      $(this).css("color", "#fff")
    });
  });
});