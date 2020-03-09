$(document).on('turbolinks:load', function(){
  $(function(){

    if (window.location.href.match(/\/users/)){
      $('.show-1').css("display", "block")
    }

    if (window.location.href.match(/\/users\/\d+\/edit/)){
      $('.show-1').css("display", "none")
      $('.show-2').css("display", "block")
    }

    if (window.location.href.match(/\/artists\/\d+\/edit/)){
      $('.show-5').css("display", "block")
    }

  });
});