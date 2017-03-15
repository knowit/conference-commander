class HotelsController < ApplicationController

  include Crudable

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  layout 'crudable'

  def new
    # NOOP
  end

  def create
    @hotel.save
    respond_with @hotel
  end

  def index
    @hotels = Hotel.all
  end

  def edit
    # NOOP
  end

  def update
    @hotel.save
    respond_with @hotel
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path
  end

  private

  def hotel_params
    params.require(:hotel).permit(
      :name,
      :address,
      :country,
      :lat,
      :lon,
      image_attributes: [
        :file
      ]
    )
  end

end
