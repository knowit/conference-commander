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

  include Lockable

  has_many :participations, dependent: :destroy
  has_many :accommodations, dependent: :destroy
  has_many :hotels,         dependent: :destroy
  has_many :event_sessions, dependent: :destroy
  has_many :activities,     dependent: :destroy
  has_many :venues,         dependent: :destroy

  has_many :tracks, through: :venues, dependent: :destroy
  has_many :users, through: :participations

  has_many :participants, through: :participations, source: :user

  has_many :flight_reservations
  has_many :flights

  has_many :images, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :images

  validates :name, presence: true
  validates :description, presence: true
  validates :starting_at, presence: true
  validates :ending_at, presence: true

  accepts_nested_attributes_for :tracks, :venues, allow_destroy: true

  enum event_type: { conference: 0, social: 1 }

  scope :all_events, -> (show_draft) {
    selection = show_draft ? all : where(is_published: true)
    selection.order(starting_at: :desc)
  }

  scope :next_events, -> (show_draft) {
    selection = where("ending_at > ?", Time.now)

    unless show_draft
      selection = selection.where(is_published: true)
    end

    selection.order(:starting_at)
  }

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

  def image_url
    images.first.file.url
  end

  def dates
    starting_at.to_date.upto(ending_at.to_date)
  end

  def to_s
    name
  end
end
