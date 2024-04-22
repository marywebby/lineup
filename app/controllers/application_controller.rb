class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  skip_forgery_protection
  # devise
  before_action :authenticate_user!
  # pundit
  after_action :verify_authorized, unless: :devise_controller?

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    
    redirect_back fallback_location: root_url
  end
end
