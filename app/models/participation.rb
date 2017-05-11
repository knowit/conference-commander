# == Schema Information
#
# Table name: participations
#
#  id                      :integer          not null, primary key
#  single_room             :boolean          default(FALSE)
#  user_id                 :integer          not null
#  event_id                :integer          not null
#  accommodation_id        :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  request_for_single_room :text
#

class Participation < ApplicationRecord

  belongs_to :user
  belongs_to :event
  belongs_to :accommodation, optional: true

  has_many :flight_reservations

  has_and_belongs_to_many :preferred_roommates, class_name: 'User'

  validates :user_id, uniqueness: { scope: :event_id }

  scope :single_room_participants, -> {where(single_room: true)}

  def self.list_single_room_participants
    @participants = Participation.where(single_room: true)
  end

end
