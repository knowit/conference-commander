# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  name         :text             not null
#  description  :text             not null
#  starting_at  :datetime         not null
#  ending_at    :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  event_type   :integer          default("conference"), not null
#  is_published :boolean          default(FALSE), not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
