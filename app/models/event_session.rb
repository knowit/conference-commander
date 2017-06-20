# == Schema Information
#
# Table name: event_sessions
#
#  id          :integer          not null, primary key
#  title       :text             not null
#  description :text             not null
#  duration    :integer          not null
#  user_id     :integer          not null
#  event_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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
  validates :description, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, less_than_or_equal_to: MAX_ALLOWED_TIME_ALLOTMENT }
end
