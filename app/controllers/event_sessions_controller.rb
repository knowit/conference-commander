class EventSessionsController < ApplicationController

  include Crudable

  layout 'crudable'

  before_action :set_parent

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    # NOOP
  end

  private

  def set_parent
    @parent ||= Event.find(params[:event_id])
  end
end
