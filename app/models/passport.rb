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

  ATTRIBUTES = %i[first_name last_name number nationality issued_at expires_at]
  ATTRIBUTES.each do |attribute|
    attribute attribute
    attr_encrypted attribute, key: ENV['ENCRYPT_KEY'], salt: ENV['ENCRYPT_SALT']
  end

  def complete?
    ATTRIBUTES.map { |attribute| send(attribute) }.map(&:present?).all?
  end

end
