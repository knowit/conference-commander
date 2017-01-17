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
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_many :participations
  has_many :proposals
  has_many :activity_participations

  validates :name, presence: true
  validates :email, presence: true

  # Role enum
  enum role: { administrator: 0, organizer: 1, speaker: 2, participant: 3 }
  enum gender: { unspecified: 0, male: 1, female: 2 }

  def self.find_or_create_by_auth_hash(auth_hash)
    find_or_create_by(email: auth_hash['uid']) do |user|
      user.name = auth_hash.dig('info', 'name')
    end
  end
end
