class ActivitiesController < ApplicationController

  layout 'crudable'

  respond_to :html
  before_action :set_activity, except: [:index, :new, :create]


  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to @activity
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy

    respond_with @activity
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :starting_at, :ending_at, :event_id)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
