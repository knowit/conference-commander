# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  venue_id   :integer
#  name       :text
#  capacity   :integer
#

class Track < ApplicationRecord
  has_many :event_sessions
  belongs_to :venue
end
