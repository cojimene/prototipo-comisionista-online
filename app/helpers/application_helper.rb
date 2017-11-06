module ApplicationHelper

  def swal_delete_button(url, name='Borrar', params={})
    classes = params[:class] || 'btn btn-danger pull-right'
    data = {confirm: '¿Está seguro?', text: '¡Está acción no puede deshacerse!', 'confirm-button-text': 'Si',
      'cancel-button-text': 'No', 'sweet-alert-type': 'warning', 'confirm-button-color': '#c9302c' }
    data = data.merge(params[:data]) if params[:data]
    link_to name, url, method: :delete, class: classes, data: data
  end

end
