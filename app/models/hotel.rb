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
#

class Hotel < ApplicationRecord
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image
end
