class EventSessionsController < ApplicationController

  include Crudable
  layout 'crudable'

  before_action :set_parent

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    # NOOP
  end

  def create
    @event_session.save
    respond_with @event, @event_session
  end

  def show
    redirect_to event_event_sessions_path(@event)
  end

  private

  def set_parent
    @parent ||= Event.find(params[:event_id])
  end

  def event_session_params
    params.require(:event_session).permit(
      :event_id,
      :title,
      :description,
      :duration,
      :submitter_id
    )
  end
end
