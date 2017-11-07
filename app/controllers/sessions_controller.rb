class SessionsController < ApplicationController

  def new
    # NOOP
  end

  def create
    @user = User.find_or_create_by_auth_hash(auth_hash)
    redirect = session[:return_to]
    reset_session
    session[:return_to] = redirect if redirect
    session[:user_id] = @user.id
    redirect_to after_sign_in_path_for(@user)
  end


  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to '/signin', alert: "Authentication error: #{params[:message].humanize}"
  end

protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
