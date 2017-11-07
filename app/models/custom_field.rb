class CustomField < ApplicationRecord
  DATA_TYPES = %w[String DateTime Boolean Integer Float Array]

  belongs_to :customizable, polymorphic: true
  validates :name, :data_type, presence: true
  validates :data_type, inclusion: { in: DATA_TYPES }
end