class ParticipationsController < ApplicationController
  #layout 'crudable'

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    # NOOP
  end

  def show
    # NOOP
  end

  def new
    # NOOP
  end

  def edit
    # NOOP
  end

  def create
    @participation.save
    respond_with @participation
  end

  def update
    @participation.update(participation_params)
    respond_with @participation
  end

  def destroy
    @participation.destroy
    respond_with @participation
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :event_id)
  end
end
