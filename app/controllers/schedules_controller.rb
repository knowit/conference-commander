class SchedulesController < ApplicationController

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    # NOOP
  end
end
