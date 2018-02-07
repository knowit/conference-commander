class UsersController < ApplicationController
  
  include Crudable

  before_action :remove_role_if_not_admin, only: :update

  responders :flash
  respond_to :html

  layout 'crudable'

  load_and_authorize_resource

  def index
    @users = @users.includes(:passport)
    # NOOP
  end

  def show
    # NOOP
  end

  def edit
    @user.build_passport unless @user.passport
  end

  def new
    @user.build_passport unless @user.passport
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

  def impersonate
    if true_user.administrator?
      user = User.find(params[:id])
      impersonate_user(user)
      redirect_to root_path
    end
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :gender,
      :locale,
      :role,
      :company,
      :allergies,
      :birth_date,
      :about,
      passport_attributes: [
        :id,
        :first_name,
        :last_name,
        :number,
        :nationality,
        :issued_at,
        :expires_at
      ]
    )
  end

  def remove_role_if_not_admin
    params[:user].delete :role unless current_user.role == 'administrator'
  end

end
