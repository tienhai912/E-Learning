class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  attr_reader :user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def logged_in_admin
    logged_in_user
    return unless user_signed_in?

    return if current_user.is_admin?
    flash[:danger] = t "no_permission"
    redirect_to root_path
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
