$(function () {
  $('[data-channel-subscribe="room"]').each(function (index, element) {
    var $element = $(element),
      room_id = $element.data("room-id");
    messageTemplate = $('[data-role="message-template"]');

    // scroll functionality for message/chat box
    $element.animate({ scrollTop: $element.prop("scrollHeight") }, 1000);

    // Create a subscription to the “RoomChannel” passing the element’s room-id data attribute as a parameter with name room (from room_channel.rb RoomChannel: Room.find params[:room] ) 
    App.cable.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id,
      },

      //   When data is received, clone the html template snippet and alter its contents based on the incoming object attributes and Append the newly generated content to the chat div
      {
        received: function (data) {
          var content = messageTemplate.children().clone(true, true);
          var userMessage = data.message;
          var regex = /(https?:\/\/.*\.(?:png|jpg|jpeg|gif))/i;
          var text = userMessage;

          // find if message contains image url and put that in a new variable
          if (userMessage.match(regex)) {
            var imageUrl = userMessage.match(regex);
            // new variable with text that doesnt include image url
            var text = userMessage.replace(imageUrl[0], " ");
            content.find('[data-role="message-media-img"]').attr("src", imageUrl[0]);
          } else {
            content.find('[data-role="message-media-img"]').remove();
          }
          

          content.find('[data-role="user-avatar"]').attr("src", data.avatar_url);
          content.find('[data-role="message-text"]').text(text);
          content.find('[data-role="message-date"]').text(data.updated_at);
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight") }, 1000);
        },
      }
    );
  });
});

