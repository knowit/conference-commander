class HotelsController < ApplicationController

  include Crudable

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  layout 'crudable'

  def index
    @hotels = Hotel.all
  end

  def new
    @hotel.build_image
  end

  def create
    @hotel.save
    respond_with @hotel
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
