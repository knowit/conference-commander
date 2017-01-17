# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  email      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :integer          default("participant"), not null
#  gender     :integer          default("unspecified"), not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
