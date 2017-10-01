class VenuesController < ApplicationController

  include Crudable
  layout 'crudable'

  before_action :set_parent

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    @venues = @event.venues
  end

  def create
    @venue.save
    respond_with @event, @venue
  end

  def show
    # NOOP
  end

  def edit
    # NOOP
  end

  def update
    @venue.update(venue_params)
    respond_with @event, @venue
  end

  def destroy
    @venue.destroy
    respond_with @event, @venue
  end

  private

  def set_parent
    @parent ||= Event.find(params[:event_id])
  end

  def venue_params
    params.require(:venue).permit(
      :event_id,
      :name,
      :description,
      :capacity
    )
  end
end
