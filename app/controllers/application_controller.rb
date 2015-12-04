class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_in_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration { strategy DecentExposure::StrongParametersStrategy }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      sanitized_params = %i(
        email
        password
        password_confirmation
      )
      u.permit(sanitized_params)
    end
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "You need to sign in or sign up before continuing."
      redirect_to new_user_session_url
    end
  end
end
