class TracksController < ApplicationController

  include Crudable

  layout 'crudable'

  before_action :set_parent

  load_and_authorize_resource :event
  load_and_authorize_resource

  def index
    @tracks = @event.tracks
  end

  def create
    @track.save
    respond_with @event, @track
  end

  def show
    @tracks = @event.tracks
  end

  def edit
    @tracks = @event.tracks
  end

  def update
    @track.update(track_params)
    respond_with @event, @track
  end

  def destroy
    @track.destroy
    respond_with @event, @track
  end

  private

  def set_parent
    @parent ||= Event.find(params[:event_id])
  end

  def track_params
    params.require(:track).permit(
      :venue_id,
      :name
    )
  end
end
