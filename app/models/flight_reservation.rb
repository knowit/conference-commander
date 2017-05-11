# == Schema Information
#
# Table name: flight_reservations
#
#  id               :integer          not null, primary key
#  travel_date      :datetime
#  flight_number    :string
#  flight_id        :integer
#  participation_id :integer          not null
#  event_id         :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class FlightReservation < ApplicationRecord

  belongs_to :event
  belongs_to :participation
  belongs_to :flight

end
