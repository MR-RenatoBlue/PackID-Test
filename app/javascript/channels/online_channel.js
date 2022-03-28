import consumer from "./consumer";
$(document).on("turbolinks:load", function(){
  consumer.subscriptions.create("OnlineChannel", {
    connected() {
      console.log("ok")
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      $(document).on("turbolinks:load", function () {
        console.log(data)
      })
      console.log(data)
      let online = document.querySelector("#online-users")
      let el = online.querySelector(`[data-id='${data.id}']`)

      if (data.status == "online" && el == null) {
        online.insertAdjacentHTML('beforeend', data.html)
      } else if (data.status == "offline" && el != null) {
        el.remove()
      }
    }
  });
});