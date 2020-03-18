// $(document).on('turbolinks:load', function(){
  $(function(){

    //関数を定義================================================
    function show_1() {
      $('.show-1').css("display", "block")
    }

    function show_2() {
      $('.show-1').css("display", "none")
      $('.show-2').css("display", "block")
    }

    function show_3() {
      $('.show-3').css("display", "block")
      $('.show-5').css("display", "none")
    }

    function show_4() {
      $('.show-4').css("display", "block")
      $('.show-7').css("display", "none")
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

    function show_8() {
      $('.show-6').css("display", "none")
      $('.show-7').css("display", "none")
      $('.show-8').css("display", "block")
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

    if (window.location.href.match(/artists\/\d+/)){
      show_5()
    }

    if (window.location.href.match(/\/artists\/notyet/)){
      show_5()
    }

    if (window.location.href.match(/\/artists\/new/)){
      show_5()
    }

    if (window.location.href.match(/\/artists/)){
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

    if (window.location.href.match(/\/not_yet/)){
      show_7()
    }

    if (window.location.href.match(/\/posts\/\d+/)){
      show_7()
    }

    //=========================================================
    if (window.location.href.match(/\/posts\/done/)){
      show_8()
    }
    if (window.location.href.match(/\/posts\/yet/)){
      show_8()
    }

    if (window.location.href.match(/\/posts\/\d+\/done_show/)){
      show_8()      
    }

     //=========================================================
     if (window.location.href.match(/\/artists\/\d+\/favorites/)){
      show_3()
    }

    //=========================================================
    if (window.location.href.match(/\/posts\/\d+\/likes/)){
    show_4()
    }

    
  });