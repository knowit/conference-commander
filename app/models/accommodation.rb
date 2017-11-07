# == Schema Information
#
# Table name: accommodations
#
#  id             :integer          not null, primary key
#  number_of_beds :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  event_id       :integer          not null
#

class Accommodation < ApplicationRecord

  has_many :participations
  belongs_to :event

  validates :event, presence: true

  scope :vacancies, -> { participations.count < number_of_beds }

  def self.vacancies(event_id)
    where(event_id: event_id).select { |record| record.vacant? }
  end

  def vacant?
    Participation.where(accommodation_id: id).count < number_of_beds
  end
end
