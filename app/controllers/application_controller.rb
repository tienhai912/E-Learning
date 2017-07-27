class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def logged_in_user
    return if user_signed_in?
    store_location
    flash[:danger] = t "please_log_in"
    redirect_to new_user_session_url
  end

  def after_sign_in_path_for resource
    session[:forwarding_url] || request.env["omniauth.origin"] ||
      stored_location_for(resource) || root_path
  end
end
