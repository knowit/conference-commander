class UsersController < ApplicationController

  respond_to :html

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    respond_with @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
