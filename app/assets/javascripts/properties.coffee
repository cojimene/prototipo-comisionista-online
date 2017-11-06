$(document).on 'change', '#property_property_type', ->
  if $(this).val() == 'Lote'
    $('.hiddeable').slideUp().find('input').prop('required', false)
  else
    $('.hiddeable').slideDown().find('input').prop('required', true)