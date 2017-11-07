class ApplicationController < ActionController::Base

  require 'ldap_connector'

  protect_from_forgery with: :exception

  before_action :set_locale

  respond_to :html
  responders :flash

  helper_method :current_user, :user_signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.js   { head :forbidden, content_type: 'text/html' }
      format.html do
        session[:return_to] = request.fullpath
        redirect_to signin_path, notice: exception.message 
      end
    end
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  impersonates :user

  def user_signed_in?
    !!current_user
  end

  private

  def after_sign_in_path_for(user)
    if user.complete?
      session[:return_to] || root_path
    else
      after_signup_path(:complete_profile)
    end
  end

  def set_locale
    I18n.locale = current_user&.locale || I18n.default_locale
  end
end
