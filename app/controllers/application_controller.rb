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

private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
