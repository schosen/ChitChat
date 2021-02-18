$(function () {
  $("#new_room_message").on("ajax:success", function (a, b, c) {
    $(this).find('input[type="text"]').val("");
  });
});
//  clears message field after sending a new message