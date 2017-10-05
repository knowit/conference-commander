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
#  encrypted_issued_at               :string
#  encrypted_issued_at_iv            :string
#  encrypted_expires_at              :string
#  encrypted_expires_at_iv           :string
#  encrypted_passport_nationality    :string
#  encrypted_passport_nationality_iv :string
#

class User < ApplicationRecord

  ALLOWED_LOCALES = %i(nb en)

  has_many :participations
  has_many :event_sessions

  has_one :passport

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :locale, presence: true, inclusion: { in: ALLOWED_LOCALES.map(&:to_s) }

  delegate :complete?, to: :passport, prefix: true, allow_nil: true

  accepts_nested_attributes_for :passport

  # Role enum
  enum role: { administrator: 0, organizer: 1, speaker: 2, participant: 3 }
  enum gender: { unspecified: 0, male: 1, female: 2 }

  scope :with_allergies, -> { where("allergies <> ''") }

  def self.find_or_create_by_auth_hash(auth_hash)
    find_or_create_by(email: auth_hash['uid']) do |user|
      user.first_name = auth_hash.dig('info', 'first_name')
      user.last_name = auth_hash.dig('info', 'last_name')
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def complete?
    valid?
  end

  def administrator?
    role == 'administrator'
  end

  def to_s
    full_name
  end

  # We use Gravatar for profile pictures for simplicity
  def profile_picture_url
    hash = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{hash}"
  end

end
