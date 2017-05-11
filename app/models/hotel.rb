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
end
