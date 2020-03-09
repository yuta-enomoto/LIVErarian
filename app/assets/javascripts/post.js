$(document).on('turbolinks:load', function(){
  $(function(){


    //関数を定義================================================
    function show () {
      $('.not-active').css("display", "block")
    }
    function none () {
      $('.not-active').css("display", "none")
    }
    //=========================================================

    
    $(document).on('change', '.active-js', function() {
      var val = $(this).val();
      if (val == 1) {
        show ()
      }
      else {
        none ()
      }
    });


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
});