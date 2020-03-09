$(document).on('turbolinks:load', function(){
  $(function(){

    //関数を定義==============================================
    function show_5() {
      $('.show-5').css("display", "block")
    }
    //======================================================


    if (window.location.href.match(/\/users/)){
      $('.show-1').css("display", "block")
    }

    if (window.location.href.match(/\/users\/\d+\/edit/)){
      $('.show-1').css("display", "none")
      $('.show-2').css("display", "block")
    }

    if (window.location.href.match(/\/artists\/\d+\/edit/)){
      show_5()
    }

    if (window.location.href.match(/\/artists\/notyet/)){
      show_5()
    }

    if (window.location.href.match(/\/artists\/new/)){
      show_5()
    }

  });
});