@launch_toastr_messages = ->
  $('.toastr-messages').each ->
    toastr[$(this).data('type')] $(this).text()

$(document).ready ->
  launch_toastr_messages()

