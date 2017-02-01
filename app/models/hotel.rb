# == Schema Information
#
# Table name: hotels
#
#  id                   :integer          not null, primary key
#  name                 :string           not null
#  address              :string
#  country              :string
#  lat                  :float
#  lon                  :float
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Hotel < ApplicationRecord
  has_many :accommodations
end
