# == Schema Information
#
# Table name: users
#
#  id                                :integer          not null, primary key
#  first_name                        :string           not null
#  email                             :text             not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  role                              :integer          default("participant"), not null
#  gender                            :integer          default("unspecified"), not null
#  allergies                         :text
#  last_name                         :string           default("X"), not null
#  passport_first_name               :string
#  passport_last_name                :string
#  passport_number                   :string
#  passport_issued_at                :date
#  passport_expires_at               :date
#  passport_nationality              :string
#  birth_date                        :date
#  encrypted_passport_first_name     :string
#  encrypted_passport_first_name_iv  :string
#  encrypted_passport_last_name      :string
#  encrypted_passport_last_name_iv   :string
#  encrypted_passport_number         :string
#  encrypted_passport_number_iv      :string
#  encrypted_passport_nationality    :string
#  encrypted_passport_nationality_iv :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
