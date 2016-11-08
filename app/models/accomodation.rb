# == Schema Information
#
# Table name: accomodations
#
#  id             :integer          not null, primary key
#  number_of_beds :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Accomodation < ApplicationRecord
  has_many :participations
end
