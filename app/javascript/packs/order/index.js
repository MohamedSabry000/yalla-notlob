// Check Friends Rows
function checkrows() {
  currentFriends = [];
  $(".orderfriendtable > tbody  > tr").each(function (index, tr) {
    currentFriends.push(tr.id);
  });
  uniqueItems = [...new Set(currentFriends)];

  nofriends = uniqueItems.length;
  console.log("Number of Friends on The List is: "+nofriends)
  $("#numberoffriends").val(nofriends);
  return uniqueItems;
}

//check if current id exist in all ids array
function checkForMatch(array, valueToMatch) {
  for (var i = 0; i < array.length; i++) {
    if (array[i] == valueToMatch) return true;
  }
  return false;
}

$(document).ready(function () {
  $("#fiendsearch_form").on("click", function (e) {
    e.preventDefault();
    var frinedemail = document.getElementById("fiendsearch").value;

    var content = "";

    $.ajax({
      type: "GET",
      url: "addFriendtoOrder",
      dataType: "json",

      data: { friend_email: frinedemail },
      success: function (res) {
        $(".friendalert").css("display", "none");

        friendsids = checkrows();
        console.log("this is the friendsids", friendsids);
        //check if current row id already exist
        //res[1] -> user object , res[0] -> friend id
        result = res[1];
        var imageUrl;
        if (!checkForMatch(friendsids, res[0])) {
          $(".friendexistalert").css("display", "none");

          //mfrod hna y7sl error :) res[0] id just an id
          imageUrl = result.image;

{/* <td class="card-header">

<img src="<%= asset_path('logo.png') %>" alt="profile_picture" width="50" height="50">
  ${res[0]} : ${result.full_name}
</td> */}
          content =
          `
          <tr class="card" id="${res[0]}" style="margin-bottom: 20px;">

            <td>
              ${result.email}
            </td>
            <td class="card-footer">
              <button class="btn btn-danger removefriend" id="removefriend${res[0]}" style="margin-left: 70%;">
                remove
              </button>
            </td>
          </tr>
          `;

          $("#orderfriends").last().append(content);
        } else {
          $(".friendexistalert").css("display", "block");
        }
        allIds();
      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        $(".friendalert").css("display", "block");
        $("#fiendsearch").val("");
      },
    });
  });
});

$(document).ready(function () {
  $("#groupsearch_form").on("click", function (e) {
    e.preventDefault();
    var groupname = document.getElementById("groupsearch").value;
    var content = "";

    $.ajax({
      type: "GET",
      url: "addGrouptoOrder",
      dataType: "json",
      data: { group_name: groupname },
      success: function (res) {
        $(".groupalert").css("display", "none");

        //  ---------------group-----------------
        result = res[1].friends;
        for (i = 0; i < result.length; i++) {
          //  console.log(res[0].friendsid[i])
          friendsids = checkrows();

          //check if current row id already exist
          if (!checkForMatch(friendsids, res[0].friendsid[i])) {

            imageUrl = result[i].image;

            content =
              `<tr class="card" id="${res[0].friendsid[i]}" style="margin-bottom:20px">

                <td class="card-body"> ${result[i].email} </td>
                <td class="card-footer">
                  <button style="margin-left:70%" class="btn btn-danger removefriend" id="removefriend${res[0].friendsid[i]}">remove</button>
                </td>
              </tr>`;
            $("#orderfriends").last().append(content);
          }
        }
        allIds();
      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        $(".groupalert").css("display", "block");
        $("#groupsearch").val("");
      },
    });
  });
});

function allIds() {
  formData = checkrows();
  //formData=uniqueItems;
  // console.log('thisis',formData)
  $.ajax({
    type: "GET",
    url: "order_friend_params",
    dataType: "json",
    data: { formData: formData },
  });
}

//disable submit if restaurant name isnot add
$(document).ready(function () {
  $("#fiendsearch, #groupsearch, #order_name, #order_order_for, order_menu").change(function () {
    if ($("#order_name").val().length) {
      $(".restautantalert").css("display", "none");
      $("#submit-order").prop("disabled", false);
    } else {
      $(".restautantalert").css("display", "block");
      $("#submit-order").prop("disabled", true);
    }
  });
});

//alerts
// var alertList = document.querySelectorAll('.alert')
// alertList.forEach(function (alert) {
//   new coreui.Alert(alert)
// })

// $('#submit-order').on("click", function (e) {
//   restval=$('#order_name').val()
//   if(restval == ""){
//     e.preventDefault
//     alert('please enter Restaurant name !!')
//   }

// });

$(document).on("click", ".removefriend", function () {
  idvalue = $(this).closest("tr").attr("id");
  $(this).closest("tr").remove();

  // deleterows(idvalue);
  allIds();
  //console.log(uniqueItems)
});
