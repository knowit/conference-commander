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
  has_many :proposals
  has_many :users, through: :participations

  has_many :participants, through: :participations, source: :user

  validates :name, presence: true
  validates :description, presence: true
  validates :starting_at, presence: true
  validates :ending_at, presence: true
end
