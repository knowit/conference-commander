# == Schema Information
#
# Table name: accommodations
#
#  id             :integer          not null, primary key
#  number_of_beds :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Accommodation < ApplicationRecord
  has_many :participations
  has_and_belongs_to_many :events
end
