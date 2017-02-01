class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  respond_to :html

  helper_method :current_user

  def current_user
    begin
      return User.new(role: 'administrator') if Rails.env.development?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

end
