$(function() {
  function buildHTML(message) {
    var html = `<div class="content">
                  <div class="message-user">
                    <p>${message.user_name}</p>
                  </div>
                  <div class="message">
                    <p class="m-green">${message.message}</p>
                  </div>
                </div>`
    return html;
  }

  function scroll() {
    $('.message-main').animate({
      scrollTop: $('.message-main')[0].scrollHeight
    }, 'fast');
  }


  $('#new_message').on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      if (!data.message) {
        $(".submit-btn").prop('disabled', false);
      } else {
        var html = buildHTML(data);
        $('.message-main').append(html)
        $('#message_js').val('')
        $('form')[0].reset();
        scroll();
      }
    })
    .fail(function() {
      alert('error');
    })
    .always(() => {
      $(".submit-btn").removeAttr("disabled");
    });
  });

    //   $(function() {
    //   setInterval(update, 4000);
    // });

    function update() {
    $.ajax({
      url: location.href,
      type: 'GET',
      dataType: 'json'
    })

    .done(function(messages) {
      $('.message-main').empty();
      messages.forEach(function(message) {
        var input = buildHTML(message);
        $('.message-main').append(input);
      })
    });
  }
});
