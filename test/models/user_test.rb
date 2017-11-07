# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  first_name           :string           not null
#  email                :text             not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  role                 :integer          default("participant"), not null
#  gender               :integer          default("unspecified"), not null
#  allergies            :text
#  last_name            :string           default("X"), not null
#  passport_first_name  :string
#  passport_last_name   :string
#  passport_number      :string
#  passport_issued_at   :date
#  passport_expires_at  :date
#  passport_nationality :string
#  birth_date           :date
#  locale               :string           default("en"), not null
#  about                :text
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
