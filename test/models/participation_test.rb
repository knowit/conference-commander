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
# Indexes
#
#  index_participations_on_accommodation_id      (accommodation_id)
#  index_participations_on_event_id              (event_id)
#  index_participations_on_user_id               (user_id)
#  index_participations_on_user_id_and_event_id  (user_id,event_id) UNIQUE
#

require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
