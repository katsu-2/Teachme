$(function () {
  document.addEventListener("turbolinks:load", function(){
    $('.input-title').on('keyup', function (e) {
      let tCountNum = String($(this).val().length);
      if (tCountNum >= 31) {
        $('#t-count').css('color', 'red');
        $('#t-count').text('30文字以下で入力して下さい');
      } else {
        $('#t-count').css('color', 'black');
        $('#t-count').text(tCountNum + '文字');
      };
    });

    $('.input-content').on('keyup', function (e) {
      let cCountNum = String($(this).val().length);
      if (cCountNum >= 1001) {
        $('#c-count').css('color', 'red');
        $('#c-count').text('1000文字以下で入力して下さい');
      } else {
        $('#c-count').css('color', 'black');
        $('#c-count').text(cCountNum + '文字');
      };
    });
  });
});
