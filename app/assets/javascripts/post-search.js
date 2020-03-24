$(function(){


  //関数を定義=======================================================================
  function click() {
    $(`button#header-search`).trigger('click');
  }


  //クリックしたら実行=================================================================
  $(document).on('click', '.header__box__container__lists__list__find', function() {
    click()
  })
  $(document).on('click', '.post-search', function() {
    click()
  })


});