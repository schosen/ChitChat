$(document).ready(function () {
  imageHandler();
  // videoHandler();
});


// JS to listen to the input fields. Typing Ctrl+V (specifically listening for the V as key code 86) will trigger our preview action. Typing backspace (listening for backspace as key code 8) will trigger our clear action. We’re using the keyup event to suggest that we’ll trigger our preview just as the user has lifted their finger off the backspace or paste action keys.

function imageHandler() {


  $("#room_message_message").on('keyup', function(event){
    if (event.keyCode == 86) {
      clearMediaPreview();
      //to detect whether input in textfield has image link
      var userMessage = $("#room_message_message").val();
      var regex = /(https?:\/\/.*\.(?:png|jpg|jpeg|gif))/i;
      var imageUrl = userMessage.match(regex);
      var text = userMessage.replace(imageUrl, "");

      showImagePreview(imageUrl[0]);
    }
    if (event.keyCode == 8) {
      if ($("#room_message_message").val() == "") {
        clearMediaPreview();
      }
    }
  })
}

// function videoHandler() {
//   $("#room_message_message").on("keyup", function (event) {
//     if (event.keyCode == 86) {
//       clearMediaPreview();
//       var videoUrl = $("#room_message_message").val();
//       var videoId = parseVideoUrl(videoUrl);
//       showVideoPreview(videoId);
//       hideImageUrl();
//     }
//     if (event.keyCode == 8) {
//       if ($("#room_message_message").val() == "") {
//         clearMediaPreview();
//         showImageUrl();
//       }
//     }
//   });
// }

// Clearing the media object
function clearMediaPreview() {
  $(".media-preview").html("");
}


// Rendering the image media object
function showImagePreview(imageUrl) {
  heading = "<h5> Media Preview </h5>"
  $(".media-preview").html( heading +"<img src=" + imageUrl + ">");
}

// Rendering the video media object
function showVideoPreview(videoId) {
  $(".media-preview").html("<iframe width=’560' height=’315' src='https://www.youtube.com/embed/'" + videoId + "?autoplay=1&enablejsapi=1' frameborder=’0' allowfullscreen></iframe>")
}