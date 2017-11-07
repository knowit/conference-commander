# == Schema Information
#
# Table name: locks
#
#  id            :integer          not null, primary key
#  lockable_type :string
#  lockable_id   :integer
#  field         :text
#  locked_at     :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Lock < ApplicationRecord

  belongs_to :lockable, polymorphic: true

end
