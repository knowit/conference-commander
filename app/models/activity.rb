class Activity < ApplicationRecord
  belongs_to :event

  validates :event, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
