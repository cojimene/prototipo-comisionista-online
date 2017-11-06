$(document).on 'change', '#user_profile_role', ->
  if $(this).val() == 'Comisionista'
    $('#user_profile_experience').closest('.form-group').slideDown()
  else
    $('#user_profile_experience').closest('.form-group').slideUp()