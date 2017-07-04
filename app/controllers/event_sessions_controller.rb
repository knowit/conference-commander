class EventSessionsController < ApplicationController

  include Crudable
  layout 'crudable'

  before_action :set_parent

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    @event_sessions = @event.event_sessions
  end

  def create
    if !current_user.administrator?
      @event_session.submitter = current_user
    end

    @event_session.save
    respond_with @event, @event_session
  end

  def show
    @event_sessions = @event.event_sessions
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
