# == Schema Information
#
# Table name: participations
#
#  id              :integer          not null, primary key
#  single_room     :boolean          default(FALSE)
#  user_id         :integer          not null
#  event_id        :integer          not null
#  accomodation_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
