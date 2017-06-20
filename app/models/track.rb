# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  start_at   :datetime
#  end_at     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  has_many :event_sessions
end
