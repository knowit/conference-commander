class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  respond_to :html

  helper_method :current_user

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
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
