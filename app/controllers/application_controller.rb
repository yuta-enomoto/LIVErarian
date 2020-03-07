class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  private
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
