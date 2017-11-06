class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_locale
  before_action :check_registration_finished, unless: :devise_controller?

  helper_method :current_user

protected

  def check_registration_finished
    if user_signed_in? && !current_user.has_profile?
      redirect_to new_user_profile_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_url, alert: 'Usted no está autorizado para acceder a este recurso' }
    end
  end

private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
