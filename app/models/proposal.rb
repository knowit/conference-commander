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
# Indexes
#
#  index_proposals_on_event_id  (event_id)
#  index_proposals_on_user_id   (user_id)
#

class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :title, presence: true
  validates :description, presence: true
  validates :duration, presence: true, inclusion: { in: [10, 15, 20, 30, 45, 60] }

end
