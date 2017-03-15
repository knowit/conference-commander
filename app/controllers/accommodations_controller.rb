class AccommodationsController < ApplicationController

  include Crudable

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event, shallow: true

  responders :flash
  respond_to :html

  layout 'crudable'

  def index
    # NOOP
  end

  def show
    # NOOP
  end

  def edit
    # NOOP
  end

  def new
    # NOOP
  end

  def create
    @accommodation.save(accommodation_params)
    respond_with @accommodation
  end

  def update
    @accommodation.update(accommodation_params)
    respond_with @accommodation
  end

  def destroy
    @accommodation.destroy
    respond_with @accommodation
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:number_of_beds, :event_id)
  end

end
