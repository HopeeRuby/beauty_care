
//= require jquery3
//= require popper
//= require bootstrap

$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 15000); // Thời gian đợi trước khi ẩn thông báo (đơn vị: mili giây)
});
