class FlightReservation < ApplicationRecord

  belongs_to :event
  belongs_to :participation
  belongs_to :flight

end
