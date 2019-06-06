$(function() {
  document.addEventListener("turbolinks:load", function() {
    $('#int').click(function(){
      $('#my-int').slideToggle();
    });
  });
});
