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
    @event_session.submitter = current_user unless current_user.administrator?
    if @event_session.save
      respond_with @event, location: event_event_sessions_path(@event)
    else
      flash[:error] = @event_session.errors.full_messages.to_sentence
      redirect_to action: :new
    end
  end

  def show
    @event_sessions = @event.event_sessions
  end

  def update
    @event_session.update(event_session_params)
    respond_with @event, location: event_event_sessions_path(@event)
  end

  def destroy
    @event_session.destroy
    respond_with @event, location: event_event_sessions_path(@event)
  end

  private

  def set_parent
    @parent ||= Event.find(params[:event_id])
  end

  def event_session_params
    params.require(:event_session).permit(
      :event_id,
      :session_type,
      :title,
      :description,
      :duration,
      :submitter_id,
      :state,
      :language,
      :start_time,
      :outline,
      :level,
      :co_presenters,
      :comments_to_organizers,
      co_presenter_ids: [],
      tag_list: []
    )
  end
end
