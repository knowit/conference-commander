# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  start_at   :datetime
#  end_at     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Schedule < ApplicationRecord
  has_many :tracks
end
