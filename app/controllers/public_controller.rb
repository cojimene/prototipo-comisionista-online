class PublicController < ApplicationController

  def welcome
    render :welcome, layout: false
  end

end
