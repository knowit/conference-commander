class Activity < ApplicationRecord
  belongs_to :event
  has_many :activity_participations
  has_many :participants, through: :activity_participations, source: :user
end
