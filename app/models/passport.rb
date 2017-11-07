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

class Passport < ApplicationRecord

  belongs_to :user

  ATTRIBUTES = %i[first_name last_name number nationality issued_at expires_at]
  ATTRIBUTES.each do |attribute_name|
    attribute attribute_name
    attr_encrypted attribute_name, key: ENV['ENCRYPT_KEY'], salt: ENV['ENCRYPT_SALT']
  end

  def complete?
    ATTRIBUTES.map { |attribute| send(attribute) }.map(&:present?).all?
  end

end
