class AccommodationsController < ApplicationController

  responders :flash
  respond_to :html

  def index
    @accommodations = Accommodation.all
  end

  def show
    @accommodation= Accommodation.find(params[:id])
  end

  def edit
    @accommodation= Accommodation.find(params[:id])
  end

  def new
    @accommodation= Accommodation.new
  end

  def create
    @accommodation= Accommodation.create(accommodation_params)
    redirect_to action: :index
  end

  def update
    @accommodation= Accommodation.find(params[:id])
    @accommodation.update(accommodation_params)
    respond_with @accommodation
  end

  def destroy
    @accommodation= Accommodation.find(params[:id])
    @accommodation.destroy
    respond_with @accommodation
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:number_of_beds, :event_id)
  end

end
