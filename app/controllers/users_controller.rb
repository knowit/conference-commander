class UsersController < ApplicationController

  responders :flash
  respond_to :html

  layout 'crudable'

  load_and_authorize_resource

  def index
    # NOOP
  end

  def show
    # NOOP
  end

  def edit
    # NOOP
  end

  def new
    # NOOP
  end

  def create
    @user = User.create(user_params)
    respond_with @user
  end

  def update
    @user.update(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :gender, :allergies)
  end

end
