App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    console.log("Message received");
    console.log(data['message']);
    return $('#messages_list').append(data['message']);
  },
  speak: function(message) {
    console.log("Message sent");
    console.log(message);
    return this.perform('speak', {
      message: message
    });
  }
});
$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {
    App.room.speak(event.target.value);
    event.target.value = ""; 
    return event.preventDefault();
  }
});
