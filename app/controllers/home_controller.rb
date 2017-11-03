class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :check_registration_finished, only: :index

  def index
    render :index, layout: false
  end

end
