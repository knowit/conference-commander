require_relative "../services/collection_to_csv"

class AllergiesController < ApplicationController
  CSV_ATTRS = %w{name email allergies}

  def index
    @event = Event.includes(:participants).find(params[:event_id])
    @participants = @event.participants.where.not(allergies: nil)


    respond_to do |format|
      format.html
      format.csv { send_data to_csv, filename: format("%s-participant-allergies.csv", @event.name) }
    end
  end

  private

  def to_csv()
    CollectionToCSV.perform(@participants.first, CSV_ATTRS)
  end
end
