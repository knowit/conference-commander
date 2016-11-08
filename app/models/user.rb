# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  email      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :participations

  # Role enum
  enum role: { administrator: 0, organizer: 1, speaker: 2, participant: 3 }

  def self.find_or_create_by_auth_hash(auth)
    find_by_email(auth['uid']) || create! do |user|
      puts auth['uid']
      user.email = auth['uid']
    end
  end
end
