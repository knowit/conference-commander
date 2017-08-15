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
#

class Passport < ApplicationRecord

  belongs_to :user

  with_options key: ENV['ENCRYPT_KEY'], salt: ENV['ENCRYPT_SALT'] do |passport|
    passport.attr_encrypted :first_name
    passport.attr_encrypted :last_name
    passport.attr_encrypted :number
    passport.attr_encrypted :nationality
    passport.attr_encrypted :issued_at
    passport.attr_encrypted :expires_at
  end

end
