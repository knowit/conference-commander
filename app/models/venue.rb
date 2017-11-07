# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :string
#  event_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  capacity    :integer
#

class Venue < ApplicationRecord
  belongs_to :event
  has_many :tracks

  def to_s
    name
  end
end
