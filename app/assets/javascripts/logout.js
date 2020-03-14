// $(document).on('turbolinks:load', function(){
  $(function(){


    //関数を定義========================================================
    function show() {
      $('.log-out').css("display", "block")
      $('.right-main').css("pointer-events", "none")
      $('.right-main').css("opacity", "0.5")
    }

    function hide() {
      $('.log-out').css("display", "none")
      $('.right-main').css("pointer-events", "auto")
      $('.right-main').css("opacity", "1")     
    }


    //ログアウトボタンを押した時確認ボタンを出す==============================
    $(".side-bar__lists__list__logout").on("click", function () {
      show()
    });


    //ログアウト確認ボタンを消す===========================================
    $(".log-out__bottom__right").on("click", function () {
      hide()
    });

    $(".hid").on("click", function () {
      hide()
    });

  });
// });