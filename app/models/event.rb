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

  validates :name, nil: false
  validates :description, nil: false
  validates :starting_at, nil: false
  validates :ending_at, nil: false
  validates :created_at, nil: false
  validates :updated_at, nil: false
end
