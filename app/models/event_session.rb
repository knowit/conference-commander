# == Schema Information
#
# Table name: event_sessions
#
#  id           :integer          not null, primary key
#  title        :text             not null
#  description  :text             not null
#  duration     :integer          not null
#  submitter_id :integer          not null
#  event_id     :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  outline      :text
#  start_time   :datetime
#  state        :integer          default("proposed")
#  track_id     :integer
#  language     :integer          default("en")
#

class EventSession < ApplicationRecord
  MAX_ALLOWED_TIME_ALLOTMENT = 480
  belongs_to :submitter, class_name: 'User'
  belongs_to :event
  belongs_to :track, optional: true
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments

  acts_as_taggable

  enum state: { proposed: 0, rejected: 1, accepted: 2 }
  enum language: { en: 0, no: 1, sv: 2 }

  validates :title, presence: true
  validates :submitter, presence: true
  validates :description, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, less_than_or_equal_to: MAX_ALLOWED_TIME_ALLOTMENT }

  def to_s
    "Event"
  end

  def short_description
    if description.length < 50
      description
    else
      description.split[0..10].join(' ') + ' (...)'
    end
  end
end
