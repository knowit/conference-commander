class UsersController < ApplicationController
  include Crudable

  before_action :remove_role_if_not_admin, only: :update

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
    respond_with @user, location: edit_user_path(@user)
  end

  def update
    @user.update(user_params)
    respond_with @user, location: edit_user_path(@user)
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :role, :allergies,
                                 :birth_date, :passport_name, :passport_number, :passport_nationality,
                                 :passport_issued_at, :passport_expires_at)
  end

  def remove_role_if_not_admin
    params[:user].delete :role unless current_user.role == 'administrator'
  end

end
