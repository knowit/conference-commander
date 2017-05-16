# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  email      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :integer          default("participant"), not null
#  gender     :integer          default("unspecified"), not null
#  allergies  :text
#  last_name  :string           default("X"), not null
#

class User < ApplicationRecord

  has_many :participations
  has_many :proposals

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  with_options if: :created_at? do |user|
    user.validates :passport_first_name, presence: true
    user.validates :passport_last_name, presence: true
    user.validates :passport_number, presence: true
    user.validates :passport_issued_at, presence: true
    user.validates :passport_expires_at, presence: true
    user.validates :passport_nationality, presence: true
    user.validates :birth_date, presence: true
  end

  # Role enum
  enum role: { administrator: 0, organizer: 1, speaker: 2, participant: 3 }
  enum gender: { unspecified: 0, male: 1, female: 2 }

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

  def admin?
    role == 'administrator'
  end

end
