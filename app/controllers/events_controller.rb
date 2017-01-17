class EventsController < ApplicationController

  before_action :set_event, except: [:index, :new, :create]

  layout 'crudable'

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :starting_at, :ending_at)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
