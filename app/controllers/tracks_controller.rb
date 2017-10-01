class TracksController < ApplicationController

  include Crudable
  layout 'crudable'

  before_action :set_parent

  load_and_authorize_resource :venue
  load_and_authorize_resource through: :venue

  def index
    @tracks = @event.tracks
  end

  def create
    @track.save
    respond_with @venue, @track
  end

  def show
    @tracks = @venue.tracks
  end

  def edit
    @tracks = @venue.tracks
  end

  def update
    @track.update(track_params)
    respond_with @venue, @track
  end

  def destroy
    @track.destroy
    respond_with @venue, @track
  end

  private

  def set_parent
    @parent ||= Venue.find(params[:venue_id])
  end

  def track_params
    params.require(:track).permit(
      :venue_id,
      :name
    )
  end
end
