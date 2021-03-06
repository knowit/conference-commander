# == Schema Information
#
# Table name: activities
#
#  id                         :integer          not null, primary key
#  title                      :text             not null
#  description                :text             not null
#  event_id                   :integer          not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  ingress                    :string
#  price                      :integer
#  max_number_of_participants :integer
#

class Activity < ApplicationRecord

  include Lockable

  belongs_to :event

  has_and_belongs_to_many :participations, through: :activities_participations
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :event, presence: true
  validates :title, presence: true
  validates :description, presence: true

  def to_s
    title
  end
end
