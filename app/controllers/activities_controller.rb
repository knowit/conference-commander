class ActivitiesController < ApplicationController

  include Crudable
  layout 'crudable'

  before_action :set_parent

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    @activities = @event.activities
  end

  def new
    # NOOP
  end

  def show
    @activity = Activity.find_by_event_id(@parent.id)
  end

  def create
    @activity = @parent.activities.build(activity_params)

    if @activity.save
      redirect_to event_activities_path(@parent)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to event_activities_path(@parent)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy

    redirect_to event_activities_path(@parent)
  end

  private

  def set_parent
    @parent = Event.find(params[:event_id])
  end

  def activity_params
    params.require(:activity).permit(
      :event_id,
      :title,
      :ingress,
      :description,
      :price,
      :max_number_of_participants,
      image_attributes: [
        :file
      ]
    )
  end
end
