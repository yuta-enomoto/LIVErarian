$(document).on('turbolinks:load', function(){
  $(function(){

    function buildHTML() {
      var html = `<div class="preview-box" id="preview-box">
                    <div class="img-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="upd-box", id ="upd-btn">
                      <span class="upd-btn">画像を変更</span>
                    </div>
                  </div>`
      return html;
    }
    
    $(document).on('change', '.img-form', function() {
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);

      reader.onload = function() {
        var image = this.result;
        var html = buildHTML();
        $('.rgst-artist__container__field__label').before(html);
        //画像を読み込ませる==========================================
        $(`#preview-box img`).attr('src', `${image}`);
        //ファイルフィールドを隠す=====================================
        $('.rgst-artist__container__field__label').hide();
        $('.rgst-artist__container__field__select').hide();

      }
    });
  });
});