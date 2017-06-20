class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_locale

  respond_to :html
  responders :flash

  helper_method :current_user, :user_signed_in?

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def user_signed_in?
    !!current_user
  end

  private

  def after_sign_in_path_for(user)
    if user.complete?
      root_path
    else
      after_signup_path(:complete_profile)
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
