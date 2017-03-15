class Flight < ApplicationRecord

  has_many :flight_reservations

  belongs_to :event


end
