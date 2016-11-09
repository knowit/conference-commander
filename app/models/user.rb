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

  def self.find_or_initialize_by_auth_hash(auth)
    logger.debug "UID from Crowd: #{auth['uid']}"
    find_or_initialize_by(email: auth['uid'])
  end

end
