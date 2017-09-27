class EventsController < ApplicationController

  load_and_authorize_resource

  include Crudable
  layout 'crudable'

  def index
    # NOOP
  end

  def new
    @event.images.build unless @event.images.present?
    respond_with @event
  end

  def show
    if params[:format] == 'xlsx' && !current_user.admin?
      redirect_to root_path
    else
      respond_to do |format|
        format.xlsx {
          response.headers['Content-Disposition'] = 'attachment; filename="Deltagerliste.xlsx"'
          render layout: false
        }
        format.html
      end
    end
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
