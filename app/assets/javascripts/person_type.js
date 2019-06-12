$(function () {
  document.addEventListener("turbolinks:load", function(){
    var url = window.location.pathname;
    $('.type-btn-wrap li a[href="' + url + '"]').addClass('current');
    $('a[href="' + url + '"]').parent('.side-each ').addClass('current');
  });
})
