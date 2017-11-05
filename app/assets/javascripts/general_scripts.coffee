@launch_toastr_messages = ->
  $('.toastr-messages').each ->
    toastr[$(this).data('type')] $(this).text()

@load_time_pickers = ->
  $('.datetimepicker').datetimepicker({format: 'YYYY-MM-DD HH:mm', ignoreReadonly: true })
  $('.datepicker').datetimepicker({format: 'YYYY-MM-DD', ignoreReadonly: true })
  $('.birthdate').datetimepicker({format: 'YYYY-MM-DD', viewMode: 'years', ignoreReadonly: true })

@launch_tooltips = ->
  $('[data-toggle="tooltip"]').tooltip()

$(document).ready ->
  launch_toastr_messages()
  load_time_pickers()
  launch_tooltips()