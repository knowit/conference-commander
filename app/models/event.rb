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

  has_many :participations, dependent: :destroy
  has_many :accommodations, dependent: :destroy
  # has_many :schedules, dependent: :destroy
  has_many :hotels, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :users, through: :participations
  has_many :activities

  has_many :venues, dependent: :destroy

  has_many :participants, through: :participations, source: :user

  has_many :flight_reservations
  has_many :flights

  validates :name, presence: true
  validates :description, presence: true
  validates :starting_at, presence: true
  validates :ending_at, presence: true

  accepts_nested_attributes_for :venues, allow_destroy: true

  def add_accommodations(quantity, number_of_beds)
    accs = Array.new(quantity, { number_of_beds: number_of_beds })
    accommodations.create(accs)
  end

  def user_already_signed_up?(user)
    participants.include? user
  end

  def user_participation(user)
    participations.where(user: user).first
  end

  def to_s
    name
  end

end
