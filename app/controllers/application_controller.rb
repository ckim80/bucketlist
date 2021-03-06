class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || buckets_path
  end

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :avatar_url])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:username])
  end

  rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end
end
