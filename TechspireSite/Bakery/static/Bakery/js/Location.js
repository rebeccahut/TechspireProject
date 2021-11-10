function update_states() {
  var country = $("#id_form-0-country").val()
  var url = $("#States_URL").attr("data-url");
  var target_element = $("#id_form-0-state")
  var location = $("#id_form-0-id").val()
  $.ajax({
    url: url,
    data: {
      'country': country,
      'location': location
    },
    success: function (data) {
      target_element.html(data)
      //If selected option doesn't exist reset it to blank
      if (target_element.val() == null) {
        target_element.val("")
      }
    }
  })
}


$(document).ready(function () {
  update_states()
  $("#id_form-0-country").change(update_states)
})
