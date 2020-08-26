class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :nickname, :real_family_name, :real_first_name, :reading_family_name, :reading_first_name, :birthday])
end
