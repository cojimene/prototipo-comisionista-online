class MessagesController < ApplicationController

  load_and_authorize_resource

  def index
    @messages = @messages.includes(user: :user_profile, recipient: :user_profile)
  end

  def create
    @message.save
  end

private

  def message_params
    params.require(:message).permit(:recipient_id, :subject, :content, :urgent).merge user: current_user
  end

end
