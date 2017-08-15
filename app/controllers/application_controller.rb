class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  respond_to :html
  responders :flash

  helper_method :current_user, :user_signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to signin_path, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

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

end
