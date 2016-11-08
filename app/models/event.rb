# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :text             not null
#  description :text             not null
#  starting_at :datetime         not null
#  ending_at   :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  has_many :participations
  has_many :accommodations
end
