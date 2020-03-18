// $(document).on('turbolinks:load', function(){
  $(function(){


    //関数を定義================================================
    function show () {
      $('.not-active').css("visibility", "visible")
    }
    function none () {
      $('.not-active').css("visibility", "hidden")
    }
    //=========================================================

    
    
    //ライブハウスを選んだ時に料金フォームを表示======================
    $(document).on('change', '.active-js', function() {
      var val = $(this).val();
      if (val == 1) {
        show ()
      }
      else {
        none ()
      }
    });


    //バリデーション画面でurlが変わるのでそれに対応====================
    if (window.location.href.match("post")){
      var val = $('.active-js').val();
        if (val == 1) {
          show ()
        }
        else {
          none ()
        }
    }
  });
// });