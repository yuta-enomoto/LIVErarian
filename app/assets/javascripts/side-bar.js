$(document).on('turbolinks:load', function(){
  $(function(){

    //関数を定義================================================
    function show_1() {
      $('.show-1').css("display", "block")
    }

    function show_2() {
      $('.show-1').css("display", "none")
      $('.show-2').css("display", "block")
    }

    function show_5() {
      $('.show-5').css("display", "block")
    }

    function show_6() {
      $('.show-6').css("display", "block")
    }

    function show_7() {
      $('.show-6').css("display", "none")
      $('.show-7').css("display", "block")
    }
    //========================================================

    if (window.location.href.match(/\/users/)){
      show_1()
    }

    //=========================================================

    if (window.location.href.match(/\/users\/\d+\/edit/)){
      show_2()
    }

    if (window.location.href.match(/\/users\/\d+/)){
      show_2()
    }

    //=========================================================
    if (window.location.href.match(/\/artists\/\d+\/edit/)){
      show_5()
    }

    if (window.location.href.match(/\/artists\/\d+/)){
      show_5()
    }

    if (window.location.href.match(/\/artists\/notyet/)){
      show_5()
    }

    if (window.location.href.match(/\/artists\/new/)){
      show_5()
    }

    //=========================================================
    if (window.location.href.match(/\/posts/)){
      show_6()
    }

    if (window.location.href.match(/\/posts\/new/)){
      show_6()
    }

    if (window.location.href.match(/\/posts\/notyet/)){
      show_6()
    }

    //=========================================================
    if (window.location.href.match(/\/live_yet/)){
      show_7()
    }
  });
});