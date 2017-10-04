class EventsController < ApplicationController

  load_and_authorize_resource

  include Crudable
  layout 'crudable'

  def index
    @events = Event.all_events(current_user&.administrator?)
  end

  def new
    @event.images.build unless @event.images.present?
    respond_with @event
  end

  def show
    respond_with @event
  end

  def edit
    @event.images.build unless @event.images.present?
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
    params.require(:event).permit(
      :id,
      :name,
      :description,
      :starting_at,
      :ending_at,
      :is_published,
      hotels_attributes: [
        :id,
        :name,
        :_destroy
      ],
      images_attributes: [
        :file
      ]
    )
  end
end
