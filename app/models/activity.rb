# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  title       :text             not null
#  description :text             not null
#  event_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Activity < ApplicationRecord

  include Lockable

  belongs_to :event

  has_and_belongs_to_many :participations, through: :activities_participations

  validates :event, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
