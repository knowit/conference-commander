class ParticipationsController < ApplicationController

  include Crudable

  layout 'crudable'

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    respond_with @participations
  end

  def show
    respond_with @participation
  end

  def new
    @participation.user = current_user
    respond_with @participation
  end

  def edit
    respond_with @participation
  end

  def create
    @participation.save
    respond_with @participation, location: events_path
  end

  def update
    @participation.update(participation_params)
    respond_with @participation, location: events_path
  end

  def destroy
    @participation.destroy
    respond_with @participation, location: events_path
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :event_id, :single_room, :request_for_sharing_room, :extended_stay,
      :extended_stay_from, :extended_stay_to, activity_ids: [])
  end
end
