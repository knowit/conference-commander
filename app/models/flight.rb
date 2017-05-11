# == Schema Information
#
# Table name: flights
#
#  id                        :integer          not null, primary key
#  airline                   :string           not null
#  from                      :string           not null
#  destination               :string           not null
#  flight_number             :string           not null
#  direction                 :integer          not null
#  travel_date               :datetime         not null
#  change_reservation_before :date
#  event_id                  :integer          not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Flight < ApplicationRecord

  has_many :flight_reservations

  belongs_to :event


end
