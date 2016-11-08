# == Schema Information
#
# Table name: participations
#
#  id               :integer          not null, primary key
#  single_room      :boolean          default(FALSE)
#  user_id          :integer          not null
#  event_id         :integer          not null
#  accommodation_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :accommodation, optional: true
  has_and_belongs_to_many :preferred_roommates, class_name: 'User'
end
