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
    @hotel.save
    respond_with @hotel
  end

  def index
    # NOOP
  end

  def edit
    # NOOP
  end

  def update
    @hotel.save
    redirect_to event_hotel_path(@parent, @hotel)
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path
  end

  private

  def set_parent
    @parent ||= Event.find(params[:event_id])
  end

  def hotel_params
    params.require(:hotel).permit(
      :event_id,
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
