$(document).on('turbolinks:load', function(){
  $(function(){

    function buildHTML() {
      var html = `<div class="preview-box" id="preview-box">
                    <div class="img-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="upd-box"">
                      <span class="upd-btn",id ="upd-btn">画像を変更</span>
                    </div>
                  </div>`
      return html;
    }
    //画像を選択した時=====================================================
    $(document).on('change', '.img-form', function() {
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);

      reader.onload = function() {
        var image = this.result;
        $(`#preview-box img`).attr('src', `${image}`);

        if ($(`#preview-box`).length == 0) {
          var html = buildHTML();
          $('.rgst-artist__container__field__label').before(html);
          //画像を読み込ませる====================
          $(`#preview-box img`).attr('src', `${image}`);
          //ファイルフィールドを隠す=================
          $('.rgst-artist__container__field__label').hide();
          $('.rgst-artist__container__field__select').hide();
        }
      }
    });

    //画像を差し替える時====================================================
    $(document).on('click', '.upd-btn', function() {
      $(`input#img`).trigger('click');
    })
    $(document).on('click', '.img-box', function() {
      $(`input#img`).trigger('click');
    })
  });
});