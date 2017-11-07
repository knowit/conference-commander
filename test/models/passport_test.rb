# == Schema Information
#
# Table name: passports
#
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  encrypted_first_name     :string
#  encrypted_first_name_iv  :string
#  encrypted_last_name      :string
#  encrypted_last_name_iv   :string
#  encrypted_number         :string
#  encrypted_number_iv      :string
#  encrypted_nationality    :string
#  encrypted_nationality_iv :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  encrypted_issued_at      :string
#  encrypted_issued_at_iv   :string
#  encrypted_expires_at     :string
#  encrypted_expires_at_iv  :string
#

require 'test_helper'

class PassportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
