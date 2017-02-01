class Activity < ApplicationRecord
  belongs_to :event
  has_many :activity_participations
  has_many :participants, through: :activity_participations, source: :user

  validates :name, presence: true
  validates :starting_at, presence: true
  validates :ending_at, presence: true
  validates :event, presence: true
end
