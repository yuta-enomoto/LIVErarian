$(document).on('turbolinks:load', function(){
  $(function(){


    //関数を定義========================================================
    function show() {
      $('.post-delete').css("display", "block")
      $('.show-live').css("pointer-events", "none")
      $('.background').css("opacity", "0.5")
      $('.background').css("z-index", "10")
      $('.background').css("display", "block")
    }

    function hide() {
      $('.post-delete').css("display", "none")
      $('.show-live').css("pointer-events", "auto")
      $('.background').css("opacity", "0") 
      $('.background').css("z-index", "0")
      $('.background').css("display", "none")    
    }


    //削除ボタンを押した時確認ボタンを出す==============================
    $(".delete-post").on("click", function () {
      show()
    });


    //削除確認ボタンを消す===========================================
    $(".post-delete__bottom__right").on("click", function () {
      hide()
    });

    $(".hid").on("click", function () {
      hide()
    });

    $(".side-bar__lists__list__logout").on("click", function () {
      hide()
    });

  });
});