class HotelsController < ApplicationController

  include Crudable

  before_action :set_parent

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  layout 'crudable'

  def new
    # NOOP
  end

  def create
    @hotel = @parent.hotels.build(hotel_params)

    if @hotel.save
      redirect_to event_hotels_path(@parent)
    else
      render :new
    end
  end

  def index
    # NOOP
  end

  def edit
    # NOOP
  end

  def update
    if hotel.update(activity_params)
      redirect_to event_hotels_path(@parent)
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy
    redirect_to event_hotels_path
  end

  private

  def set_parent
    @parent ||= Event.find(params[:event_id])
  end

  def hotel_params
    params.require(:hotel).permit(
      :event_id,
      :name,
      :description,
      :address,
      :country,
      :latitude,
      :longitude,
      image_attributes: [
        :file
      ]
    )
  end

end
