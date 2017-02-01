class Track < ApplicationRecord
  belongs_to :schedule
  has_many :proposals
end
