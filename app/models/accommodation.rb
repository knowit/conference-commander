# == Schema Information
#
# Table name: accommodations
#
#  id             :integer          not null, primary key
#  number_of_beds :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  event_id       :integer          not null
#

class Accommodation < ApplicationRecord
  has_many :participations
  belongs_to :event
end
