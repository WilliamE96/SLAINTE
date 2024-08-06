class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_default_chatroom

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :photo])
  end

  private

  def set_default_chatroom
    @chatroom = Chatroom.first
  end
end
