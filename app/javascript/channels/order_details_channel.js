import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

  $(document).ready(function () {

    const orderID = $("#order-id")
    console.log(orderID);

    if (orderID.length !== 0) {

      const order_id = orderID.attr("data-order-id");
      consumer.orders = consumer.subscriptions.create({ channel: 'OrderDetailsChannel', order_id: order_id }, {

        connected: function () {
          // Called when the subscription is ready for use on the server
          console.log("Connected to order channel " + order_id);
        },

        received: function (data) {

          console.log(data);

          $("#orderTable").removeClass('hidden')
          if (data.action == "add")
            return $('#orderTable').append(this.renderOrder(data));

          else if (data.action == "edit")
            return $(`#${data.id}`).replaceWith(this.renderOrder(data));

          else if (data.action == "delete")
            return $(`#${data.id}`).remove();
        },

        disconnected: function () {
          // Called when the subscription has been terminated by the server
          console.log("DisConnected to order channel " + order_id);
        },

        renderOrder: function (data) {
          return `<tr id=${data.id}>` + "<td>" + "<td>" + data.name + "</td>"
            + "<td>" + data.amount + "</td>"
            + "<td>" + data.price + "</td>"
            + "<td>" + data.comment + "</td>" + "<td>" + "</td>" + "</tr>"
        },
      });
    }
  })

});
