class Activity < ApplicationRecord
  belongs_to :event

  has_and_belongs_to_many :participations, through: :activities_participations

  validates :event, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
