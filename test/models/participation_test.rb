# == Schema Information
#
# Table name: participations
#
#  id                       :integer          not null, primary key
#  single_room              :boolean          default(FALSE)
#  user_id                  :integer          not null
#  event_id                 :integer          not null
#  accommodation_id         :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  request_for_sharing_room :text
#  extended_stay            :boolean
#  extended_stay_from       :date
#  extended_stay_to         :date
#

require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
