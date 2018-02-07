class ParticipationsController < ApplicationController

  include Crudable

  layout 'crudable'

  before_action :set_parent

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    if params[:format] == 'xlsx' && !current_user.administrator?
      redirect_to root_path
    else
      respond_to do |format|
        format.xlsx {
          response.headers['Content-Disposition'] = 'attachment; filename="Deltagerliste.xlsx"'
          render layout: false
        }
        format.html
      end
    end
  end

  def show
    respond_with @participation
  end

  def new
    existing_participation = @event.user_participation(current_user)
    if existing_participation
      redirect_to edit_event_participation_path(@event, id: existing_participation)
    else
      @participation.user = current_user
      @participation.activity_ids = @participation.event.activities.select(&:default_activity).map(&:id)
      respond_with @participation
    end
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

  def set_parent
    @parent ||= Event.find(params[:event_id])
  end

  def participation_params
    params.require(:participation).permit(
      :user_id,
      :event_id,
      :single_room,
      :request_for_sharing_room,
      :extended_stay,
      :extended_stay_from,
      :extended_stay_to,
      activity_ids: [],
      user_attributes: [
        :id,
        :allergies
      ]
    )
  end
end
