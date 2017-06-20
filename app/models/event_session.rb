# == Schema Information
#
# Table name: proposals
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

  DURATIONS = [10, 15, 20, 30, 45, 60]

  belongs_to :user
  belongs_to :event
  belongs_to :track

  validates :title, presence: true
  validates :description, presence: true
  validates :duration, presence: true, inclusion: { in: DURATIONS }

end
