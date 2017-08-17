class Lock < ApplicationRecord

  belongs_to :lockable, polymorphic: true

end