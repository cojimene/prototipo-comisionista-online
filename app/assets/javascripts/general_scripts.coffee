@launch_toastr_messages = ->
  $('.toastr-messages').each ->
    toastr[$(this).data('type')] $(this).text()

@load_time_pickers = ->
  $('.datetimepicker').datetimepicker({format: 'YYYY-MM-DD HH:mm', ignoreReadonly: true })
  $('.datepicker').datetimepicker({format: 'YYYY-MM-DD', ignoreReadonly: true })
  $('.birthdate').datetimepicker({format: 'YYYY-MM-DD', viewMode: 'years', ignoreReadonly: true })

@launch_tooltips = ->
  $('[data-toggle="tooltip"]').tooltip()

# $(document).on 'click', 'a.confirm-destroy', (e) ->
#   e.preventDefault()
#   $target_link = $(this)
#   swal {
#     title: '¿Está seguro?'
#     text: '¡Está acción no puede deshacerse!'
#     type: 'warning'
#     showCancelButton: true
#     confirmButtonText: 'Si'
#     cancelButtonText: 'No'
#   }, (isConfirm) ->
#     if isConfirm
#       if $target_link.data('remote')
#         $.rails.handleRemote($target_link.data('url'))
#       else
#         $.rails.handleMethod($target_link.data('url'))

$(document).ready ->
  launch_toastr_messages()
  load_time_pickers()
  launch_tooltips()