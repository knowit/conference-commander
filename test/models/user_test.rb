# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  first_name              :string           not null
#  email                   :text             not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  role                    :integer          default("participant"), not null
#  gender                  :integer          default("unspecified"), not null
#  allergies               :text
#  last_name               :string           default("X"), not null
#  passport_name           :string
#  passport_number         :string
#  passport_issued_at      :date
#  passport_expires_at     :date
#  passport_nationality    :string
#  birth_date              :date
#  encrypted_issued_at     :string
#  encrypted_issued_at_iv  :string
#  encrypted_expires_at    :string
#  encrypted_expires_at_iv :string
#  locale                  :string           default("en"), not null
#  about                   :text
#  mobile                  :string
#  company                 :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
