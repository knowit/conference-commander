class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :title, presence: true
  validates :description, presence: true
  validates :duration, presence: true, inclusion: { in: [10, 15, 20, 30, 45, 60] }

end
