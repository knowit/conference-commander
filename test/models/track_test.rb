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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
