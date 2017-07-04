
# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string
#  country    :string
#  lat        :float
#  lon        :float
#  created_at :datetime
#  updated_at :datetime
#  event_id   :integer
#

class Hotel < ApplicationRecord
  belongs_to :event
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images

  geocoded_by :full_address   # can also be an IP address

  after_validation :geocode          # auto-fetch coordinates

  def full_address
    [address, country].join(', ')
  end

  def to_s
    name
  end

end
