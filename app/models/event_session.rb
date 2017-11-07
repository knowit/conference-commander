# == Schema Information
#
# Table name: event_sessions
#
#  id                     :integer          not null, primary key
#  title                  :text             not null
#  description            :text             not null
#  duration               :integer          not null
#  submitter_id           :integer          not null
#  event_id               :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  outline                :text
#  start_time             :datetime
#  state                  :integer          default("proposed")
#  track_id               :integer
#  language               :integer          default("en")
#  session_type           :integer          default("presentation"), not null
#  level                  :integer          default("beginner"), not null
#  co_presenters          :string
#  comments_to_organizers :string
#

class EventSession < ApplicationRecord

  include Lockable

  MAX_ALLOWED_TIME_ALLOTMENT = 480

  belongs_to :submitter, class_name: 'User'
  belongs_to :event
  belongs_to :track, optional: true

  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :submitter

  acts_as_taggable

  enum state: { proposed: 0, rejected: 1, accepted: 2 }
  enum language: { en: 0, no: 1, sv: 2 }
  enum session_type: { lightning_talk: 0, presentation: 1, workshop: 2 }
  enum level: { beginner: 0, intermediate: 1, expert: 2 }

  validates :title, presence: true
  validates :submitter, presence: true
  validates :description, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, less_than_or_equal_to: MAX_ALLOWED_TIME_ALLOTMENT }

  scope :by_date, ->(date) { where(start_time: date.all_day) }
  scope :program, ->(date) { where(state: %i[accepted proposed]) }

  def to_s
    title
  end

  def short_description
    if description.length < 50
      description
    else
      description.split[0..10].join(' ') + ' (...)'
    end
  end

  def end_time
    start_time + duration.minutes
  end

  def time_interval
    start_time..end_time
  end
end
