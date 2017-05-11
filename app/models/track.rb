# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  start_at    :datetime
#  end_at      :datetime
#  schedule_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Track < ApplicationRecord
  belongs_to :schedule
  has_many :proposals
end
