class EventsController < ApplicationController

  layout 'crudable'

  respond_to :html

  load_and_authorize_resource

  def index
    # NOOP
  end

  def new
    @event.venues.build
  end

  def show
    respond_with @event
  end

  def edit
    respond_with @event
  end

  def create
    @event.save(event_params)
    respond_with @event
  end

  def update
    @event.update(event_params)
    respond_with @event
  end

  def destroy
    @event.destroy
    respond_with @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :starting_at, :ending_at, venues_attributes: [:name, :_destroy])
  end
end
