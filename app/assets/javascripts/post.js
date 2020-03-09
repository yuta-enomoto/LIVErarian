$(document).on('turbolinks:load', function(){
  $(function(){

    $(document).on('change', '.active-js', function() {

      var val = $(this).val();
      if (val == 1) {
        $('.not-active').css("display", "block")
      }

      else {
        $('.not-active').css("display", "none")
      }
      
    });
  });
});